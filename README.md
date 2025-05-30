# 🍕 Pizzeria Database & Dashboard Project

![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![Navicat](https://img.shields.io/badge/Tool-Navicat-lightgrey)
![Power BI](https://img.shields.io/badge/Visualization-Power%20BI-yellow)
![CSV Files](https://img.shields.io/badge/Data-CSV-important)
![Connector](https://img.shields.io/badge/MySQL%20Connector-NET%209.3-green)


## 📚 Overview
This project involved designing a **relational database** and building **interactive dashboards** for a pizzeria client.  
The goal was to transform raw CSV files into a clean, normalized database structure and visualize key insights for business decision-making.

---

## 🛠️ Process

### 1. Data Preparation
- Received several CSV files containing all the data such: items name/id, staff name/if, orders, menu items, recipes, prices, inventory and more.
- Cleaned and transformed the data:
  - Renamed fields
  - Changed data types
  - Filtered unnecessary data/fields
  - Aggregated relevant information
- Designed an Entity-Relationship Diagram (ERD) using [QuickDatabaseDiagrams](https://quickdatabasediagrams.com/).

### 2. Database Creation
- Imported the schema into **MySQL** using **Navicat**.
- Set up **Primary Keys** and **Foreign Keys** to maintain referential integrity.
- Populated the tables with the cleaned and structured data.

### 3. Data Aggregation
- Created intermediate/summary tables within Navicat by:
  - Joining relevant tables
  - Aggregating fields
  - Calculating new metrics
- Prepared the data specifically for dashboard visualization.

### 4. Dashboard Development
- Imported the processed data into **Power BI**.
- Used MySQL Connectar/NET 9.3 to connect my aggregation data to PowerBI.
- Built three separate dashboards:
  - **Sales & Revenue**
  - **Inventory Management**
  - **Employee Management**

---

## 📊 Dashboards

### Dashboard 1: Sales & Orders
These are the informations needed by the client:
- 🛒 Total Orders
- 💰 Total Revenue
- 🍕 Total Items Sold
- 📈 Average Order Value
- 🏷️ Sales by Category
- 🏆 Top Selling Items
- 🕒 Orders & Sales by Hour
- 🗺️ Orders by Address
- 🚚 Order Sales as %: Delivery vs Pickup

### Dashboard 2: Inventory Management
- 🧂 Total Inventory by Ingredient and the total cost
- 💵 Total Cost of Ingredients used throughout the day
- 🍽️ Cost & Profit Margin per Menu Item
- 📉 Percentage Stock Remaining by Ingredient

### Dashboard 3: Staff Management
- ⏳ Hours Worked per Staff Member
- 💵 Staff Salaries
- 👥 Total Staff on Selected Day
- 🏦 Total Staff Salary Cost for the Day

---

## 🧰 Tools Used
- **MySQL** (via **Navicat**) — Database Management
- **Quick Database Diagrams** — Schema Design
- **Power BI** — Data Visualization

---

## 📂 Project Structure

/creating_database
    ├── ERD Diagram - database_schema.sql
    ├── SQL Scripts - data_population.sql

/dashboards
    ├── Dashboard_pizzeria.pbix
    Dashboards Name:
    - Orders
    - Inventory
    - Staff Dashboard

/raw_data
    ├── CSV Files (provided by client)

/aggregated_tables
    ├── Summary tables used for dashboards
    ├── select_fields_needed.sql
    ├── orders_ingredients_aggregation.sql
    ├── sales_orders_hourly.sql
    ├── aggregation_staff.sql
    ├── stock_left.sql
    ├── stock_used.sql
    ├── aggregation_saff.sql

