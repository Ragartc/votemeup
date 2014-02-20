# ������ ����������� ���� ������ votemeup, 
# ��������� �������, ��������� �� ��������� �������.
# constraints ���� �� ���������

DROP DATABASE votemeup;
CREATE DATABASE votemeup;
USE votemeup;
CREATE TABLE proposal (
	proposal_id INT(6) NOT NULL AUTO_INCREMENT,
	yes_count INT(6),
	no_count INT(6),
	proposal_text TEXT,
	creation_date DATETIME,
	vote_start_date DATETIME,
	prop_status ENUM ('active', 'complete', 'inChecking'),
	prop_level ENUM ('local','region','state'),
	userd_id INT(6),	#FK, autor
	categ_id INT(6),	#FK
	PRIMARY KEY (proposal_id)
);


INSERT INTO proposal VALUES (1,0,0,'Likvidirovat GAI','2014-01-12 20:00:00', '2014-02-12 10:00:00', 'active','state',3,1);
INSERT INTO proposal VALUES (2,0,0,'Pereimenovat militsiu v poitsiu','2014-01-12 20:00:00', '2014-02-12 10:00:00', 'active','state',1,1);
INSERT INTO proposal VALUES (3,0,0,'Pereimenovat Berkut v Omon','2014-01-12 20:00:00', '2014-02-12 10:00:00', 'active','state',3,1);
INSERT INTO proposal VALUES (4,0,0,'Razrewit korotkostvol','2013-12-12 20:00:00', '2014-02-12 10:00:00', 'active','state',2,2);
INSERT INTO proposal VALUES (5,0,0,'������������� ��������� �����','2014-01-01 20:00:00', '2014-02-12 10:00:00', 'active','state',1,3);
INSERT INTO proposal VALUES (6,0,0,'��������� �������� ����� �� ������������','2014-01-12 20:00:00', '2014-02-12 10:00:00', 'active','local',4,4);
INSERT INTO proposal VALUES (7,0,0,'������� ����� �� ����','2014-01-01 8:00:00', '2014-02-12 10:00:00', 'active','state',5,5);


CREATE TABLE userd (
	userd_id INT(7) NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50),
	second_name VARCHAR(50),
	last_name VARCHAR(50),
	birth_year YEAR,
	sex ENUM ('male','female'),
	registration_date DATETIME,
	city VARCHAR(50),
������	email VARCHAR(250),
	user_login VARCHAR(20),
	user_password VARCHAR(20),
	PRIMARY KEY (userd_id)
);

INSERT INTO userd (1, '����','��������','������','1954','male','2012-10-12 12:30:00','�����','df@df.df',NULL,NULL)
INSERT INTO userd (2, '�����','��������','���������','1960','male','2012-10-12 12:30:00','����','sdfd@mail.ru',NULL,NULL)
INSERT INTO userd (3, '�����','��������','������','1965','male','2012-10-12 12:30:00','�����','df@gmail.com',NULL,NULL)
INSERT INTO userd (4, '��������','��������','����������','1974','male','2012-10-12 12:30:00','�����','df@df.df',NULL,NULL)
INSERT INTO userd (5, '����','��������','�������','1980','male','2013-10-12 12:30:00','�������','df@df.df',NULL,NULL)
INSERT INTO userd (6, '�����','���������','��������','1980','��male','2011-10-12 12:30:00','�������','df@df.df',NULL,NULL)

CREATE TABLE role (
	role_id INT(7) NOT NULL AUTO_INCREMENT,
	role_name VARCHAR(20),
	role_description VARCHAR(250),
	PRIMARY KEY (role_id)
);

INSERT INTO role (1,'user','Can create proposals, vote, comment'  );
INSERT INTO role (2,'admin','Edit comments, delete spam'  );
INSERT INTO role (3,'jur_editor','Check proposals for law compliance '  );


CREATE TABLE userd_role (
	userd_id INT(7) NOT NULL , #PF
	role_id INT(7)  NOT NULL #PF

);


INSERT INTO userd_role(1,1)
INSERT INTO userd_role(2,1)
INSERT INTO userd_role(3,1)
INSERT INTO userd_role(4,2)
INSERT INTO userd_role(5,3)
INSERT INTO userd_role(6,1)


CREATE TABLE category (
	categ_id INT(7) NOT NULL AUTO_INCREMENT,
	category_name VARCHAR(20),
	#category_description VARCHAR(250),
	PRIMARY KEY (categ_id)
);

INSERT INTO category(1,'������� ���������')
INSERT INTO category(2,'������������ ������������')
INSERT INTO category(3,'��������������� ����������')
INSERT INTO category(4,'���������')
INSERT INTO category(5,'���������������')


CREATE TABLE document (
	doc_id INT(7) NOT NULL AUTO_INCREMENT,
	doc_name VARCHAR(250),
	doc_descr VARCHAR(250),
	doc_url TEXT,
	PRIMARY KEY (doc_id)
);

CREATE TABLE proposal_doc (
	proposal_id INT(7), #PF
	doc_id INT(7) #PF
	
);

CREATE TABLE vote (
	vote_id INT(7) NOT NULL AUTO_INCREMENT,
	userd_id INT(7), #FK
	proposal_id INT(7), #FK
	vote ENUM ('yes','no'),
	vote_date DATETIME,
	PRIMARY KEY (vote_id)
);

CREATE TABLE commentd (
	comment_id INT(7) NOT NULL AUTO_INCREMENT,
	userd_id INT(7), #FK
	proposal_id INT(7), #FK
	comment_date DATETIME,
	PRIMARY KEY (comment_id)
);



