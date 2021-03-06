
-- ************ a, Tạo table với các ràng buộc và kiểu dữ liệu. Sau đó thêm ít nhất 3 bản ghi vào mỗi table trên

DROP DATABASE IF EXISTS extra_6;
CREATE DATABASE extra_6;
USE extra_6;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	employee_id			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    employee_last_name	NVARCHAR(50),
    emloyee_first_name  NVARCHAR(50),
    employee_hire_date	DATE,
    employee_status		ENUM('Working','Waiting','Unknown'),
    supervisor_id		INT UNSIGNED,
    social_security_number	CHAR(9),
    FOREIGN KEY (supervisor_id) REFERENCES employee(employee_id)
);
DROP TABLE IF EXISTS project;
CREATE TABLE project (
	project_id		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    manager_id		INT UNSIGNED,
    project_name	NVARCHAR(100),
    project_start_date DATE,
    project_description TEXT,
    project_default NVARCHAR(100),
    project_completed_on DATE,
	FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);
DROP TABLE IF EXISTS project_modules;
CREATE TABLE project_modules (
	module_id		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    project_id		INT UNSIGNED,
    employee_id		INT UNSIGNED,
    project_module_date	DATE,
    project_module_complete_on DATE,
    project_module_description	TEXT,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id)
);
DROP TABLE IF EXISTS work_done;
CREATE TABLE work_done (
	work_done_id	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    employee_id		INT UNSIGNED,
    module_id		INT UNSIGNED,
    work_done_date	DATE,
    work_done_description TEXT,
    work_done_status ENUM('completed','progressing'),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (module_id) REFERENCES project_modules(module_id)
);

INSERT INTO employee(employee_last_name,	emloyee_first_name,	employee_hire_date ,employee_status, supervisor_id, social_security_number)
VALUES              ('Hoàng',				'Thùy Dương',		'2019-04-19',		'working',		 5,				'078051120'),
					('Nguyễn',				'Ánh Linh',			'2020-10-21',		'waiting',		 NULL,			'078051121'),
					('Trương',				'Thanh Tú',			'2017-12-15',		'working',		 4,				'078051010'),
                    ('Đinh',				'La Giáng',			'2016-02-07',		'working',		 NULL,			'078059056'),
                    ('Nguyễn',				'Hòa Vang',			'2018-06-30',		'working',		 NULL,			'078059005'),
                    ('Lê',					'Thanh Sơn',		'2020-03-09',		'working',		 5,				'078051122'),
                    ('Nguyễn',				'Chí Mạnh',			'2020-02-11',		'working',		 4,				'078051123'),
                    ('Trần',				'Hải Yến',			'2020-01-27',		'working',		 5,				'078051124'),
                    ('Doãn',				'Tú Linh',			'2020-11-27',		'unknown',		 NULL,			'078051125');
                    
INSERT INTO project (manager_id, project_name, 	project_start_date,	project_description,	project_completed_on)
VALUES              (3,			'Tuyển sinh', 	'2019-06-10',		'DEV, TEST',			'2019-10-31'),
					(4,			'Dự án 1', 		'2020-05-20',		'Đối tác 1,2,4',		'2020-11-10'),
                    (5,			'Dự án 2', 		'2020-10-22',		'Đối tác 3',			 NULL);
                    
INSERT INTO project_modules (project_id,	employee_id, project_module_date, project_module_complete_on, project_module_description)
VALUES						(1,				1,			 '2019-07-31',		  '2019-07-13',				  'Tuyển sinh DEV'),
							(1,				7,			 '2019-07-31',		  '2019-07-01',				  'Tuyển sinh TEST'),
                            (1,				1,			 '2019-08-31',		  '2019-08-30',				  'Hoàn thành hồ sơ nhập học DEV'),
                            (1,				7,			 '2019-08-31',		  '2019-08-25',				  'Hoàn thành hồ sơ nhập học TEST'),
                            (1,				4,			 '2019-09-30',		  '2019-09-20',				  'Sắp thời khóa biểu DEV + TEST'),
                            (1,				4,			 '2019-10-31',		  '2019-09-28',				  'Sắp giáo viên, mentor và chuẩn bị trang thiết bị'),
                            (2,				2,			 '2020-05-31',		  '2020-06-02',				  'Ký hợp đồng bên 1'),
                            (2,				8,			 '2020-06-15',		  '2020-06-20',				  'Ký hợp đồng bên 2'),
                            (2,				4,			 '2020-06-30',		  '2020-06-27',				  'Ký hợp đồng bên 3'),
                            (2,				2,			 '2020-07-31',		  '2020-07-21',				  'Triển khai dự án bên 1'),
							(2,				8,			 '2020-08-15',		  '2020-08-19',				  'Triển khai dự án bên 2'),
                            (2,				4,			 '2020-09-30',		  '2020-10-09',				  'Triển khai dự án bên 3'),
                            (2,				4,			 '2020-10-30',		  '2020-10-30',				  'Tổng kết 3 dự án'),
                            (3,				3,			 '2020-10-30',		  '2020-11-01',				  'Ký hợp đồng bên 3'),
                            (3,				5,			 '2021-02-16',		  NULL,						  'Triển khai dự án bên 3');

INSERT INTO work_done (employee_id, module_id, work_done_date, work_done_description, work_done_status)
VALUES				  (1,			1,		   '2019-07-13',   'Work 1.1.1',		  'completed'),
					  (1,			1,		   '2019-07-13',   'Work 1.1.2',		  'completed'),
                      (7,			1,		   '2019-07-01',   'Work 7.1.1',		  'completed'),
                      (7,			1,		   '2019-07-01',   'Work 7.1.2',		  'completed'),
                      (1,			3,		   '2019-08-30',   'Work 1.3.1',		  'completed'),
                      (1,			3,		   '2019-08-30',   'Work 1.3.2',		  'completed'),
                      (1,			3,		   '2019-08-30',   'Work 1.3.3',		  'completed'),
                      (7,			4,		   '2019-08-25',   'Work 7.4.1',		  'completed'),
                      (7,			4,		   '2019-08-25',   'Work 7.4.2',		  'completed'),
                      (4,			5,		   '2019-09-20',   'Work 4.5',			  'completed'),
                      (4,			6,		   '2019-09-28',   'Work 4.6',			  'completed'),
                      (2,			7,		   '2020-06-02',   'Work 2.7',			  'completed'),
                      (8,			8,		   '2020-06-20',   'Work 8.8',			  'completed'),
                      (4,			9,		   NULL,		   'Work 4.9',			  'completed'),
                      (2,			10,		   NULL,		   'Work 2.10',			  'completed'),
                      (8,			11,		   NULL,		   'Work 8.11',			  'completed'),
                      (4,			13,		   NULL,		   'Work 4.13.1',		  'completed'),
                      (4,			13,		   NULL,		   'Work 4.13.2',		  'completed'),
                      (4,			14,		   NULL,		   'Work 4.14',			  'completed'),
                      (3,			15,		   NULL,		   'Work 3.15',			  'completed'),
                      (5,			16,		   NULL,		   'Work 5.16.1',		  'completed'),
                      (5,			16,		   NULL,		   'Work 5.16.2',		  'progressing'),
                      (9,			16,		   NULL,		   'Work 5.16.3',		  'progressing');

-- *********** b, viết stored procedure (không có parameter) để remove tất cả thông tin project
-- đã hoàn thành sau 3 tháng từ hiện tại. IN số lượng record đã remove từ các table liên quan 
-- trong khi removing (dùng lệnh print)

DROP TRIGGER IF EXISTS trig_1;
DELIMITER $$
CREATE TRIGGER trig_1
BEFORE DELETE ON project
FOR EACH ROW
	BEGIN
		IF (SELECT
				project_completed_on
			FROM project
                 WHERE project_id = OLD.project_id) < (SELECT NOW() - INTERVAL 3 MONTH) THEN
		DELETE FROM project_modules
		WHERE project_id = OLD.project_id;
        DELETE FROM work_done
        WHERE module_id = ANY(SELECT
								module_id
							FROM project_modules
                                 WHERE project_id = OLD.project_id);
		END IF;
	END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS pro_b;
DELIMITER $$
CREATE PROCEDURE pro_b()
	BEGIN
		
        DECLARE x1 SMALLINT UNSIGNED;
        DECLARE x2 SMALLINT UNSIGNED;
        DECLARE x3 SMALLINT UNSIGNED;
        SET x1 = 0;
        SET x2 = 0;
        SET x3 = 0;       
		            
		SET x1 = (SELECT
				COUNT(project_id)
			FROM project
            WHERE project_completed_on < (SELECT NOW() - INTERVAL 3 MONTH));
		SET x2 = (SELECT
				COUNT(module_id)
			FROM project_modules
            WHERE project_id = ANY (SELECT 
									project_id
								FROM project
								WHERE project_completed_on < (SELECT NOW() - INTERVAL 3 MONTH)));
		SET x3 = (SELECT
				COUNT(module_id)
			FROM work_done
            WHERE module_id = ANY (SELECT
								module_id
							FROM project_modules
                            WHERE project_id = ANY (SELECT
													project_id
												FROM project
												WHERE project_completed_on < (SELECT NOW() - INTERVAL 3 MONTH))));
		
        DELETE FROM project
        WHERE project_completed_on < (SELECT NOW() - INTERVAL 3 MONTH);
        
        SELECT 
			t1.record_deleted, t1.from_table
		FROM (
				SELECT x1 AS record_deleted, 'project' AS from_table
					UNION
				SELECT x2 AS record_deleted, 'project_modules' AS from_table
					UNION
				SELECT x3 AS record_deleted, 'work_done' AS from_table) AS t1;
        
	END $$
DELIMITER ;

-- ********** c, viết stored procedure (có parameter) để in ra các module đang được thực hiện

DROP PROCEDURE IF EXISTS pro_c;
DELIMITER $$
CREATE PROCEDURE pro_c(IN module_status_1_for_completed_0_for_progressing BIT)
	BEGIN
		IF module_status_1_for_completed_0_for_progressing = 0 THEN
        SELECT * FROM project_modules WHERE project_module_complete_on IS NULL;
        ELSEIF module_status_1_for_completed_0_for_progressing = 1 THEN
        SELECT * FROM project_modules WHERE project_module_complete_on IS NOT NULL;
        END IF;
	END $$
DELIMITER ;

-- ********** d, viết hàm (có parameter) trả về thông tin một nhân viên đã tham gia làm mặc dù không ai
-- giao việc cho nhân viên đó

SET GLOBAL LOG_BIN_TRUST_FUNCTION_CREATORS = 1;
DROP FUNCTION IF EXISTS id_emloyee;
DELIMITER $$
CREATE FUNCTION id_emloyee(work_not_under_sup BIT) RETURNS NVARCHAR(200)
	BEGIN
		DECLARE id_employee NVARCHAR(200);
        IF work_not_under_sup = 1 THEN
        WITH CTE1 AS (
			SELECT DISTINCT employee_id, '1' AS sample
			FROM employee
					JOIN work_done USING (employee_id)
			WHERE supervisor_id IS NULL
			GROUP BY employee_id)
		SELECT GROUP_CONCAT(employee_id) INTO id_employee
        FROM CTE1
        GROUP BY sample;
        RETURN id_employee;
        ELSE
        SET id_employee = 'func_1 is turned off';
        RETURN id_employee;
        END IF;
	END $$
DELIMITER ;


 