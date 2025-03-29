create database HospitalManagementSystem;
use HospitalManagementSystem;

CREATE TABLE Staff (
StaffID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Role VARCHAR(50),
Phone VARCHAR(15),
Email VARCHAR(100)
);
INSERT INTO Staff (FirstName, LastName, Role, Phone, Email) VALUES
('Alice', 'Williams', 'Nurse', '444-555-6666', 'alice.williams@example.com'),
('Bob', 'Miller', 'Administrative', '555-666-7777', 'bob.miller@example.com'),
('Charlie', 'Garcia', 'Receptionist', '666-777-8888', 'charlie.garcia@example.com');
select * from Staff;

CREATE TABLE Payment(
BillID INT PRIMARY KEY AUTO_INCREMENT,
PatientID INT,
Amount DECIMAL(10, 2),
DateIssued DATE,
Status ENUM('Paid', 'Unpaid'),
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
INSERT INTO Payment(PatientID, Amount, DateIssued, Status) VALUES
(1, 150.00, '2024-10-10', 'Unpaid'),
(2, 200.00, '2024-10-11', 'Unpaid'),
(3, 100.00, '2024-10-12', 'Paid');
select * from Payment;


CREATE TABLE MedicalRecords (
RecordID INT PRIMARY KEY AUTO_INCREMENT,
PatientID INT,
DoctorID INT,
DateOfVisit DATE,
Diagnosis TEXT,
Treatment TEXT,
Notes TEXT,
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

INSERT INTO MedicalRecords (PatientID, DoctorID, DateOfVisit, Diagnosis, Treatment, Notes) VALUES
(1, 1, '2024-10-10', 'Hypertension', 'Prescribed medication', 'Follow up in 1 month'),
(2, 2, '2024-10-11', 'Migraine', 'Medication and lifestyle changes', 'Monitor symptoms'),
(3, 3, '2024-10-12', 'Routine check-up', 'All clear', 'Continue regular visits');

select * from MedicalRecords;

CREATE TABLE Appointments (
AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
PatientID INT,
DoctorID INT,
AppointmentDate DATE,
AppointmentTime TIME,
Status ENUM('Scheduled', 'Completed', 'Canceled'),
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status) VALUES
(1, 1, '2024-10-10', '09:00:00', 'Scheduled'),
(2, 3, '2024-10-11', '10:30:00', 'Scheduled'),
(3, 2, '2024-10-12', '11:00:00', 'Scheduled');

select * From Appointments;

CREATE TABLE Doctor (
DoctorID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Specialty VARCHAR(100),
Phone VARCHAR(15),
Email VARCHAR(100),
LicenseNumber VARCHAR(50)
);

INSERT INTO Doctor (FirstName, LastName, Specialty, Phone, Email, LicenseNumber) VALUES
('Dr. Emily', 'White', 'Cardiology', '111-222-3333', 'emily.white@example.com', 'L1234567'),
('Dr. Mark', 'Brown', 'Neurology', '222-333-4444', 'mark.brown@example.com', 'L7654321'),
('Dr. Sarah', 'Davis', 'Pediatrics', '333-444-5555', 'sarah.davis@example.com', 'L9876543');


select * from Doctor;

CREATE TABLE Patients (
PatientID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
DateOfBirth DATE,
Gender ENUM('Male', 'Female', 'Other'),
Phone VARCHAR(15),
Address TEXT,
Email VARCHAR(100)
);

INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, Phone, Address, Email) VALUES
('John', 'Doe', '1985-06-15', 'Male', '123-456-7890', '123 Elm St, Springfield', 'john.doe@example.com'),
('Jane', 'Smith', '1990-03-25', 'Female', '987-654-3210', '456 Oak St, Springfield', 'jane.smith@example.com'),
('Alice', 'Johnson', '1975-11-30', 'Female', '555-123-4567', '789 Pine St, Springfield', 'alice.j@example.com');

select * From Patients;