create database Accident
use Accident
select * from road_accidents_sample


CREATE TABLE Accidents (
    Accident_ID INT PRIMARY KEY,
    Date DATE,
    Time TIME,
    Location VARCHAR(255),
    Weather_Conditions VARCHAR(100),
    Road_Type VARCHAR(100),
    Light_Conditions VARCHAR(100),
    Number_of_Casualties INT,
    Vehicle_Type VARCHAR(100),
    Accident_Severity VARCHAR(50),
    Speed_Limit INT,
    Urban_or_Rural VARCHAR(50)
);


--SQL Analysis

--High Casualty Locations

SELECT Location, SUM(Number_of_Casualties) AS TotalCasualties
FROM road_accidents_sample
GROUP BY Location
ORDER BY TotalCasualties DESC;


-- Accidents by Light Condition

SELECT Light_Conditions, COUNT(*) AS AccidentCount
FROM road_accidents_sample
GROUP BY Light_Conditions;


-- Accidents by Weather
SELECT Weather_Conditions, COUNT(*) AS TotalAccidents
FROM road_accidents_sample
GROUP BY Weather_Conditions;

--Hourly Pattern

SELECT DATEPART(HOUR, Time) AS Hour, COUNT(*) AS AccidentCount
FROM road_accidents_sample
GROUP BY DATEPART(HOUR, Time)
ORDER BY Hour;

-- Vehicle Type vs Severity

SELECT Vehicle_Type, Accident_Severity, COUNT(*) AS Count
FROM road_accidents_sample
GROUP BY Vehicle_Type, Accident_Severity;
