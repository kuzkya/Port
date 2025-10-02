SELECT
    rep_year,
    rep_month,
    name_s,
    type_s,
    tonnage,
    homeport,
    date_of_arrival,
    date_of_leaving,
    type_j
FROM
    reports_reg
    JOIN ship USING(id_s)
    JOIN registration USING(id_s)
    JOIN jetty USING(id_j)
WHERE
    rep_year = YEAR('$date-01')
    AND rep_month = MONTH('$date-01')
GROUP BY
    rep_year,
    rep_month,
    name_s,
    type_s,
    tonnage,
    homeport,
    date_of_arrival,
    date_of_leaving,
    type_j