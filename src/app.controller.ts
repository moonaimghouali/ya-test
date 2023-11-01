import { Controller, Get, Post, Patch, Body, Query, Param, NotFoundException } from '@nestjs/common';
import { AppService } from './app.service';


@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Post('/employees')
  async AddEmployee(@Body() employee: Employee): Promise<Employee>{
    try {
      return this.appService.AddEmployee(employee);
    } catch (error) {
      console.error(error.message)
    }
  }

  @Get('/employees')
  async getEmployees(@Query('created') created):Promise<Employee[]>{  
    try {
      if (created) return this.appService.getEmployeesByCreationDate(created);
      else return this.appService.getEmployees();
    } catch (error) {
      console.error(error.message)
    }
  }

  @Post('/check-in')
  async addEmployeeCheckIn(@Body() id: Id) {
    try {
      return this.appService.addEmployeeCheckIn(id);
    } catch (error) {
      console.error(error.message)
    }
  }

  @Patch('/check-out')
  async addEmployeeCheckOut(@Body() body:CheckOut) {
    try {
      return this.appService.addEmployeeCheckOut(body);
    } catch (error) {
      throw new NotFoundException()
    }
  }
}
