SELECT *
FROM project
WHERE id = 1;

INSERT INTO project
(admin_id, title, summary, team_size, key_features, tech_stack
, start_date, end_date, github_url, demo_url, ppt_url) 
VALUES
(1, 'test', '~~ 프로젝트로, ~~을 제공합니다.', 4, '상품 관리 시스템, 장바구니 및 주문 관리, 결제 시스템 연동, 관리자 대시보드, 반응형 웹 디자인', 'React, Node.js, Express, MySQL, Stripe API, AWS EC2'
, '2024-03-01', '2024-08-15', 'https://github.com/kimdev/ecommerce-platform', 'https://ecommerce-demo.kimdev.com', 'https://drive.google.com/ecommerce-ppt');

UPDATE project
SET
	title = 'test update'
    ,summary = ''
    ,team_size = 1
    ,key_features = ''
    ,tech_stack = ''
    ,start_date = '2024-03-01'
    ,end_date = '2024-08-15'
    ,github_url = ''
    ,demo_url = ''
    ,ppt_url = ''
WHERE
	id = 6
    AND admin_id = 1;
    
ALTER TABLE project
MODIFY COLUMN mod_date DATETIME ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE about
MODIFY COLUMN mod_date DATETIME ON UPDATE CURRENT_TIMESTAMP;

DELETE FROM project
WHERE
	id = 6
    AND admin_id = 1;
/*    
list에 필요한 것: 
where - project(admin_id)
row_number
등록 역순 정렬
project - id(hidden), title, start_date, end_date, reg_date, mode_date
*/
SELECT ROW_NUMBER() OVER(ORDER BY reg_date DESC) row_num
	, id, title, start_date, end_date, reg_date, mod_date
FROM project
WHERE admin_id = 1;

-- detail에 필요한 것: 모두
SELECT *
FROM project p
LEFT JOIN section s
	ON (p.id = s.project_id)
LEFT JOIN image i
	ON (p.id = i.project_id)
LEFT JOIN project_note pn
	ON (p.id = pn.project_id)
WHERE
	p.admin_id = 1
    AND p.id = 1;

SELECT *
FROM (SELECT * FROM project WHERE admin_id = 1 AND id = 1) p
LEFT JOIN section s ON (p.id = s.project_id)
LEFT JOIN image i ON (p.id = i.project_id)
LEFT JOIN project_note pn ON (p.id = pn.project_id);
    
SELECT *
FROM section
WHERE project_id = 1;

SELECT *
FROM image
WHERE project_id = 1;

SELECT *
FROM project_note
WHERE project_id = 1;

INSERT project_note (project_id, title, url)
VALUES (1, 'test title', 'test url');

INSERT section (project_id, about_id, title, content)
VALUES (1, null, 'test title', 'test content');

INSERT image (project_id, about_id, ori_name, saved_name, extension)
VALUES (1, null, 'test ori', 'test saved', 'test extension');

ALTER TABLE admin
CHANGE COLUMN active is_active TINYINT;

ALTER TABLE admin
MODIFY COLUMN is_active TINYINT NOT NULL DEFAULT 0;

ALTER TABLE project
ADD COLUMN is_published TINYINT NOT NULL DEFAULT 0;

ALTER TABLE about
ADD COLUMN is_published TINYINT NOT NULL DEFAULT 0;

UPDATE section
SET title = 'test title', content = 'test content'
WHERE
	project_id = 21
	AND about_id = NULL
	AND id = 14;