# EDIT Employee table to add new role 
ALTER TABLE  Employee
MODIFY COLUMN Role ENUM('Sales', 'Guide', 'Accountant', 'Analyst');

# ADD new Employee
INSERT INTO `mydb`.`Employee` (`idEmployee`, `Name`, `Surname`, `Email`, `Role`, `Salary`) VALUES
(7, 'new', 'employee', 'newemployee@travel.com','Analyst', 5000.00);

# QUERY TO FIND MOST POPULAR DESTINATION
SELECT 
    d.`Destination Name` AS `Most Popular Destination`, 
    COUNT(b.`idBooking`) AS `Total Bookings`
FROM 
    `Destination` d
JOIN 
    `Tour_has_Destination` thd ON d.`idDestination` = thd.`Destination_idDestination`
JOIN 
    `Tour` t ON t.`idTour` = thd.`Tour_idTour`
JOIN 
    `Booking` b ON b.`Tour_idTour` = t.`idTour`
GROUP BY 
    d.`idDestination`
ORDER BY 
    `Total Bookings` DESC
LIMIT 1;


# FIND TOTAL REVENUE FOR EACH PACAKGE
SELECT 
    b.Tour_idTour AS TourID,
    COUNT( b.Tour_idTour) AS TotalTours,
    t.cost_per_person AS Cost,
    SUM(t.cost_per_person) AS TotalRevenue
FROM 
    Booking b
INNER JOIN 
    Tour t ON b.Tour_idTour = t.idTour
GROUP BY 
    b.Tour_idTour,
    t.cost_per_person;

# FIND WHICH EMPLOYEE HANDLES WHICH PACAKGE
SELECT 
    e.idEmployee AS EmployeeID,
    e.Name AS EmployeeName,
    e.Surname AS EmployeeSurname,
    g.idGuide AS GuideID,
    eg.Name AS GuideName,
    eg.Surname AS GuideSurname,
    t.idTour AS TourID
FROM 
    Tour t
INNER JOIN 
    Sales s ON t.Sales_idSales = s.idSales
INNER JOIN 
    Employee e ON s.Employee_idEmployee = e.idEmployee
INNER JOIN 
    Guide g ON t.Guide_idGuide = g.idGuide
INNER JOIN 
    Employee eg ON g.Employee_idEmployee = eg.idEmployee
ORDER BY 
    t.idTour, e.idEmployee;

# Customer who booked the most tours
SELECT 
	b.Customer_idCostumer AS CustumerID,
    COUNT(b.idBooking) AS TotalBooking,
    c.Name AS CustomerName,
    c.Surname AS CustomerSurname
FROM
    Booking b
INNER JOIN
    Customer c ON b.Customer_idCostumer = c.idCostumer
GROUP BY
    b.Customer_idCostumer
ORDER BY
    TotalBooking DESC
LIMIT 1;


# Display all informations for tours
SELECT 
    t.idTour AS TourID,
    t.`Tour Name` AS TourName,
    d.`Destination Name` AS Destination,
    d.`description` AS DestinationDescription,
    d.`language` AS DestinationLanguage,
    t.transport_mode AS TransportMode,
    t.cost_per_person AS CostPerPerson,
    t.departure_date AS DepartureDate,
    t.return_date AS ReturnDate,
    t.max_seats AS MaxSeats,
    c.`Category Name` AS Category,
    eg.Name AS GuideName,
    eg.Surname AS GuideSurname
FROM
    Tour t
INNER JOIN
    Tour_has_Destination thd ON t.idTour = thd.Tour_idTour
INNER JOIN
    Destination d ON thd.Destination_idDestination = d.idDestination
INNER JOIN
    Tour_has_Category thc ON t.idTour = thc.Tour_idTour
INNER JOIN
    Category c ON thc.Category_idCategory = c.idCategory
INNER JOIN
    Guide g ON t.Guide_idGuide = g.idGuide
INNER JOIN
    Employee eg ON g.Employee_idEmployee = eg.idEmployee
ORDER BY
    t.idTour;
    