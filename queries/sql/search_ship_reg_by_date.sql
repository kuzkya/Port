SELECT
    name_s,
    type_s,
    homeport,
    date_of_arrival,
    date_of_leaving,
    type_j
FROM
    registration
    JOIN employee ON(id_e = accompanying_employee_id)
    JOIN ship USING(id_s)
    JOIN jetty USING(id_j)
WHERE
    date_of_arrival = '$date-01'