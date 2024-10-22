CREATE DATABASE IF NOT EXISTS ClassDB;

#DROP DATABASE ClassDB;
#DROP TABLE students;
#DROP TABLE course;
#DROP TABLE marks;

#comment
use ClassDB;

CREATE TABLE IF NOT EXISTS students(
student_id SERIAL,
dob DATE,
student_name varchar (255),
PRIMARY KEY (student_id)
);

CREATE TABLE IF NOT EXISTS course(
course_id SERIAL,
course_name VARCHAR(255) NOT NULL,
teacher VARCHAR(255) NOT NULL,
PRIMARY KEY (course_id)
);

CREATE TABLE IF NOT EXISTS marks(
mark_id SERIAL,
student_id BIGINT UNSIGNED NOT NULL,
course_id BIGINT UNSIGNED NOT NULL,
marks INTEGER,
PRIMARY KEY (mark_id),
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (course_id) REFERENCES course(course_id)
);

#INSERT INTO students (dob, student_name) VALUES ('1990-02-12', 'Joe Bloggs');
#INSERT INTO students (dob, student_name) VALUES ('1995-08-01', 'Chris Smith');
#INSERT INTO students (dob, student_name) VALUES ('1989-11-24', 'Lucy Glass');
#INSERT INTO course (course_name, teacher) VALUES ('Software Engineering', 'Jane Smith');
#INSERT INTO course (course_name, teacher) VALUES ('MySQL', 'John Jones'), ('Java', 'Matt Carpenter');
#INSERT INTO marks (student_id, course_id, marks) VALUES (1, 1, 89);
#INSERT INTO marks (student_id, course_id, marks) VALUES (2, 3, 74), (3, 2, 88);

SELECT * FROM course;
#SELECT teacher FROM course WHERE course_id = 1;

#UPDATE students SET dob = '1991-02-12' WHERE student_id = 1;