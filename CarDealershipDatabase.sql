DROP DATABASE IF EXISTS car_dealership;

CREATE DATABASE IF NOT EXISTS car_dealership;

USE car_dealership;

DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS lease_contracts;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS dealerships;

CREATE TABLE dealerships(
dealership_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
phone VARCHAR(12) NOT NULL
);

CREATE TABLE vehicles(
vin VARCHAR(17) PRIMARY KEY,
make VARCHAR(50) NOT NULL,
model  VARCHAR(50) NOT NULL,
year INT NOT NULL,
sold boolean NOT NULL,
color VARCHAR(50) NOT NULL,
vehicleType VARCHAR(50) NOT NULL,
odometer INT NOT NULL,
price DOUBLE NOT NULL
);

CREATE TABLE lease_contracts(
contract_id INT AUTO_INCREMENT PRIMARY KEY,
vin VARCHAR(17) NOT NULL,
lease_start date NOT NULL,
lease_end date NOT NULL,
monthly_payment decimal(10, 2) NOT NULL,
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

CREATE TABLE sales_contracts(
contract_id INT AUTO_INCREMENT PRIMARY KEY,
vin VARCHAR(17) NOT NULL,
sale_date date NOT NULL,
price DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

CREATE TABLE inventory(
dealership_id INT,
vin VARCHAR(17) NOT NULL,
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

INSERT INTO dealerships (dealership_id, name, address, phone)
VALUES
(98932, 'Jackson', '130 Blue Street', '235-123-1232');


INSERT INTO vehicles (vin, make, model, year, sold, color, vehicleType, odometer, price)
VALUES
('78873', 'Audi', 'A4', '2023', true, 'blue', 'car', 23546, 24599.00),
('32543', 'Subaru', 'Ascent', '2021', true, 'red', 'van', 65431, 18599.99),
('20202', 'Toyota', 'C7', '2023', false, 'green', 'car', 51546, 5459.20),
('56565', 'Subaru', 'A5', '2021', false, 'purple', 'truck', 78467, 38199.99);

INSERT INTO lease_contracts (contract_id, vin, lease_start, lease_end, monthly_payment)
VALUES
(7070, '56565', '2024-04-01', '2025-04-01', 950.00),
(8282, '20202', '2022-01-02', '2023-04-02', 780.59);

INSERT INTO sales_contracts (contract_id, vin, sale_date, price)
VALUES
(9090, '78873', '2019-04-01', 950.00),
(3131, '32543', '2021-01-04', 780.59);

INSERT INTO inventory (dealership_id, vin)
VALUES
(98932, '78873'),
(98932, '56565'),
(98932, '20202'),
(98932, '32543');

SELECT * FROM vehicles