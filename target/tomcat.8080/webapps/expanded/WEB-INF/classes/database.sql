-- Users

CREATE TABLE users (

  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  username VARCHAR(255) NOT NULL ,
  password VARCHAR(255) NOT NULL

)
  ENGINE = InnoDB;

-- Roles

CREATE TABLE roles (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL

)
  ENGINE = InnoDB;

-- User Roles

CREATE TABLE user_roles(
  user_id INT NOT NULL ,
  role_id INT NOT NULL ,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (role_id) REFERENCES roles(id),

  UNIQUE (user_id, role_id)
)

  ENGINE = InnoDB;

-- Insert data
INSERT INTO users VALUES (1, 'ruslan-admin', '$2a$11$t.zQsFrogHf7Rvpi0aq55edRCa5tAukShE/lF.8cA0uMw2CzC4b2.' );

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);

-- Incedents

CREATE TABLE incedents (
  id INT NOT NULL  AUTO_INCREMENT PRIMARY KEY ,
  caseType VARCHAR(100) NOT NULL ,
  petType VARCHAR(100) NOT NULL ,
  gender VARCHAR(100) NOT NULL ,
  date DATE NOT NULL ,
  description MEDIUMTEXT ,
  latitude FLOAT NOT NULL ,
  longitude FLOAT NOT NULL ,
  photo_id INT ,
  ownerId VARCHAR(100)
)

  ENGINE = InnoDB;

CREATE TABLE photos (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(100) NOT NULL ,
  body LONGBLOB NOT NULL
)

  ENGINE = InnoDB;
