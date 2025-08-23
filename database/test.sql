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
    
-- list에 필요한 것: project - id, admin_id, title, reg_date, mod_date, (작성 중/완료)

-- detail에 필요한 것: 모두