Create database cd_spring_savetravels;
Use cd_spring_savetravels;

Create table expenses (
	id int primary key auto_increment,
	name text not null,
	description text not null,
	amount text not null,
    vendor text not null,
	createdAt Datetime,
	updatedAt Datetime
);