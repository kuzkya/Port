SELECT
    date_of_arrival,
    date_of_leaving,
    surname,
    type_j,
    status
FROM
    registration
    LEFT JOIN ship USING(id_s)
    LEFT JOIN employee ON(id_e = accompanying_employee_id)
    LEFT JOIN jetty USING(id_j)
WHERE
    username = '$username'