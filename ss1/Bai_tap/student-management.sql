CREATE DATABASE student_management; 
USE student_management;


CREATE TABLE class (
  idClass int NOT NULL,
  name varchar(45) DEFAULT NULL,
  PRIMARY KEY (idClass)
) ;

CREATE TABLE student (
  idStudent int NOT NULL,
  name varchar(45) DEFAULT NULL,
  age int DEFAULT NULL,
  country varchar(45) DEFAULT NULL,
  PRIMARY KEY (idStudent)
) ;

CREATE TABLE `teacher` (
  `idTeacher` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTeacher`)
) 
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy