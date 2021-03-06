DROP DATABASE IF EXISTS extra_assignment_1_2;
CREATE DATABASE IF NOT EXISTS extra_assignment_1_2;
USE extra_assignment_1_2;

DROP TABLE IF EXISTS trainee;
CREATE TABLE IF NOT EXISTS trainee (
	trainee_id			SMALLINT		UNSIGNED		PRIMARY KEY		AUTO_INCREMENT,
    full_name			NVARCHAR(100),
    birth_date			DATE,
    gender				ENUM('male','female','unknown')	DEFAULT 'unknown',
    et_iq				TINYINT CHECK(et_iq BETWEEN 0 AND 20),
    et_gmath			TINYINT CHECK(et_gmath BETWEEN 0 AND 20),
    et_english			TINYINT CHECK(et_english BETWEEN 0 AND 50),
    training_class		NVARCHAR(50),
    evaluation_notes	TEXT                        
	);
    
ALTER TABLE trainee
ADD COLUMN 	VTI_account VARCHAR(100)	UNIQUE KEY		NOT NULL
AFTER		gender;

DROP TABLE IF EXISTS table_01;
CREATE TABLE IF NOT EXISTS table_01 (
	id					INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name`				NVARCHAR(100),
    `code`				CHAR(5),
    modifield_date		DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS table_02;
CREATE TABLE IF NOT EXISTS table_02 (
	id					INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name`				VARCHAR(100),
    `birth_date`		DATE,
    gender				BIT, #ENUM('0','1','unknown')
    is_deleted_flag		BIT NOT NULL #hoac ENUM('0','1')
);