SELECT
    date_of_arrival,
    date_of_leaving,
    name_s,
    type_s,
    tonnage,
    homeport,
    id_r
FROM
    port.registration
    JOIN ship USING(id_s)
WHERE
    status = 'CREATED'