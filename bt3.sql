create database my_family_hospital;
use my_family_hospital;
-- bảng khoa
CREATE TABLE Departments (
Dept_ID INT PRIMARY KEY,
Dept_Name VARCHAR(100)

);

create table Patients(
Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
Full_Name VARCHAR(50)
);

-- Bằng Hóa đơn (Kết nôi bệnh nhân và khoa)
CREATE TABLE Invoices (
Invoice_ID INT PRIMARY KEY,
Patient_ID INT,
Dept_ID INT,
Amount DECIMAL(10, 2)
);

-- Chèn dữ liệu mâu
INSERT INTO Departments (Dept_ID, Dept_Name) 
VALUES
 (1, 'Nội'), (2, 'Ngoại');
 
 INSERT INTO Patients (Full_Name)
 values 
 ('Nguyễn Thiên Bảo'), ('Nguyễn Quốc Thắng'), ('Trần Văn Khiêm')
 
INSERT INTO Invoices (Invoice_ID, Patient_ID, Dept_ID, Amount)
VALUES 
(101, 1, 1, 500.00), (102, 2, 1, 300.00), (103, 3, 2, 1000.00); 

-- 1 thiet ke luong du lieu
-- Patients --(Patient_ID)--> Invoices <-- (Dept_ID) -- Departments

create view Department_Revenue_View as
select d.Dept_Name as Department_Name,
count(distinct i.Patient_ID) as Total_Patients,
sum(i.Amount) as Total_Revenue
from Departments d
Join Invoices i
on d.Dept_ID = i.Dept_ID
group by d.Dept_ID, d.Dept_Name;

select * from Department_Revenue_View;

-- khi chạy dòng update hệ thống sẽ báo lỗi và không chạy code
UPDATE Department_Revenue_View
SET Total_Revenue = 2000
WHERE Department_Name = 'Nội';

