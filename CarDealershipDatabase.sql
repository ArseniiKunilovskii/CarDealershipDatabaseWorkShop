-- step 1

DROP DATABASE IF EXISTS CarDealership;

CREATE DATABASE IF NOT EXISTS CarDealership;

use CarDealership;

DROP TABLE IF EXISTS dealerships;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS lease_contracts;

-- step 2

CREATE table dealership(
dealership_id int auto_increment primary key,
name varchar(50) NOT NULL,
address varchar(50) NOT NULL,
phone varchar(12) NOT NULL
);

CREATE TABLE vehicles(
VIN varchar(17) primary key not null,
make varchar(50) not null,
model varchar(50) not null,
year int not null,
sold boolean not null,
color varchar(50) not null,
vehicleType varchar(50) not null,
odometer int not null,
price double not null
);

CREATE TABLE inventory(
dealership_id int not null,
VIN varchar(17) not null,

FOREIGN KEY (VIN)  REFERENCES vehicles(VIN),
FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id)
);

CREATE TABLE sales_contracts(
contract_id int primary key not null,
VIN varchar(17) not null,
sale_date date not null,
price decimal(10,2) not null,

FOREIGN KEY (VIN)  REFERENCES vehicles(VIN)
);

CREATE TABLE lease_contracts(
contract_id int primary key not null,
VIN varchar(17) not null,
lease_start date not null,
lease_end date not null,
monthly_payment decimal(10,2) not null,

FOREIGN KEY (VIN)  REFERENCES vehicles(VIN)
);
-- step 3

INSERT INTO dealership (name, address, phone) VALUES
('D&B Auto Sales', '123 Main St, Dallas, TX', '214-555-0101'),
('Reliable Rides', '456 Oak Ave, Austin, TX', '512-555-0202'),
('Luxury Imports', '789 Pine Rd, Houston, TX', '713-555-0303');

INSERT INTO vehicles (VIN, make, model, year, sold, color, vehicleType, odometer, price) VALUES
('1HGCM82633A001111', 'Honda', 'Accord', 2021, 0, 'Silver', 'Sedan', 12000, 24000.00),
('1G1152M0012342222', 'Chevrolet', 'Silverado', 2023, 1, 'Black', 'Truck', 5000, 45000.00),
('JTEBU14R880033333', 'Toyota', 'RAV4', 2022, 0, 'White', 'SUV', 25000, 29500.00),
('WBA33445566778899', 'BMW', '3 Series', 2024, 1, 'Blue', 'Sedan', 1500, 52000.00),
('1FTEW1EP5KFA55555', 'Ford', 'F-150', 2020, 1, 'Red', 'Truck', 45000, 32000.00),
('JN1AZ4EH1DM666666', 'Nissan', 'Altima', 2019, 0, 'Gray', 'Sedan', 50000, 18500.00);

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A001111'), -- Honda at D&B
(1, '1G1152M0012342222'), -- Chevy at D&B
(2, 'JTEBU14R880033333'), -- Toyota at Reliable Rides
(2, '1FTEW1EP5KFA55555'), -- Ford at Reliable Rides
(3, 'WBA33445566778899'), -- BMW at Luxury Imports
(3, 'JN1AZ4EH1DM666666'); -- Nissan at Luxury Imports

INSERT INTO sales_contracts (contract_id, VIN, sale_date, price) VALUES
(101, '1G1152M0012342222', '2023-09-15', 45500.00), -- Chevy Silverado sold
(102, '1FTEW1EP5KFA55555', '2023-10-01', 31500.00); -- Ford F-150 sold

INSERT INTO lease_contracts (contract_id, VIN, lease_start, lease_end, monthly_payment) VALUES
(201, 'WBA33445566778899', '2024-01-01', '2027-01-01', 650.00); -- BMW Leased

