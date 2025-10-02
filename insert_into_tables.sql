-- Inserting records into 'employee'
INSERT INTO
    employee
VALUES
    (
        1,
        'Captain',
        '123 Ocean View',
        'Smith',
        '1980-06-01',
        '2010-05-15',
        NULL
    ),
    (
        2,
        'Mechanic',
        '124 Ocean View',
        'Johnson',
        '1982-08-12',
        '2011-03-11',
        NULL
    ),
    (
        3,
        'Navigator',
        '125 Ocean View',
        'Williams',
        '1975-02-23',
        '2009-11-01',
        '2020-12-31'
    ),
    (
        4,
        'Cook',
        '126 Ocean View',
        'Jones',
        '1990-11-15',
        '2015-01-20',
        NULL
    ),
    (
        5,
        'Engineer',
        '127 Ocean View',
        'Brown',
        '1988-09-09',
        '2013-07-30',
        NULL
    );

-- Inserting records into 'ship'
INSERT INTO
    ship
VALUES
    (1, 'SS Anne', 'Cargo', 5000, 'Port Royal'),
    (2, 'MS Marie', 'Cargo', 3000, 'Port Nemo'),
    (3, 'HS June', 'Fishing', 2000, 'Port Atlantis'),
    (4, 'LS Katie', 'Cargo', 4000, 'Port Poseidon'),
    (5, 'RS Sunny', 'Fishing', 1000, 'Port Triton');

-- Inserting records into 'jetty'
INSERT INTO
    jetty
VALUES
    (1, 'Cargo', 30, 200),
    (2, 'Fishing', 20, 150),
    (3, 'Cargo', 35, 220),
    (4, 'Private', 25, 100),
    (5, 'Fishing', 15, 130);

-- Inserting records into 'registration'
INSERT INTO
    registration
VALUES
    (1, '2023-01-01', '2023-01-05', 1, 1, 1),
    (2, '2023-02-01', '2023-02-06', 2, 2, 2),
    (3, '2023-03-01', '2023-03-05', 3, 3, 3),
    (4, '2023-04-01', '2023-04-05', 4, 4, 4),
    (5, '2023-05-01', '2023-05-05', 5, 5, 5);

-- Inserting records into 'unload'
INSERT INTO
    unload
VALUES
    (1, 1, 8),
    (2, 2, 7),
    (3, 3, 6),
    (4, 4, 9),
    (5, 5, 8);

-- Inserting records into 'tabel'
INSERT INTO
    tabel
VALUES
    (1, '2023-01-02', 8, 1),
    (2, '2023-02-02', 7, 2),
    (3, '2023-03-02', 6, 3),
    (4, '2023-04-02', 9, 4),
    (5, '2023-05-02', 8, 5);

INSERT INTO
    `port`.`users` (`username`, `password`, `role`)
VALUES
    ('director', '13032003', 'director');

INSERT INTO
    `port`.`users` (`username`, `password`, `role`)
VALUES
    ('manager', '13032003', 'manager');

INSERT INTO
    `port`.`users` (`username`, `password`, `role`)
VALUES
    ('coordinator', '13032003', 'coordinator');

INSERT INTO
    `port`.`users` (`username`, `password`, `role`)
VALUES
    ('supervisor', '13032003', 'supervisor');

INSERT INTO
    `port`.`employee` (
        `id_e`,
        `specialty`,
        `address`,
        `surname`,
        `birthday`,
        `date_of_employment`
    )
VALUES
    (
        '6',
        'Cook',
        '128 Ocean View',
        'Adams',
        '1988-03-12',
        '2013-07-30'
    );

INSERT INTO
    `port`.`employee` (
        `id_e`,
        `specialty`,
        `address`,
        `surname`,
        `birthday`,
        `date_of_employment`
    )
VALUES
    (
        '7',
        'Engineer',
        '129 Ocean View',
        'Bronks',
        '1993-05-16',
        '2013-07-30'
    );

INSERT INTO
    `port`.`employee` (
        `id_e`,
        `specialty`,
        `address`,
        `surname`,
        `birthday`,
        `date_of_employment`
    )
VALUES
    (
        '8',
        'Mechanic',
        '130 Ocean View',
        'Capon',
        '1979-08-03',
        '2013-07-30'
    );

UPDATE
    `port`.`employee`
SET
    `specialty` = 'Navigator'
WHERE
    (`id_e` = '2');

UPDATE
    `port`.`employee`
SET
    `specialty` = 'Navigator'
WHERE
    (`id_e` = '4');

UPDATE
    `port`.`employee`
SET
    `specialty` = 'Navigator'
WHERE
    (`id_e` = '5');