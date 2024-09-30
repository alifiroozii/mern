BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Hospital] (
    [HospitalID] INT NOT NULL IDENTITY(1,1),
    [Name] NVARCHAR(1000) NOT NULL,
    [Location] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Hospital_pkey] PRIMARY KEY CLUSTERED ([HospitalID])
);

-- CreateTable
CREATE TABLE [dbo].[Department] (
    [DepartmentID] INT NOT NULL IDENTITY(1,1),
    [Name] NVARCHAR(1000) NOT NULL,
    [HospitalID] INT NOT NULL,
    CONSTRAINT [Department_pkey] PRIMARY KEY CLUSTERED ([DepartmentID])
);

-- CreateTable
CREATE TABLE [dbo].[Doctor] (
    [DoctorID] INT NOT NULL IDENTITY(1,1),
    [FirstName] NVARCHAR(1000) NOT NULL,
    [LastName] NVARCHAR(1000) NOT NULL,
    [Specialization] NVARCHAR(1000) NOT NULL,
    [DepartmentID] INT NOT NULL,
    CONSTRAINT [Doctor_pkey] PRIMARY KEY CLUSTERED ([DoctorID])
);

-- CreateTable
CREATE TABLE [dbo].[Staff] (
    [StaffID] INT NOT NULL IDENTITY(1,1),
    [FirstName] NVARCHAR(1000) NOT NULL,
    [LastName] NVARCHAR(1000) NOT NULL,
    [Role] NVARCHAR(1000) NOT NULL,
    [DepartmentID] INT,
    [HospitalID] INT NOT NULL,
    CONSTRAINT [Staff_pkey] PRIMARY KEY CLUSTERED ([StaffID])
);

-- CreateTable
CREATE TABLE [dbo].[Patient] (
    [PatientID] INT NOT NULL IDENTITY(1,1),
    [FirstName] NVARCHAR(1000) NOT NULL,
    [LastName] NVARCHAR(1000) NOT NULL,
    [BirthDate] DATETIME2 NOT NULL,
    [ContactInfo] NVARCHAR(1000),
    CONSTRAINT [Patient_pkey] PRIMARY KEY CLUSTERED ([PatientID])
);

-- CreateTable
CREATE TABLE [dbo].[Room] (
    [RoomID] INT NOT NULL IDENTITY(1,1),
    [RoomNumber] NVARCHAR(1000) NOT NULL,
    [Type] NVARCHAR(1000) NOT NULL,
    [DepartmentID] INT NOT NULL,
    [Status] NVARCHAR(1000) NOT NULL,
    [HospitalID] INT NOT NULL,
    CONSTRAINT [Room_pkey] PRIMARY KEY CLUSTERED ([RoomID])
);

-- CreateTable
CREATE TABLE [dbo].[Appointment] (
    [AppointmentID] INT NOT NULL IDENTITY(1,1),
    [PatientID] INT NOT NULL,
    [DoctorID] INT NOT NULL,
    [DepartmentID] INT NOT NULL,
    [Date] DATETIME2 NOT NULL,
    [Reason] NVARCHAR(1000),
    CONSTRAINT [Appointment_pkey] PRIMARY KEY CLUSTERED ([AppointmentID])
);

-- CreateTable
CREATE TABLE [dbo].[Prescription] (
    [PrescriptionID] INT NOT NULL IDENTITY(1,1),
    [PatientID] INT NOT NULL,
    [DoctorID] INT NOT NULL,
    [DateIssued] DATETIME2 NOT NULL,
    CONSTRAINT [Prescription_pkey] PRIMARY KEY CLUSTERED ([PrescriptionID])
);

-- CreateTable
CREATE TABLE [dbo].[Pharmacy] (
    [PharmacyID] INT NOT NULL IDENTITY(1,1),
    [Name] NVARCHAR(1000) NOT NULL,
    [Location] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Pharmacy_pkey] PRIMARY KEY CLUSTERED ([PharmacyID])
);

-- CreateTable
CREATE TABLE [dbo].[PharmacyItem] (
    [PharmacyItemID] INT NOT NULL IDENTITY(1,1),
    [PharmacyID] INT NOT NULL,
    [PrescriptionID] INT NOT NULL,
    [MedicineName] NVARCHAR(1000) NOT NULL,
    [Quantity] INT NOT NULL,
    CONSTRAINT [PharmacyItem_pkey] PRIMARY KEY CLUSTERED ([PharmacyItemID])
);

-- CreateTable
CREATE TABLE [dbo].[Invoice] (
    [InvoiceID] INT NOT NULL IDENTITY(1,1),
    [PatientID] INT NOT NULL,
    [DateIssued] DATETIME2 NOT NULL,
    [Amount] FLOAT(53) NOT NULL,
    [Status] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Invoice_pkey] PRIMARY KEY CLUSTERED ([InvoiceID])
);

-- AddForeignKey
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [Department_HospitalID_fkey] FOREIGN KEY ([HospitalID]) REFERENCES [dbo].[Hospital]([HospitalID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Doctor] ADD CONSTRAINT [Doctor_DepartmentID_fkey] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department]([DepartmentID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Staff] ADD CONSTRAINT [Staff_DepartmentID_fkey] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department]([DepartmentID]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Staff] ADD CONSTRAINT [Staff_HospitalID_fkey] FOREIGN KEY ([HospitalID]) REFERENCES [dbo].[Hospital]([HospitalID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Room] ADD CONSTRAINT [Room_DepartmentID_fkey] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department]([DepartmentID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Room] ADD CONSTRAINT [Room_HospitalID_fkey] FOREIGN KEY ([HospitalID]) REFERENCES [dbo].[Hospital]([HospitalID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Appointment] ADD CONSTRAINT [Appointment_PatientID_fkey] FOREIGN KEY ([PatientID]) REFERENCES [dbo].[Patient]([PatientID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Appointment] ADD CONSTRAINT [Appointment_DoctorID_fkey] FOREIGN KEY ([DoctorID]) REFERENCES [dbo].[Doctor]([DoctorID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Appointment] ADD CONSTRAINT [Appointment_DepartmentID_fkey] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department]([DepartmentID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[Prescription] ADD CONSTRAINT [Prescription_PatientID_fkey] FOREIGN KEY ([PatientID]) REFERENCES [dbo].[Patient]([PatientID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Prescription] ADD CONSTRAINT [Prescription_DoctorID_fkey] FOREIGN KEY ([DoctorID]) REFERENCES [dbo].[Doctor]([DoctorID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[PharmacyItem] ADD CONSTRAINT [PharmacyItem_PharmacyID_fkey] FOREIGN KEY ([PharmacyID]) REFERENCES [dbo].[Pharmacy]([PharmacyID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[PharmacyItem] ADD CONSTRAINT [PharmacyItem_PrescriptionID_fkey] FOREIGN KEY ([PrescriptionID]) REFERENCES [dbo].[Prescription]([PrescriptionID]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [Invoice_PatientID_fkey] FOREIGN KEY ([PatientID]) REFERENCES [dbo].[Patient]([PatientID]) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
