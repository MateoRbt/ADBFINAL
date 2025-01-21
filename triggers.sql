CREATE TABLE TourSales (
    idTour INT PRIMARY KEY,
    total_bookings INT DEFAULT 0,
    total_cost DECIMAL(10, 2) DEFAULT 0.00,
    free_seats INT DEFAULT 0,
    CONSTRAINT fk_TourSales_Tour FOREIGN KEY (idTour) REFERENCES Tour(idTour)
);


DELIMITER $$

CREATE TRIGGER UpdateTourSales
AFTER INSERT OR DELETE ON Booking
FOR EACH ROW
BEGIN
    DECLARE totalBookings INT;
    DECLARE totalCost DECIMAL(10, 2);
    DECLARE maxSeats INT;

    -- Υπολογισμός των συνολικών κρατήσεων και του συνολικού κόστους
    SELECT 
        COUNT(*) INTO totalBookings, 
        SUM(cost) INTO totalCost 
    FROM 
        Booking 
    WHERE 
        Tour_idTour = IFNULL(NEW.Tour_idTour, OLD.Tour_idTour);

    -- Εύρεση του maxSeats για το πακέτο
    SELECT 
        max_seats INTO maxSeats
    FROM 
        Tour
    WHERE 
        idTour = IFNULL(NEW.Tour_idTour, OLD.Tour_idTour);

    -- Ενημέρωση του πίνακα TourSales
    INSERT INTO TourSales (idTour, total_bookings, total_cost, free_seats)
    VALUES (
        Tour_idTour, totalBookings
    ) 
    ON DUPLICATE KEY UPDATE TOTAL BOOKINGS VAULE {TR}
