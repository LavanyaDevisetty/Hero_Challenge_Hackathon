CREATE DATABASE HERO_CHALLENGE;

CREATE SCHEMA HERO_CHALLENGE.DIM;

CREATE SCHEMA HERO_CHALLENGE.FACT;

CREATE OR REPLACE TABLE HERO_CHALLENGE.DIM.T_TOURSIT_SITE(
    Site_ID VARCHAR(255) PRIMARY KEY ,
    Site_Name VARCHAR(255) NOT NULL,
    State VARCHAR(100),
    City VARCHAR(100),
    Type VARCHAR(100),           -- e.g., Museum, Festival, Monument
    Accessibility VARCHAR(255),  -- e.g., Road, Air, Rail details
    Visitor_Capacity INT
);

CREATE OR REPLACE TABLE HERO_CHALLENGE.DIM.T_ART_FORMS(
    Art_ID VARCHAR(255) PRIMARY KEY  ,
    Art_Name VARCHAR(255) NOT NULL,
    Region VARCHAR(100),
    Description TEXT,
    Status VARCHAR(255) DEFAULT 'Active' --ENUM('Active', 'Declining', 'Endangered') 
);

CREATE OR REPLACE TABLE HERO_CHALLENGE.DIM.T_Tourists(
    Tourist_ID VARCHAR(255) PRIMARY KEY ,
    Age INT,
    Gender VARCHAR(255) ,--ENUM('Male', 'Female', 'Other'),
    Nationality VARCHAR(100),
    VisitDate DATE,
    Site_ID INT,
    Purpose VARCHAR(255), --ENUM('Culture', 'Adventure', 'Leisure', 'Business', 'Other'),
    Spend_Amount DECIMAL(10,2)
);

CREATE OR REPLACE TABLE HERO_CHALLENGE.DIM.T_Events(
    Event_ID VARCHAR(255) PRIMARY KEY ,
    Event_Name VARCHAR(255) NOT NULL,
    Site_ID INT,
    Start_Date DATE,
    End_Date DATE,
    Expected_Attendance INT 
);

CREATE OR REPLACE TABLE HERO_CHALLENGE.FACT.T_Economic_Impact(
    Site_ID VARCHAR(255),
    Year INT,
    Ticket_Revenue DECIMAL(15,2),
    Local_Spending DECIMAL(15,2),
    Employment_Generated INT,
    PRIMARY KEY (Site_ID, Year) 
);

CREATE OR REPLACE TABLE HERO_CHALLENGE.DIM.T_Feedback(
    Feedback_ID VARCHAR(255) PRIMARY KEY ,
    Tourist_ID INT,
    Site_ID INT,
    Rating INT ,--CHECK (Rating BETWEEN 1 AND 5),
    Comments TEXT,
    FeedbackDate DATE 
);