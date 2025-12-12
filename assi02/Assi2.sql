Create database sunbeam_project;
use sunbeam_project;

create table users(email varchar(20) primary key, 
				   password varchar(10),
                   role enum('user','admin'));

create table courses(course_id int primary key,
					course_name varchar(10),
                    description varchar(20),
                    fees int check (fees > 0),
                    start_date date,
                    end_date date,
                    video_expire_days int);

create table students(reg_no int primary key, 
					name varchar(20),
                    email varchar(20),
                    course_id int,
                    mobile_no int,
                    profile_pic blob,
                    foreign key (email) references users(email),
                    foreign key (course_id) references courses(course_id));
                    
                    
create table videos(video_id int primary key,
					course_id int,
                    title varchar(10),
                    description varchar(20),
                    youtube_url varchar(20),
                    added_at date,
                    foreign key (course_id) references courses(course_id));
                    
INSERT INTO users VALUES
('user1@gmail.com', 'pass123', 'user'),
('user2@gmail.com', 'pass234', 'admin'),
('user3@gmail.com', 'pass345', 'user'),
('user4@gmail.com', 'pass456', 'user'),
('user5@gmail.com', 'pass567', 'admin'),
('user6@gmail.com', 'pass678', 'user'),
('user7@gmail.com', 'pass789', 'user'),
('user8@gmail.com', 'pass890', 'admin'),
('user9@gmail.com', 'pass901', 'user'),
('user10@gmail.com', 'pass012', 'user');

INSERT INTO courses VALUES
(1, 'Java', 'Core Java', 5000, '2025-01-01', '2025-02-01', 30),
(2, 'Python', 'Basics', 4500, '2025-01-05', '2025-02-05', 40),
(3, 'MySQL', 'Database', 3000, '2025-01-10', '2025-02-10', 20),
(4, 'HTML', 'Web Base', 2500, '2025-01-15', '2025-02-15', 15),
(5, 'CSS', 'Design', 3500, '2025-01-20', '2025-02-20', 25),
(6, 'JS', 'JavaScript', 4000, '2025-01-25', '2025-03-01', 35),
(7, 'React', 'Frontend', 5500, '2025-02-01', '2025-03-10', 45),
(8, 'Spring', 'Backend', 6000, '2025-02-05', '2025-03-15', 50),
(9, 'C++', 'OOP', 2800, '2025-02-10', '2025-03-20', 30),
(10, 'C', 'Programming', 2000, '2025-02-15', '2025-03-25', 20);

INSERT INTO students VALUES
(101, 'Rahul', 'user1@gmail.com', 1, 9876543210, NULL),
(102, 'Sneha', 'user2@gmail.com', 2, 9876543211, NULL),
(103, 'Amit', 'user3@gmail.com', 3, 9876543212, NULL),
(104, 'Priya', 'user4@gmail.com', 4, 9876543213, NULL),
(105, 'Karan', 'user5@gmail.com', 5, 9876543214, NULL),
(106, 'Komal', 'user6@gmail.com', 6, 9876543215, NULL),
(107, 'Sagar', 'user7@gmail.com', 7, 9876543216, NULL),
(108, 'Riya', 'user8@gmail.com', 8, 9876543217, NULL),
(109, 'Vikas', 'user9@gmail.com', 9, 9876543218, NULL),
(110, 'Nisha', 'user10@gmail.com', 10, 9876543219, NULL);

-- modified student mobile_no 
alter table students modify mobile_no bigint; 

INSERT INTO videos VALUES
(1, 1, 'Intro', 'Basics of Java', 'yt1', '2025-01-05'),
(2, 2, 'Setup', 'Python Setup', 'yt2', '2025-01-10'),
(3, 3, 'DDL', 'MySQL DDL', 'yt3', '2025-01-15'),
(4, 4, 'HTML5', 'HTML Structure', 'yt4', '2025-01-20'),
(5, 5, 'CSS Flex', 'Flexbox', 'yt5', '2025-01-25'),
(6, 6, 'ES6', 'JavaScript ES6', 'yt6', '2025-02-01'),
(7, 7, 'JSX', 'React JSX', 'yt7', '2025-02-05'),
(8, 8, 'Beans', 'Spring Beans', 'yt8', '2025-02-10'),
(9, 9, 'OOP', 'C++ Classes', 'yt9', '2025-02-15'),
(10, 10, 'Loops', 'C Loops', 'yt10', '2025-02-20');

desc videos;
select * from users;
select * from courses;
select * from students;
select * from videos;

-- 1
select * from courses;

-- 2
select s.reg_no,s.name,s.email,s.mobile_no,s.course_id,c.course_name
from students s 
join courses c 
on s.course_id = c.course_id;

-- 3
select s.reg_no,s.name,s.email,s.mobile_no,s.course_id,c.course_name,c.description,c.fees,c.start_date,c.end_date,c.video_expire_days
from students s 
join courses c 
on s.course_id = c.course_id;

-- 4
SELECT 
    c.course_id,
    c.course_name,
    c.description,
    v.video_id,
    v.title,
    v.added_at,
    DATE_ADD(v.added_at, INTERVAL c.video_expire_days DAY) AS expires_on
FROM students s
JOIN courses c ON s.course_id = c.course_id
JOIN videos v ON c.course_id = v.course_id
WHERE s.email = 'user1@gmail.com'
  AND DATE_ADD(v.added_at, INTERVAL c.video_expire_days DAY) >= CURDATE();
