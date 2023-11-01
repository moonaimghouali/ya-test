import { Injectable, NotFoundException } from '@nestjs/common';
import prismadb from 'prisma/prismaClient';


@Injectable()
export class AppService {

  async AddEmployee(employee : Employee):Promise<Employee> {
    // Insert Employee into database
    const emp = await prismadb.employee.create({ 
      data: employee
    });
    return emp
  }

  async getEmployees():Promise<Employee[]> {
     // Return all Employees from database
    const employees = await prismadb.employee.findMany();
    return employees;
  }

  async getEmployeesByCreationDate(created:string){
     // Return all Employees from database that where saved in the same day
    const employees = await prismadb.employee.findMany({
      where: {
        dateCreated: new Date(created),
      },
    });
    return employees;
  }

  async addEmployeeCheckIn(id:Id) {   
    // checkIn Body
    let body = {
      employeeId : id.id,
      date : new Date(),
      checkIn : new Date(),
    } 

    // Save checkIn time for this day for a given employee
    const empCheck = await prismadb.attendance.create({
      data:body
    })
    return empCheck;
  }

  async addEmployeeCheckOut(body:CheckOut) {
    const now = new Date()

    // Get CheckIn time for a given employee for this day
    const todayAttendance = await prismadb.attendance.findUnique({
      where: {
        employeeId_date:{
          employeeId: body.id,
          date : now
        }
      },
    })
    if(!todayAttendance){
      // If No attandance was found for today return eror message
      // throw new Error('no previous check-in was found for today.')
      throw new NotFoundException('no previous check-in was found for today.')
    }

    // Calculate diffrence time between CheckIn and CheckOut
    const presenceDuration = now.getTime() - todayAttendance.checkIn.getTime()

    // Update today attandance for this employee.
    const attandance = await prismadb.attendance.update({
      where: {
        employeeId_date:{
          employeeId: body.id,
          date : now
        }
      },
      data: {
        checkOut: now,
        comment : body.comment,
        presenceDuration : new Date(presenceDuration)
      },
    })

    return attandance
  }
}
