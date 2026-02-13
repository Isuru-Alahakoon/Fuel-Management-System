# Vehicle Fuel System

## Project Overview
The **Vehicle Fuel System** is a web-based application developed using **Java (Eclipse IDE)**, **Apache Tomcat Server**, and **MySQL Database**.  
It is designed to manage fuel stations efficiently by supporting multiple user roles, tracking fuel inventory, handling customer orders, and maintaining transaction records.  

The system has four main user roles:
- **Admin**
- **Customer**
- **Station Manager**
- **Attendant**

---

## Technology Stack
- **Backend:** Java Servlets & JSP  
- **Server:** Apache Tomcat  
- **Database:** MySQL  
- **IDE:** Eclipse  
- **Frontend:** HTML, CSS, JSP  

---

## Features by Role

### 1. Admin
The Admin is the highest-level user and manages the entire system. Functions include:
- **User Management:**  
  - Add, edit, delete users (Customer, Station Manager, Attendant)  
  - Assign roles to users  
- **Station Management:**  
  - Add, edit, delete fuel stations  
  - Monitor station performance and fuel availability  
- **Report Generation:**  
  - Generate daily, weekly, monthly sales reports  
  - Track transactions by station, attendant, and customer  
- **System Settings:**  
  - Manage fuel types and prices  
  - Configure system parameters  

### 2. Customer
Customers can request fuel and track their transactions. Functions include:
- **Account Management:**  
  - Register and login  
  - Update profile details  
- **Fuel Ordering:**  
  - View available fuel types and prices  
  - Place fuel orders  
  - Cancel pending orders  
- **Transaction History:**  
  - View past orders and payments  
  - Print or download receipts  

### 3. Station Manager
The Station Manager oversees daily operations at a fuel station. Functions include:
- **Inventory Management:**  
  - Track fuel availability and stock levels  
  - Update fuel stock after deliveries  
- **Attendant Management:**  
  - Monitor attendant activity and performance  
  - Assign duties or shifts  
- **Sales Tracking:**  
  - View real-time sales at the station  
  - Generate station-specific sales reports  
- **Customer Interaction:**  
  - Handle customer complaints or feedback  

### 4. Attendant
Attendants are responsible for dispensing fuel and recording transactions. Functions include:
- **Fuel Dispensing:**  
  - Record fuel dispensed to vehicles  
  - Select fuel type and quantity  
- **Transaction Recording:**  
  - Update sales transactions in the system  
  - Issue receipts to customers  
- **Inventory Updates:**  
  - Notify station manager when stock is low  
- **Customer Assistance:**  
  - Help customers with fuel requests  

---

## Installation & Setup

1. **Clone the Repository**  
   ```bash
   git clone <repository-url>
