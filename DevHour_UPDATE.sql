UPDATE Business
SET numCheckins = (
    SELECT SUM(count)
    FROM Checkin
    WHERE Checkin.business_id = Business.business_id
    GROUP BY Checkin.business_id
);

UPDATE Business
SET review_count = (
    SELECT COUNT(*)
    FROM Reviews
    WHERE Reviews.business_id = Business.business_id
    GROUP BY Reviews.business_id
);

UPDATE Business
SET reviewrating = (
    SELECT AVG(stars)
    FROM Reviews
    WHERE Reviews.business_id = Business.business_id
    GROUP BY Reviews.business_id
);