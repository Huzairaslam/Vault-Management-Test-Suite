@echo off
echo ============================================
echo 🚀 Starting Robot Framework Test Suite
echo ============================================
echo.

REM 1️⃣ Activate virtual environment
call venv\Scripts\activate

REM 2️⃣ Clean old Allure results
if exist results (
    rmdir /s /q results
)
mkdir results

REM 3️⃣ Run all robot test files with Allure listener
echo Running test cases...
robot --listener "allure_robotframework;results" FileConfig.robot
robot --listener "allure_robotframework;results" Dashboard.robot
robot --listener "allure_robotframework;results" ProductTypes.robot
robot --listener "allure_robotframework;results" Products.robot
robot --listener "allure_robotframework;results" StorageType.robot
robot --listener "allure_robotframework;results" Storages.robot

echo.
echo ✅ Test execution completed.
echo.

REM 4️⃣ Deactivate virtual environment
deactivate

REM 5️⃣ Serve Allure report
echo 🌐 Serving Allure Report...
allure serve results
echo.
echo ============================================
echo ✅ All Done! Report served successfully.
echo ============================================
pause
