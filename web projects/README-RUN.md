# Vehicle System - Sri Drive

## How to Run

### Option 1: Double-click run.bat (Recommended)
1. **Start MySQL** - Ensure MySQL Server is running with the `vehicle_service` database
2. **Stop Eclipse Tomcat** (if running) - Port 8081 is used to avoid conflicts
3. Double-click **`run.bat`** in the `web projects` folder
4. Open your browser: **http://localhost:9090/vehicle_system/**

### Option 2: Command line
```bash
cd "web projects"
mvnw.cmd tomcat7:run
```
Then open: **http://localhost:9090/vehicle_system/**

### Database
- **Host:** localhost:3306
- **Database:** vehicle_service
- **User:** root
- **Password:** 1234

Update these in `src/main/java/util/DBconnect.java` if your setup differs.

### Port 8081
The app uses port **9090** to avoid conflicts with Eclipse's Tomcat (8080).
