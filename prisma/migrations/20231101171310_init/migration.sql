/*
  Warnings:

  - You are about to drop the `EmployeesCheck` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "EmployeesCheck" DROP CONSTRAINT "EmployeesCheck_employeeId_fkey";

-- DropTable
DROP TABLE "EmployeesCheck";

-- CreateTable
CREATE TABLE "Attendance" (
    "employeeId" TEXT NOT NULL,
    "date" DATE NOT NULL,
    "checkIn" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "checkOut" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "comment" TEXT DEFAULT '',
    "presenceDuration" TIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Attendance_pkey" PRIMARY KEY ("employeeId","date")
);

-- AddForeignKey
ALTER TABLE "Attendance" ADD CONSTRAINT "Attendance_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
