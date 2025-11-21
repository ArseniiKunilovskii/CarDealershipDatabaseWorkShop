-- step 4

-- 1
SELECT * FROM cardealership.dealership;

-- 2
Select * from vehicles v
join inventory i on v.VIN = i.VIN 
where dealership_id = 1;

-- 3
select * from vehicles 
where Vin = "1HGCM82633A001111";

-- 4
select dealership_id from inventory
where Vin = "1HGCM82633A001111";

-- 5
select d.dealership_id from dealership d 
join inventory i on d.dealership_id = i.dealership_id
join vehicles v on i.VIN = v.VIN
where v.vehicleType = "truck"
order by d.dealership_id; 

-- 6
select * from sales_contracts s
join inventory i on s.VIN = i.VIN
where sale_date between "2023-09-01" and "2023-09-30";

