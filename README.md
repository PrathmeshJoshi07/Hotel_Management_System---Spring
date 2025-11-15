🏨 Hotel Management System — Spring MVC (Java)

 A simple Hotel Management Web Application built using Spring MVC, JSP, and Tomcat.
This project allows you to add, list, and delete hotel rooms using an intuitive web interface.

📌 Project Overview

The Hotel Management System is a Java web application implemented using:

     Spring MVC (for controllers + routing)

     JSP (to render UI pages)

     In-Memory Repository (for storing Room objects)

     Tomcat 11 / Jakarta EE 10 compatible setup

The purpose of this project is to demonstrate understanding of:

     ✔ MVC architecture
     ✔ Servlet/JSP/Jakarta stack
     ✔ Spring controllers & dependency injection
     ✔ WAR building and deployment on Tomcat

🎯 Features

🛏️ Room Management

Add a new room with:

Room Number

Room Type

Price

Availability

View all rooms

Delete any room


🧩 MVC Pattern

Model → Room.java

View → rooms.jsp

Controller → RoomController.java

⚙ Spring Features Used

@Controller

@RequestMapping

@GetMapping, @PostMapping

@PathVariable

@Valid and BindingResult

DI using constructor injection


🧰 Tools & Technologies Used

Category	Tools
Language	Java 23
Backend Framework	Spring MVC 6
View Layer	JSP (Jakarta JSP 3.1), JSTL 3.0
Server	Apache Tomcat 11 (Jakarta EE 10)
Build Tool	Maven
IDE	IntelliJ IDEA
Packaging	WAR deployment
Validation	Jakarta Validation API
EL	Jakarta Expression Language
🛠️ Project Requirements


Before running the project, you must have:

✔ Java JDK 17+ (You used Java 23)

Verify:

java -version

✔ Apache Tomcat 11+

Jakarta EE 10 compatible.

✔ Maven 3.8+

Verify:

mvn -version


✔ IntelliJ IDEA (recommended)
🚀 How to Install & Run

Follow these steps exactly 👇

1️⃣ Clone the Repository
git clone  https://github.com/PrathmeshJoshi07/Hotel_Management_System---Spring
cd Hotel_Management_System

2️⃣ Build the Project

Run:

mvn clean package


This creates:

target/Hotel_Management_System-1.0-SNAPSHOT.war

3️⃣ Deploy WAR to Tomcat

Copy WAR → into:

tomcat/webapps/


Start Tomcat (or restart).

Tomcat auto-extracts the WAR to:

tomcat/webapps/Hotel_Management_System/

4️⃣ Run the Application

Open in browser:

http://localhost:8080/Hotel_Management_System/


To open Rooms page:

http://localhost:8080/Hotel_Management_System/rooms

📁 Project Structure
src/
 └── main/
      ├── java/org/example/hotel/
      │       ├── controller/RoomController.java
      │       ├── model/Room.java
      │       ├── repo/RoomRepository.java
      │       ├── repo/InMemoryRoomRepository.java
      │       ├── service/RoomService.java
      │       └── config/WebMvcConfig.java
      │
      └── webapp/
           ├── WEB-INF/web.xml
           └── rooms.jsp

👨‍💻 Role & Responsibilities 

Worked on:

✔ Backend Development

Built controller layer with Spring MVC

Implemented RoomService & Repository

Managed DI using constructor injection


✔ Frontend (JSP)

Designed JSP views

Connected JSP with controller

Handled forms and POST requests


✔ Deployment

Built WAR using Maven

Deployed on Tomcat 11

Fixed JSTL/Jakarta compatibility issues


✔ Configuration

Created WebMvcConfig

Configured ViewResolvers

Set up web.xml for the dispatcher servlet


🛡 Security & Stability Notes

Uses safe DELETE operations via POST method

Avoids reflection errors using @PathVariable("id")

No external database used (in-memory only)
