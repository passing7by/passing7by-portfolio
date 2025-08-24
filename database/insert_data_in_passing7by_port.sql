-- 포트폴리오 사이트용 더미 데이터 (업데이트된 테이블 구조)

-- 1. admin 테이블 데이터
INSERT INTO `admin` (`username`, `password`, `fail_count`, `max_fail_count`, `is_active`) VALUES
('admin_user', SHA2('password123', 256), 0, 5, 1),
('demo_admin', SHA2('demo12345', 256), 0, 5, 1);

-- 2. about 테이블 데이터
INSERT INTO `about` (`admin_id`, `name`, `title`, `github_url`, `blog_url`, `email_url`, `reg_date`, `mod_date`, `is_published`, `is_deleted`) VALUES
(1, '김개발', 'Full-Stack Developer & Problem Solver', 'https://github.com/kimdev', 'https://kimdev.blog', 'mailto:kimdev@example.com', NOW(), NOW(), 1, 0),
(2, '박코딩', 'Frontend Developer', 'https://github.com/parkcoding', 'https://parkcoding.tistory.com', 'mailto:park@example.com', NOW(), NOW(), 0, 0);

-- 3. skill 테이블 데이터
INSERT INTO `skill` (`about_id`, `name`, `description`) VALUES
(1, 'Java', 'Spring Boot, Spring Security를 활용한 백엔드 개발 및 RESTful API 설계'),
(1, 'JavaScript', 'ES6+, React, Vue.js를 이용한 프론트엔드 개발 및 Node.js 백엔드 개발'),
(1, 'Python', 'Django, Flask를 이용한 웹 개발 및 데이터 분석, 머신러닝'),
(1, 'MySQL', '데이터베이스 설계, 쿼리 최적화, 트랜잭션 관리'),
(1, 'Docker', '컨테이너화 및 배포 자동화, Docker Compose 활용'),
(1, 'AWS', 'EC2, S3, RDS, Lambda를 활용한 클라우드 인프라 구축'),
(1, 'Git', '버전 관리, 브랜치 전략, 협업 워크플로우'),
(2, 'React', 'Hooks, Context API, Redux를 활용한 SPA 개발'),
(2, 'TypeScript', '타입 안정성을 갖춘 JavaScript 개발'),
(2, 'CSS/SCSS', '반응형 웹 디자인, CSS Grid, Flexbox');

-- 4. project 테이블 데이터
INSERT INTO `project` (`admin_id`, `title`, `summary`, `team_size`, `key_features`, `tech_stack`, `start_date`, `end_date`, `github_url`, `demo_url`, `ppt_url`, `reg_date`, `mod_date`, `is_published`, `is_deleted`) VALUES
(1, 'E-Commerce Platform', '온라인 쇼핑몰 플랫폼 구축 프로젝트로, 사용자 친화적인 UI/UX와 안전한 결제 시스템을 제공합니다.', 4, '상품 관리 시스템, 장바구니 및 주문 관리, 결제 시스템 연동, 관리자 대시보드, 반응형 웹 디자인', 'React, Node.js, Express, MySQL, Stripe API, AWS EC2', '2024-03-01', '2024-08-15', 'https://github.com/kimdev/ecommerce-platform', 'https://ecommerce-demo.kimdev.com', 'https://drive.google.com/ecommerce-ppt', NOW(), NOW(), 1, 0),

(1, '실시간 채팅 애플리케이션', 'Socket.io를 활용한 실시간 채팅 서비스로, 그룹 채팅과 파일 공유 기능을 지원합니다.', 2, '실시간 메시징, 그룹 채팅방, 파일 업로드/다운로드, 이모티콘 지원, 메시지 검색', 'Vue.js, Node.js, Socket.io, MongoDB, Cloudinary', '2024-01-15', '2024-02-28', 'https://github.com/kimdev/realtime-chat', 'https://chat-demo.kimdev.com', NULL, NOW(), NOW(), 1, 0),

(1, '날씨 예보 대시보드', '오픈 API를 활용한 날씨 정보 대시보드로, 지역별 날씨와 5일간 예보를 제공합니다.', 1, '현재 날씨 정보, 5일간 예보, 지역 검색, 즐겨찾기, 날씨 알림', 'React, TypeScript, OpenWeather API, Chart.js, PWA', '2023-11-01', '2023-12-15', 'https://github.com/kimdev/weather-dashboard', 'https://weather.kimdev.com', NULL, NOW(), NOW(), 1, 0),

(1, '도서 관리 시스템', '도서관용 도서 대출/반납 관리 시스템으로, CRUD 기능과 사용자 관리 기능을 포함합니다.', 3, '도서 검색 및 관리, 대출/반납 시스템, 회원 관리, 연체 관리, 통계 대시보드', 'Spring Boot, JPA, Thymeleaf, MySQL, Bootstrap', '2023-09-01', '2023-10-30', 'https://github.com/kimdev/library-system', NULL, 'https://drive.google.com/library-ppt', NOW(), NOW(), 1, 0),

(1, '개인 블로그 플랫폼', 'Markdown 기반의 개인 블로그 플랫폼으로, SEO 최적화와 댓글 시스템을 지원합니다.', 1, 'Markdown 에디터, 태그 시스템, 댓글 기능, SEO 최적화, 반응형 디자인', 'Next.js, Prisma, PostgreSQL, Vercel, Tailwind CSS', '2023-07-01', '2023-08-31', 'https://github.com/kimdev/blog-platform', 'https://blog.kimdev.com', NULL, NOW(), NOW(), 1, 0),

-- 임시저장 프로젝트
(1, 'AI 추천 시스템', '머신러닝을 활용한 개인화 추천 시스템 프로젝트입니다.', 2, '협업 필터링, 콘텐츠 기반 필터링, 실시간 추천', 'Python, TensorFlow, Flask, Redis', '2024-06-01', NULL, 'https://github.com/kimdev/ai-recommendation', NULL, NULL, NOW(), NOW(), 0, 0),

-- 삭제된 프로젝트 (휴지통)
(1, '구형 포트폴리오', '기존 포트폴리오 사이트입니다.', 1, '프로젝트 소개, 기술 스택, 연락처', 'HTML, CSS, JavaScript', '2022-01-01', '2022-02-01', 'https://github.com/kimdev/old-portfolio', NULL, NULL, NOW(), NOW(), 0, 1),

-- admin 2의 프로젝트
(2, '할일 관리 앱', 'React Native로 개발한 모바일 할일 관리 애플리케이션입니다.', 1, '할일 등록/수정/삭제, 카테고리 분류, 알림 기능', 'React Native, Firebase, Redux', '2024-04-01', '2024-05-31', 'https://github.com/parkcoding/todo-app', NULL, NULL, NOW(), NOW(), 0, 0);

-- 5. section 테이블 데이터 (about 페이지용)
INSERT INTO `section` (`about_id`, `project_id`, `title`, `content`) VALUES
-- about 관련 섹션
(1, NULL, '소개', '안녕하세요! 3년차 풀스택 개발자 김개발입니다. 사용자 중심의 웹 서비스를 만드는 것을 좋아하며, 새로운 기술을 배우고 적용하는 것에 열정을 가지고 있습니다. 효율적이고 확장 가능한 코드를 작성하려 노력하며, 팀 협업과 지식 공유를 중요하게 생각합니다.'),
(1, NULL, '경력', '• 2022.03 ~ 현재: (주)테크스타트업 - 풀스택 개발자\n• 2021.03 ~ 2022.02: (주)웹솔루션 - 프론트엔드 개발자\n• 2020.09 ~ 2021.02: 개발 관련 프리랜서 활동'),
(1, NULL, '교육', '• 2020.02: OO대학교 컴퓨터공학과 졸업\n• 2020.03 ~ 2020.08: 패스트캠퍼스 웹 개발 부트캠프 수료\n• 2021.05: AWS Solutions Architect Associate 취득'),
(2, NULL, '소개', '프론트엔드 개발에 집중하고 있는 박코딩입니다. 사용자 경험을 개선하는 인터페이스 구현에 관심이 많습니다.'),

-- project 관련 섹션  
(NULL, 1, '프로젝트 개요', 'React와 Node.js를 기반으로 한 현대적인 E-Commerce 플랫폼입니다. 사용자 경험을 최우선으로 고려하여 직관적인 UI/UX를 구현하였고, Stripe API를 통한 안전한 결제 시스템을 도입했습니다.'),
(NULL, 1, '주요 기능', '• 상품 카탈로그 및 검색 시스템\n• 장바구니 및 위시리스트\n• 안전한 결제 처리 (Stripe 연동)\n• 주문 추적 시스템\n• 관리자 대시보드\n• 반응형 웹 디자인'),
(NULL, 1, '기술적 도전과 해결', 'API 응답 속도 개선을 위해 Redis 캐싱을 도입하여 응답 시간을 40% 단축시켰습니다. 또한 이미지 최적화를 통해 페이지 로딩 속도를 개선하였고, JWT 토큰 기반 인증으로 보안을 강화했습니다.'),

(NULL, 2, '프로젝트 개요', 'Socket.io를 활용한 실시간 채팅 애플리케이션입니다. WebSocket 연결을 통해 지연 없는 메시징을 구현하였고, 파일 공유와 이모티콘 기능을 지원합니다.'),
(NULL, 2, '핵심 기능', '• 실시간 1:1 및 그룹 채팅\n• 파일 및 이미지 공유\n• 온라인 상태 표시\n• 메시지 검색 기능\n• 모바일 반응형 지원'),
(NULL, 2, '기술적 특징', 'MongoDB를 사용하여 채팅 히스토리를 효율적으로 관리하고, Cloudinary를 통해 이미지 업로드를 처리했습니다. Socket.io Room 기능을 활용하여 그룹 채팅을 구현했습니다.'),

(NULL, 3, '개발 배경', '날씨 정보에 대한 접근성을 높이고자 PWA 기술을 활용하여 모바일에서도 네이티브 앱과 같은 경험을 제공하는 대시보드를 개발했습니다.'),
(NULL, 3, '핵심 기술', 'OpenWeather API를 활용하여 실시간 날씨 데이터를 가져오고, Chart.js를 통해 직관적인 데이터 시각화를 구현했습니다.');

-- 6. project_note 테이블 데이터
INSERT INTO `project_note` (`project_id`, `title`, `url`) VALUES
(1, 'API 문서', 'https://docs.kimdev.com/ecommerce-api'),
(1, '배포 가이드', 'https://github.com/kimdev/ecommerce-platform/wiki/deployment'),
(1, '테스트 시나리오', 'https://docs.google.com/document/d/test-scenarios'),
(2, '기술 블로그 포스팅', 'https://kimdev.blog/realtime-chat-development'),
(2, 'Socket.io 성능 최적화', 'https://github.com/kimdev/realtime-chat/wiki/performance'),
(3, '날씨 API 연동 가이드', 'https://github.com/kimdev/weather-dashboard/wiki/api-guide'),
(4, '시스템 설계 문서', 'https://docs.google.com/document/d/library-system-design'),
(4, 'ERD 다이어그램', 'https://drive.google.com/library-erd'),
(5, 'SEO 최적화 보고서', 'https://kimdev.blog/seo-optimization-report');

-- 7. image 테이블 데이터
INSERT INTO `image` (`project_id`, `about_id`, `ori_name`, `saved_name`, `extension`) VALUES
-- 프로젝트 이미지들
(1, NULL, 'ecommerce-main-screen.png', 'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6', 'png'),
(1, NULL, 'ecommerce-admin-dashboard.png', 'b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7', 'png'),
(1, NULL, 'ecommerce-mobile-view.png', 'c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8', 'png'),

(2, NULL, 'chat-main-interface.png', 'd4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9', 'png'),
(2, NULL, 'chat-group-features.png', 'e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0', 'png'),

(3, NULL, 'weather-dashboard-main.png', 'f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1', 'png'),
(3, NULL, 'weather-mobile-pwa.png', 'g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2', 'png'),

(4, NULL, 'library-system-main.png', 'h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3', 'png'),
(4, NULL, 'library-admin-panel.png', 'i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4', 'png'),

(5, NULL, 'blog-platform-editor.png', 'j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5', 'png'),
(5, NULL, 'blog-platform-frontend.png', 'k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6', 'png'),

-- 임시저장 프로젝트 이미지
(6, NULL, 'ai-recommendation-architecture.png', 'l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7', 'png'),

-- about 페이지 프로필 이미지들
(NULL, 1, 'profile-photo-main.jpg', 'm3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8', 'jpg'),
(NULL, 1, 'about-background.jpg', 'n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9', 'jpg'),
(NULL, 2, 'profile-photo-demo.jpg', 'o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0', 'jpg');