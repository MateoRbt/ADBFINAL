-- Εισαγωγή δεδομένων στον πίνακα Employee
INSERT INTO `mydb`.`Employee` (`idEmployee`, `Name`, `Surname`, `Email`, `Role`, `Salary`) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', 'Sales', 5000.00),
(2, 'Jane', 'Smith', 'janesmith@example.com', 'Guide', 4500.00),
(3, 'Alice', 'Brown', 'alicebrown@example.com', 'Accountant', 4800.00);

-- Εισαγωγή δεδομένων στον πίνακα Sales
INSERT INTO `mydb`.`Sales` (`idSales`, `Employee_idEmployee`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- Εισαγωγή δεδομένων στον πίνακα Guide
INSERT INTO `mydb`.`Guide` (`idGuide`, `Employee_idEmployee`) VALUES
(1, 2),
(2, 2),
(3, 2);

-- Εισαγωγή δεδομένων στον πίνακα Tour
INSERT INTO `mydb`.`Tour` (`idTour`, `status`, `departure_date`, `return_date`, `max_seats`, `cost_per_person`, `transport_mode`, `Sales_idSales`, `Guide_idGuide`) VALUES
(1,'pack1', 'Planned', '2024-01-10', '2024-01-15', 20, 1500.00, 'Bus', 1, 1),
(2,'pack2','Completed', '2024-01-05', '2024-01-08', 15, 1800.00, 'Plane', 2, 2),
(3, 'pack3','Cancelled', '2024-01-20', '2024-01-25', 30, 1200.00, 'Train', 3, 3);

-- Εισαγωγή δεδομένων στον πίνακα Destination
INSERT INTO `mydb`.`Destination` (`idDestination`, `Destination Name`, `Destination Description`, `Language`) VALUES
(1, 'Athens', 'Historical city with ancient monuments.', 'Greek'),
(2, 'Paris', 'City of lights and romance.', 'French'),
(3, 'Rome', 'Historical city with the Colosseum.', 'Italian');

-- Εισαγωγή δεδομένων στον πίνακα Category
INSERT INTO `mydb`.`Category` (`idCategory`, `Category_Name`) VALUES
(1, 'Winter'),
(2, 'Summer'),
(3, 'Romantic');

-- Εισαγωγή δεδομένων στον πίνακα Customer
INSERT INTO `mydb`.`Customer` (`idCostumer`, `Name`, `Surname`, `Adress`, `Email`) VALUES
(1, 'Michael', 'Johnson', 101, 'michael.j@example.com'),
(2, 'Emma', 'Davis', 102, 'emma.d@example.com'),
(3, 'Olivia', 'Wilson', 103, 'olivia.w@example.com');

-- Εισαγωγή δεδομένων στον πίνακα Accountant
INSERT INTO `mydb`.`Accountant` (`idAccountant`, `Employee_idEmployee`) VALUES
(1, 3),
(2, 3),
(3, 3);

-- Εισαγωγή δεδομένων στον πίνακα Booking
INSERT INTO `mydb`.`Booking` (`idBooking`, `Seat Number`, `Customer_idCostumer`, `Tour_idTour`, `Accountant_idAccountant`) VALUES
(1, 'A1', 1, 1, 1),
(2, 'B2', 2, 2, 2),
(3, 'C3', 3, 3, 3);

-- Εισαγωγή δεδομένων στον πίνακα Language
INSERT INTO `mydb`.`Language` (`idLanguage`, `Language Name`) VALUES
(1, 'Greek'),
(2, 'French'),
(3, 'Italian');

-- Εισαγωγή δεδομένων στον πίνακα Tour_has_Category
INSERT INTO `mydb`.`Tour_has_Category` (`Tour_idTour`, `Category_idCategory`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Εισαγωγή δεδομένων στον πίνακα Tour_has_Destination
INSERT INTO `mydb`.`Tour_has_Destination` (`Tour_idTour`, `Destination_idDestination`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Εισαγωγή δεδομένων στον πίνακα Guide_has_Language
INSERT INTO `mydb`.`Guide_has_Language` (`Guide_idGuide`, `Guide_Employee_idEmployee`, `Language_idLanguage`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3);

-- Εισαγωγή δεδομένων στον πίνακα Employee
INSERT INTO `mydb`.`Employee` (`idEmployee`, `Name`, `Surname`, `Email`, `Role`, `Salary`) VALUES
(4, 'George', 'Taylor', 'georgetaylor@example.com', 'Sales', 5200.00),
(5, 'Sophia', 'Martin', 'sophiamartin@example.com', 'Guide', 4600.00),
(6, 'Henry', 'Lee', 'henrylee@example.com', 'Accountant', 4900.00);

-- Εισαγωγή δεδομένων στον πίνακα Sales
INSERT INTO `mydb`.`Sales` (`idSales`, `Employee_idEmployee`) VALUES
(4, 4),
(5, 4),
(6, 4);

-- Εισαγωγή δεδομένων στον πίνακα Guide
INSERT INTO `mydb`.`Guide` (`idGuide`, `Employee_idEmployee`) VALUES
(4, 5),
(5, 5),
(6, 5);

-- Εισαγωγή δεδομένων στον πίνακα Tour
INSERT INTO `mydb`.`Tour` (`idTour`,`Tour Name`, `status`, `departure_date`, `return_date`, `max_seats`, `cost_per_person`, `transport_mode`, `Sales_idSales`, `Guide_idGuide`) VALUES
(4,'pack4'  ,'Planned', '2024-02-10', '2024-02-15', 25, 1600.00, 'Bus', 4, 4),
(5, 'pack5','Completed', '2024-01-15', '2024-01-20', 20, 1900.00, 'Plane', 5, 5),
(6, 'pack6','Cancelled', '2024-03-05', '2024-03-10', 35, 1300.00, 'Ship', 6, 6);

-- Εισαγωγή δεδομένων στον πίνακα Destination
INSERT INTO `mydb`.`Destination` (`idDestination`, `Destination Name`, `Destination Description`, `Language`) VALUES
(4, 'London', 'Historical city with modern landmarks.', 'English'),
(5, 'Berlin', 'Vibrant city with rich history.', 'German'),
(6, 'Tokyo', 'Modern city with traditional culture.', 'Japanese');


-- Εισαγωγή δεδομένων στον πίνακα Customer
INSERT INTO `mydb`.`Customer` (`idCostumer`, `Name`, `Surname`, `Adress`, `Email`) VALUES
(4, 'Daniel', 'Moore', 104, 'daniel.m@example.com'),
(5, 'Lily', 'Garcia', 105, 'lily.g@example.com'),
(6, 'James', 'Anderson', 106, 'james.a@example.com');

-- Εισαγωγή δεδομένων στον πίνακα Accountant
INSERT INTO `mydb`.`Accountant` (`idAccountant`, `Employee_idEmployee`) VALUES
(4, 6),
(5, 6),
(6, 6);

-- Εισαγωγή δεδομένων στον πίνακα Booking
INSERT INTO `mydb`.`Booking` (`idBooking`, `Seat Number`, `Customer_idCostumer`, `Tour_idTour`, `Accountant_idAccountant`) VALUES
(4, 'D4', 4, 4, 4),
(5, 'E5', 5, 5, 5),
(6, 'F6', 6, 6, 6);

-- Εισαγωγή δεδομένων στον πίνακα Language
INSERT INTO `mydb`.`Language` (`idLanguage`, `Language Name`) VALUES
(4, 'English'),
(5, 'German'),
(6, 'Japanese');

-- Εισαγωγή δεδομένων στον πίνακα Tour_has_Category
INSERT INTO `mydb`.`Tour_has_Category` (`Tour_idTour`, `Category_idCategory`) VALUES
(4, 1),
(5, 2),
(6, 1);

-- Εισαγωγή δεδομένων στον πίνακα Tour_has_Destination
INSERT INTO `mydb`.`Tour_has_Destination` (`Tour_idTour`, `Destination_idDestination`) VALUES
(4, 4),
(5, 5),
(6, 6);

-- Εισαγωγή δεδομένων στον πίνακα Guide_has_Language
INSERT INTO `mydb`.`Guide_has_Language` (`Guide_idGuide`, `Guide_Employee_idEmployee`, `Language_idLanguage`) VALUES
(4, 5, 4),
(5, 5, 5),
(6, 5, 6);


INSERT INTO `Booking` (`idBooking`, `Seat Number`, `Customer_idCostumer`, `Tour_idTour`, `Accountant_idAccountant`)
VALUES
    (4, 'A12', 1, 1, 1), 
    (5, 'B15', 2, 2, 2), 
    (6, 'C18', 3, 3, 3), 
    (7, 'D22', 1, 2, 1), 
    (8, 'E25', 2, 1, 2), 
    (9, 'F28', 3, 2, 3), 
    (10, 'G32', 1, 3, 1), 
    (11, 'H35', 2, 3, 2), 
    (12, 'I38', 3, 1, 3), 
    (13, 'J42', 1, 1, 1); 


