# JSP CRUD Web Application

A Java-based web application for managing employee records using JSP, JSTL, MySQL, and JDBC/JNDI-based database connectivity. The application provides a simple interface to perform Create, Read, Update, and Delete operations on employee data.

## Features

* Add new employee records
* View all employees
* Update selected employee fields
* Delete employee records
* Dynamic employee ID selection
* MySQL database integration
* JSP and JSTL-based dynamic web pages
* Container-managed DataSource using JNDI
* Automatic employee data reloading
* Simple and user-friendly interface

## Technologies Used

* Java 8
* JSP
* JSTL
* JDBC
* JNDI
* MySQL
* Apache Tomcat 10.1
* Maven
* HTML5
* CSS3

## Employee Details

The application manages the following employee information:

* Employee ID
* First Name
* Last Name
* Age
* Phone Number
* Join Date
* Department

## CRUD Operations

### Create

Add a new employee by entering the employee details through the JSP form.

### Read

View all employee records stored in the MySQL `employees` table.

### Update

Select an employee and choose the fields that need to be updated.

### Delete

Select an employee ID and remove the corresponding record from the database.

## Project Structure

```text
CRUDProject/
├── src/
│   └── main/
│       ├── java/
│       │   └── sl314/
│       │       ├── myclasses/
│       │       │   └── Data.java
│       │       ├── mylisteners/
│       │       │   └── MyListener.java
│       │       └── mythreads/
│       │           └── Reloader.java
│       │
│       └── webapp/
│           ├── META-INF/
│           │   └── context.xml
│           ├── WEB-INF/
│           │   └── web.xml
│           ├── index.jsp
│           ├── insert.jsp
│           ├── select.jsp
│           ├── update.jsp
│           └── delete.jsp
│
└── pom.xml
```

## Database Configuration

The application uses MySQL with a database named `javaschema` and an `employees` table.

The configured employee fields are:

```text
id
firstName
lastName
age
phoneNumber
join_date
department
```

Update the database credentials in the project's configuration before running the application.

## JNDI DataSource

The application configures a MySQL DataSource through Tomcat JNDI:

```text
jdbc/TestDB
```

The application obtains the DataSource using JNDI and establishes the database connection during application startup.

## Application Flow

```text
JSP Interface
     ↓
JSTL / SQL Tags
     ↓
MySQL Database
     ↓
Employee Records
```

A ServletContextListener initializes the database connection when the application starts. A scheduled task periodically reloads employee data so that the displayed records remain updated.

## Setup and Run

### Prerequisites

* JDK 8 or compatible Java environment
* Apache Tomcat 10.1
* MySQL Server
* Maven
* Eclipse or another Java web development IDE

### Steps

1. Clone the repository.
2. Create the required MySQL database and `employees` table.
3. Update the MySQL connection details in `context.xml`.
4. Import the project as a Maven Web Application.
5. Configure Apache Tomcat 10.1.
6. Build and deploy the project.
7. Start the Tomcat server.
8. Open the application in your browser.

## Build

Run the following Maven command:

```bash
mvn clean package
```

The generated WAR file can be deployed to Apache Tomcat.

## Project Highlights

* JSP-based employee management interface
* JSTL SQL tags for database operations
* JDBC-based MySQL connectivity
* JNDI-based container-managed DataSource
* ServletContextListener for application lifecycle management
* Scheduled background data reloading
* Maven-based WAR project

## Author

**Chan1407**
