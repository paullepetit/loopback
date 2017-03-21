DROP TABLE IF EXISTS `tenants`;

CREATE TABLE `tenants` ( 
`ID` INT(10) NOT NULL , 
`UUDI` VARCHAR(37) NOT NULL , 
`SHORTNAME` VARCHAR(45) NOT NULL , 
`FULLNAME` VARCHAR(255) NOT NULL , 
`create-date` DATETIME NOT NULL , 
PRIMARY KEY (`ID`))
ENGINE = InnoDB DEFAULT CHARSET=UTF8;


LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` VALUES ('1','ded1bdca-de00-4b4a-963d-5d56b5cf8cbb','palle','Paul LEPETIT','2016-12-02 00:33:31');
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;