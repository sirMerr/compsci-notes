-- This script needs to run only once

DROP DATABASE IF EXISTS AGENDADB;
CREATE DATABASE AGENDADB;

USE AGENDADB;

DROP USER IF EXISTS 'root@localhost';

CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';

GRANT ALL ON AGENDADB.* TO 'root'@'localhost';

FLUSH PRIVILEGES;
