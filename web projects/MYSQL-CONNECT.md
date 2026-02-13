# MySQL Connection Guide – Sri Drive

## Step 1: Start MySQL
- Open **MySQL Workbench** or ensure **MySQL Server** is running
- Default port: **3306**

## Step 2: Create database and admin user

1. Open **MySQL Workbench**
2. Connect to your local MySQL server (usually `localhost` / `root`)
3. Open `database_setup.sql` and run the whole script  
   - Or copy its contents into a new query and run it
4. This creates the `vehicle_service` database and adds an admin user:
   - **Email:** `admin@sridrive.com`
   - **Password:** `admin123`

## Step 3: Match your MySQL password in code

Open `src/main/java/util/DBconnect.java` and set the password that matches your MySQL `root` user:

```java
String username = "root";
String password = "1234";   // change this if your MySQL root password is different
```

If your root password is empty, use `""`  
If it is different, use your actual root password.

## Step 4: Restart the application

1. Stop the server (Ctrl+C if running from terminal)
2. Run `run.bat` or `mvnw.cmd tomcat7:run` again
3. Log in with: **admin@sridrive.com** / **admin123**

---

## Troubleshooting

| Issue | What to do |
|-------|------------|
| "Invalid email or password" | Check MySQL is running, database exists, admin user is inserted, and password in `DBconnect.java` is correct |
| "Access denied for user 'root'" | Fix the password in `DBconnect.java` to match your MySQL root password |
| "Unknown database 'vehicle_service'" | Run `database_setup.sql` in MySQL Workbench |
| "Table 'user' doesn't exist" | Run `database_setup.sql`; it creates the `user` table |
| Console shows `SQLException` or `Communications link failure` | Confirm MySQL Server is running and listening on port 3306 |
