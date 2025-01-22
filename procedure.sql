CREATE TABLE Review (
    idReview INT AUTO_INCREMENT PRIMARY KEY,
    Booking_idBooking INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5), 
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (Booking_idBooking) REFERENCES Booking(idBooking)
);


DELIMITER $$

CREATE PROCEDURE AddReview (
    IN userId INT,
    IN packageId INT,
    IN rating INT,
    IN comment TEXT,
    IN ReviewDate DATE
)
BEGIN
    DECLARE bookingId INT;

    SELECT b.idBooking
    INTO bookingId
    FROM Booking b
    JOIN Tour t ON b.Tour_idTour = t.idTour
    WHERE b.Customer_idCustomer = userId
      AND t.idTour = packageId
    LIMIT 1;

    IF bookingId IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'There is no Booking for this User and Package';
    ELSE
        INSERT INTO Review (Booking_idBooking, Rating, Comment, ReviewDate)
        VALUES (bookingId, rating, comment, ReviewDate);
    END IF;
END $$

DELIMITER ;

CALL AddReview(1, 1, 5, 'Great Package', '2021-06-01');


DELIMITER $$
CREATE PROCEDURE GetPassengerList()
BEGIN
	SELECT
    	c.name AS Passenger_Name,
    	t.departure_date AS Departure_Date,
    	e.name AS Guide_Name
	FROM
    	Booking b
	INNER JOIN
    	Customer c ON b.Customer_idCostumer = c.idCostumer
	INNER JOIN
    	Tour t ON b.Tour_idTour = t.idTour
	INNER JOIN
    	Employee e ON t.Guide_idGuide = e.idEmployee
	ORDER BY
    	t.departure_date, c.name,e.name;
END$$
DELIMITER ;

CALL GetPassengerList();
