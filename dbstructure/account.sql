CREATE DATABASE chandani_details;

CREATE TABLE registration_detail (
  Rowid int(11) NOT NULL AUTO_INCREMENT,
  fname varchar(50) DEFAULT NULL,
  lname varchar(50) DEFAULT NULL,
  user_id varchar(50) DEFAULT NULL,
  password varchar(20) DEFAULT NULL,
  PRIMARY KEY (Rowid)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


