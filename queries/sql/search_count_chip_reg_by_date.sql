SELECT
    name_s,
    type_s,
    tonnage,
    homeport,
    COUNT(id_s) as count,
    MAX(date_of_arrival) as max_date
FROM
    registration
    JOIN ship USING(id_s)
WHERE
    MONTH(date_of_arrival) = MONTH('$date-01')
    AND YEAR(date_of_arrival) = YEAR('$date-01')
GROUP BY
    name_s,
    type_s,
    tonnage,
    homeport