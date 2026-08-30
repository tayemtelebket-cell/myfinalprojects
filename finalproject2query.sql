create database HospitalDB;
go
use HospitalDB
go
create table Departments(
dept_id int,
dept_name varchar(100) not null,
location varchar(100),
constraint pk_departments primary key(dept_id),
constraint uniq_dep_name unique(dept_name)
);
create table Doctors(
doctor_id int,
full_name varchar(100) not null,
speciality varchar(80),
salary decimal(9,2),
dept_id int,
constraint pk_doctors primary key(doctor_id),
constraint fk_Departments_doctors foreign key(dept_id) references Departments(dept_id),
constraint checksalary check(salary>0)
);
create table Patients(
patient_id int,
full_name varchar(100) not null,
age int,
gender varchar(10),
phone varchar(20),
join_date date,
constraint pk_patients primary key(patient_id),
constraint checkage check(age>=0 and age<=120),
constraint uniqphone unique(phone)
);
create table Appointments(
appt_id int,
patient_id int,
doctor_id int,
appt_date date not null,
status varchar(20) not null,
constraint pk_appointments primary key(appt_id),
constraint fk_patient_appt foreign key(patient_id) references Patients(patient_id),
constraint fk_doctor_appt foreign key(doctor_id) references Doctors(doctor_id),
constraint choiceofstatus check(status in ('Scheduled','Completed','Cancelled'))
);
go
alter table Doctors
alter column speciality varchar(150);
go
alter table Patients
add email varchar(120);
go
alter table Patients
add constraint UQ_Patients_Email unique(email);
go
insert into Departments values
(1,'Cardiology','Building A-Floor 2'),
(2,'Orthopedics','Building B-Floor 1'),
(3,'Pediatrics','Building A-Floor 3'),
(4,'General Surgery','Building C-Floor 1');
go
insert into Doctors values
(1,'Dr.Amira Hassan','Cardiology',18000.00,1),
(2,'Dr.Karim Saleh','Orthopedic Surgery',15500.00,2),
(3,'Dr.Nour El-Din','Pediatrics',14000.00,3),
(4,'Dr.Sara Mostafa','General Surgery',16000.00,4),
(5,'Dr.Omar Farouk','Cardiology',17500.00,1);
go
insert into Patients values
(1,'Ahmed Ali',45,'Male','0111-234-5678','2024-01-15','ahmed@example.com'),
(2,'Sara Khaled',32,'Female','0122-345-6789','2024-01-20','sara@example.com'),
(3,'Mohamed Gamal',52,'Male','0133-456-7890','2024-02-01','mohamed@example.com'),
(4,'Layla Nasser',28,'Female','0144-567-8901','2024-02-10','layla@example.com'),
(5,'Youssef Adel',NULL,'Male',NULL,'2024-03-05','youssef@example.com');
go
alter table Appointments
add purpose varchar(100);
go
insert into Appointments values
(1,1,1,'2024-03-10','Completed','Follow-up after surgery'),
(2,2,3,'2024-03-12','Completed',NULL),
(3,3,2,'2024-03-15','Scheduled',NULL),
(4,1,5,'2024-03-18','Scheduled','Chest Pain Complaint'),
(5,4,4,'2024-03-20','Cancelled','Patient requested Cancellation'),
(6,2,1,'2024-03-22','Scheduled',NULL);
go
update Patients set age=25 where patient_id=3;
go
select * from Patients where patient_id=3;
go
update Doctors set salary=salary+salary*0.10 where salary<16000;
go
update Appointments set status='Completed' where status='Scheduled' and appt_date<'2024-03-15';
go
delete from Appointments where appt_id=5;
go
select * from Appointments;
go
select * from Patients;
go
select full_name,speciality from Doctors;
go
select * from Appointments where status='Scheduled';
go
select * from Patients where phone is NULL;
go
/* used method wasnt taken in course as we havent taken how to
sort null objects and put at last */
select full_name, age
from (
    select full_name, age, 0 as sort_order
    from Patients
    where age is not null

    union all

    select full_name, age, 1 as sort_order
    from Patients
    where age is null
) as x
order by sort_order, age;

go
select patient_id,full_name as 'Patient Full name' from Patients;
go
select * from Patients where age>30 and gender='Female' and phone is not null;
go
select count(*) from Patients;
select count(age) from Patients;
go
select max(salary) as Max_Salary,min(salary) as Min_Salary,avg(salary) as Avg_Salary from Doctors;
go
select d.doctor_id,count(a.appt_id) as Total_appts 
from Doctors d
join Appointments a
ON a.doctor_id=d.doctor_id
group by d.doctor_id
order by count(a.appt_id) desc;
go
select d.dept_id,count(a.appt_id) as Total_Appts
from Doctors d
join Appointments a
ON a.doctor_id=d.doctor_id
group by d.dept_id
having count(a.appt_id)>1;
go
select p.full_name,d.full_name,a.appt_date,a.status
from Appointments a
join Patients p
on a.patient_id=p.patient_id
join Doctors d
on a.doctor_id=d.doctor_id;
go
select d.full_name,a.appt_date,a.status from Doctors d
left join Appointments a
ON a.doctor_id=d.doctor_id;
go
    select d.dept_name,s.full_name from Departments d
    left join Doctors s
    ON d.dept_id=s.dept_id;
go
select full_name,salary from Doctors
where salary>(select avg(salary) from Doctors);
go
select full_name,phone from Patients
where patient_id in (select patient_id from Appointments);
go
select full_name,join_date from Patients
where patient_id not in (select patient_id from Appointments where patient_id is not null);
go
select d.full_name,s.dept_name,count(a.appt_id) as no_of_appts,count(case when a.status='Completed' then 1 end) as completed_appts from Doctors d
join Departments s --using where would have filtered the table and no. of appts will be = to no. og completed
--so case command had to be used 
ON s.dept_id=d.dept_id
join Appointments a 
ON a.doctor_id=d.doctor_id
group by s.dept_name,d.full_name;
drop table Appointments;
go
drop table Doctors;
go
drop table Patients;
go
drop table Departments;
go
drop database HospitalDB;
/* we have to drop child first aka table containing foreign key coz if we did the opposite we 
will have an error as we are trying to drop a table another table relies on it*/

