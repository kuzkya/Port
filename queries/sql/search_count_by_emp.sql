SELECT
    surname,
    specialty,
    date_of_employment,
    COUNT(id_s) as count
FROM
    port.employee
    JOIN registration ON (id_e = accompanying_employee_id)
WHERE
    surname LIKE '%$surname%'
GROUP BY
    id_e,
    surname,
    specialty
ORDER BY
    COUNT(id_s) DESC