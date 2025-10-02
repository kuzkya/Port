-- Table creation for 'employee'
CREATE TABLE employee (
    id_e INT PRIMARY KEY,
    specialty VARCHAR(45),
    address VARCHAR(45),
    surname VARCHAR(45),
    birthday DATE,
    date_of_employment DATE,
    date_of_dismissal DATE
);

-- Table creation for 'ship'
CREATE TABLE ship (
    id_s INT PRIMARY KEY,
    name_s VARCHAR(45),
    type_s VARCHAR(45),
    tonnage INT,
    homeport VARCHAR(45)
);

-- Table creation for 'jetty'
CREATE TABLE jetty (
    id_j INT PRIMARY KEY,
    type_j VARCHAR(45),
    depth_around_the_wall INT,
    length INT
);

-- Table creation for 'registration'
CREATE TABLE registration (
    id_r INT PRIMARY KEY,
    date_of_arrival DATE,
    date_of_leaving DATE,
    accompanying_employee_id INT,
    id_s INT,
    FOREIGN KEY (accompanying_employee_id) REFERENCES employee(id_e),
    FOREIGN KEY (id_s) REFERENCES ship(id_s)
);

-- Table creation for 'unload'
CREATE TABLE unload (
    id_u INT PRIMARY KEY,
    id_e INT,
    hours_of_work INT,
    FOREIGN KEY (id_e) REFERENCES employee(id_e)
);

-- Table creation for 'tabel'
CREATE TABLE tabel (
    id_t INT PRIMARY KEY,
    date_of_start_of_work DATE,
    number_of_hours INT,
    id_e INT,
    FOREIGN KEY (id_e) REFERENCES employee(id_e)
);

ALTER TABLE
    `port`.`registration`
ADD
    COLUMN `id_j` INT NULL
AFTER
    `id_s`,
ADD
    INDEX `registration_ibfk_3_idx` (`id_j` ASC) VISIBLE;

;

ALTER TABLE
    `port`.`registration`
ADD
    CONSTRAINT `registration_ibfk_3` FOREIGN KEY (`id_j`) REFERENCES `port`.`jetty` (`id_j`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `users` (
    `username` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `role` varchar(255) NOT NULL,
    PRIMARY KEY (`username`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `port`.`reports_reg` (
    `rep_id` INT NOT NULL,
    `rep_year` INT NULL,
    `rep_month` INT NULL,
    `id_s` INT NULL,
    PRIMARY KEY (`rep_id`)
);

ALTER TABLE
    `port`.`reports_reg` CHANGE COLUMN `rep_id` `rep_id` INT NOT NULL AUTO_INCREMENT;