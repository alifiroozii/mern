/*
  Warnings:

  - You are about to drop the column `Date` on the `Appointment` table. All the data in the column will be lost.
  - You are about to drop the column `Reason` on the `Appointment` table. All the data in the column will be lost.
  - You are about to drop the column `Name` on the `Department` table. All the data in the column will be lost.
  - You are about to drop the column `FirstName` on the `Doctor` table. All the data in the column will be lost.
  - You are about to drop the column `LastName` on the `Doctor` table. All the data in the column will be lost.
  - You are about to drop the column `Specialization` on the `Doctor` table. All the data in the column will be lost.
  - You are about to drop the column `Location` on the `Hospital` table. All the data in the column will be lost.
  - You are about to drop the column `Name` on the `Hospital` table. All the data in the column will be lost.
  - You are about to drop the column `Amount` on the `Invoice` table. All the data in the column will be lost.
  - You are about to drop the column `DateIssued` on the `Invoice` table. All the data in the column will be lost.
  - You are about to drop the column `Status` on the `Invoice` table. All the data in the column will be lost.
  - You are about to drop the column `BirthDate` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `ContactInfo` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `FirstName` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `LastName` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `Location` on the `Pharmacy` table. All the data in the column will be lost.
  - You are about to drop the column `Name` on the `Pharmacy` table. All the data in the column will be lost.
  - You are about to drop the column `MedicineName` on the `PharmacyItem` table. All the data in the column will be lost.
  - You are about to drop the column `Quantity` on the `PharmacyItem` table. All the data in the column will be lost.
  - You are about to drop the column `DateIssued` on the `Prescription` table. All the data in the column will be lost.
  - You are about to drop the column `RoomNumber` on the `Room` table. All the data in the column will be lost.
  - You are about to drop the column `Status` on the `Room` table. All the data in the column will be lost.
  - You are about to drop the column `Type` on the `Room` table. All the data in the column will be lost.
  - You are about to drop the column `FirstName` on the `Staff` table. All the data in the column will be lost.
  - You are about to drop the column `LastName` on the `Staff` table. All the data in the column will be lost.
  - You are about to drop the column `Role` on the `Staff` table. All the data in the column will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[Appointment] DROP COLUMN [Date],
[Reason];

-- AlterTable
ALTER TABLE [dbo].[Department] DROP COLUMN [Name];

-- AlterTable
ALTER TABLE [dbo].[Doctor] DROP COLUMN [FirstName],
[LastName],
[Specialization];

-- AlterTable
ALTER TABLE [dbo].[Hospital] DROP COLUMN [Location],
[Name];

-- AlterTable
ALTER TABLE [dbo].[Invoice] DROP COLUMN [Amount],
[DateIssued],
[Status];

-- AlterTable
ALTER TABLE [dbo].[Patient] DROP COLUMN [BirthDate],
[ContactInfo],
[FirstName],
[LastName];

-- AlterTable
ALTER TABLE [dbo].[Pharmacy] DROP COLUMN [Location],
[Name];

-- AlterTable
ALTER TABLE [dbo].[PharmacyItem] DROP COLUMN [MedicineName],
[Quantity];

-- AlterTable
ALTER TABLE [dbo].[Prescription] DROP COLUMN [DateIssued];

-- AlterTable
ALTER TABLE [dbo].[Room] DROP COLUMN [RoomNumber],
[Status],
[Type];

-- AlterTable
ALTER TABLE [dbo].[Staff] DROP COLUMN [FirstName],
[LastName],
[Role];

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
