SELECT
    specialty,
    address,
    surname,
    birthday,
    date_of_employment
FROM
    employee
WHERE
    specialty LIKE '%$specialty%'
    AND date_of_dismissal IS NULL