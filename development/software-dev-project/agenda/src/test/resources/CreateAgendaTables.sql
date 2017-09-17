USE AGENDADB;

-- Drop tables
DROP TABLE IF EXISTS APPOINTMENT;
DROP TABLE IF EXISTS GROUP_RECORD;
DROP TABLE IF EXISTS ACCOUNT;

-- Create Tables
CREATE TABLE ACCOUNT (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  lastname VARCHAR(30),
  firstname VARCHAR(30),
  email VARCHAR(60) NOT NULL DEFAULT '',
  email_password VARCHAR(60) NOT NULL DEFAULT '',
  port INT NOT NULL DEFAULT 465
);

CREATE TABLE GROUP_RECORD (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30),
  rgb BIGINT,
  account_id INT,
  KEY account_id (account_id),
  CONSTRAINT account_1 FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE APPOINTMENT (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  group_id INT NOT NULL,
  title VARCHAR(60),
  location VARCHAR(60),
  start_time TIMESTAMP DEFAULT current_timestamp,
  end_time TIMESTAMP DEFAULT current_timestamp,
  details VARCHAR(255),
  whole_day BOOLEAN DEFAULT FALSE,
  reminder_interval INT,
  alarm_reminder BOOLEAN DEFAULT FALSE,
  KEY group_id (group_id),
  CONSTRAINT group_1 FOREIGN KEY (group_id) REFERENCES group_record(id)
);

-- Inserts
insert into account (email_password, firstname, lastname, email, port) values ('wlcTOpmjTa', 'Jenelle', 'Skym', 'jskym0@aol.com', 97);
insert into account (email_password, firstname, lastname, email, port) values ('93vDZO2CXDof', 'Sunny', 'Tryhorn', 'stryhorn1@china.com.cn', 72);
insert into account (email_password, firstname, lastname, email, port) values ('RFjKeE7i', 'Ruy', 'Raiment', 'rraiment2@epa.gov', 10);
insert into account (email_password, firstname, lastname, email, port) values ('elZkPif', 'Curt', 'Raymond', 'craymond3@wsj.com', 32);
insert into account (email_password, firstname, lastname, email, port) values ('UrBMyOVk9vwc', 'Jodi', 'Yanyshev', 'jyanyshev4@psu.edu', 99);

insert into group_record (name, rgb, account_id) values ('Bytecard', '4135296343', 97);
insert into group_record (name, rgb, account_id) values ('Alpha', '5082131095', 72);
insert into group_record (name, rgb, account_id) values ('Bamity', '9207311267', 10);
insert into group_record (name, rgb, account_id) values ('Toughjoyfax', '6252377694', 97);

insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Basic Industries', 'Illinois', 2, '2016-12-16 00:25:52', '2017-02-18 15:00:27', 'Synergized well-modulated core', false, 3, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'North Carolina', 2, '2017-04-26 01:52:31', '2017-03-28 15:25:58', 'Cross-platform web-enabled product', true, 65, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Illinois', 1, '2016-10-17 02:19:39', '2017-06-15 09:07:32', 'Inverse foreground service-desk', true, 32, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Transportation', 'Florida', 3, '2017-04-26 21:54:49', '2016-09-04 18:20:21', 'Open-source encompassing encryption', false, 31, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Computer Science', 'California', 4, '2017-01-08 03:34:02', '2017-07-31 15:24:55', 'Ergonomic motivating paradigm', false, 16, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Capital Goods', 'California', 3, '2016-11-09 11:51:47', '2017-02-20 18:35:38', 'Right-sized systematic knowledge user', false, 5, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Pennsylvania', 2, '2017-05-01 19:13:16', '2016-11-12 04:54:00', 'Decentralized foreground workforce', true, 32, false);