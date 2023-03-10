# Taxi-service

### *Project description:*
A simple web-application that supports authentication, registration and other CRUD operations.

### *Features:*
+ registration like a driver;
+ authentication like a driver;
+ create/delete a manufacturer;
+ create/delete a car;
+ display list of all drivers;
+ display list of all manufacturers;
+ display list of all cars;
+ display list of all current driver cars;
+ add a driver to the car;
+ remove the driver from the car.

### *Used technologies:*
+ Java: Java Core, Java 8, 11 (lambda), OOP, Collections, JDBC;
+ Database: MySQL;
+ Web-server: Apache Tomcat;
+ Tools: Maven, IntelliJ IDEA.

### *How to run:*
1. Clone the repo https://github.com/roman-yuskevych/taxi-service
2. Install MySQL
3. Execute all SQL scripts from **init_db.sql** (*src/main/resources/init_db.sql*) to create a schema and tables for the project
4. Configure **ConnectionUtil.java** (*src/main/java/taxi/util/ConnectionUtil.java*) with your:
    + URL;
    + USERNAME;
    + PASSWORD;
    + JDBC_DRIVER.
5. Configure and start Apache Tomcat v9.0.71
6. Application is ready to use.