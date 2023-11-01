/*
  Warnings:

  - You are about to drop the column `date_created` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `first_name` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `last_name` on the `Employee` table. All the data in the column will be lost.
  - The primary key for the `EmployeesCheck` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `check_in` on the `EmployeesCheck` table. All the data in the column will be lost.
  - You are about to drop the column `check_out` on the `EmployeesCheck` table. All the data in the column will be lost.
  - You are about to drop the column `employee_id` on the `EmployeesCheck` table. All the data in the column will be lost.
  - You are about to drop the column `presence_duration` on the `EmployeesCheck` table. All the data in the column will be lost.
  - Added the required column `firstName` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastName` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `checkIn` to the `EmployeesCheck` table without a default value. This is not possible if the table is not empty.
  - Added the required column `checkOut` to the `EmployeesCheck` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employeeId` to the `EmployeesCheck` table without a default value. This is not possible if the table is not empty.
  - Added the required column `presenceDuration` to the `EmployeesCheck` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "EmployeesCheck" DROP CONSTRAINT "EmployeesCheck_employee_id_fkey";

-- AlterTable
ALTER TABLE "Employee" DROP COLUMN "date_created",
DROP COLUMN "first_name",
DROP COLUMN "last_name",
ADD COLUMN     "dateCreated" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "firstName" TEXT NOT NULL,
ADD COLUMN     "lastName" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "EmployeesCheck" DROP CONSTRAINT "EmployeesCheck_pkey",
DROP COLUMN "check_in",
DROP COLUMN "check_out",
DROP COLUMN "employee_id",
DROP COLUMN "presence_duration",
ADD COLUMN     "checkIn" TIMESTAMP NOT NULL,
ADD COLUMN     "checkOut" TIMESTAMP NOT NULL,
ADD COLUMN     "employeeId" TEXT NOT NULL,
ADD COLUMN     "presenceDuration" TIME NOT NULL,
ADD CONSTRAINT "EmployeesCheck_pkey" PRIMARY KEY ("employeeId", "date");

-- AddForeignKey
ALTER TABLE "EmployeesCheck" ADD CONSTRAINT "EmployeesCheck_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
