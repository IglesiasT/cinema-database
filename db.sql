CREATE DATABASE cinema;

USE cinema;

CREATE TABLE movies(
movie_id INT PRIMARY KEY AUTO_INCREMENT,
movie_name VARCHAR(45) NOT NULL UNIQUE,
lenght_min INT NOT NULL
);

CREATE TABLE rooms(
room_id INT PRIMARY KEY AUTO_INCREMENT,
room_name VARCHAR(45) NOT NULL,
seats INT NOT NULL
);

CREATE TABLE seats(
seat_id INT PRIMARY KEY AUTO_INCREMENT,
seat_row CHAR(1) NOT NULL,
seat_number INT NOT NULL,
room_id INT NOT NULL,
FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE shows(
show_id INT PRIMARY KEY AUTO_INCREMENT,
movie_id INT NOT NULL,
room_id INT NOT NULL,
start_time DATETIME NOT NULL,
FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE clients(
client_id INT PRIMARY KEY AUTO_INCREMENT,
client_name VARCHAR(45),
last_name VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE reservations(
reservation_id INT PRIMARY KEY AUTO_INCREMENT,
show_id INT NOT NULL,
client_id INT NOT NULL,
FOREIGN KEY (show_id) REFERENCES shows(show_id),
FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE reserved_seats(
res_seats_id INT PRIMARY KEY AUTO_INCREMENT,
reservation_id INT NOT NULL,
seat_id INT NOT NULL,
FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id),
FOREIGN KEY (seat_id) REFERENCES seats(seat_id)
);
