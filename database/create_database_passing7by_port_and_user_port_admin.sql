-- 워낙 이것 때문에 배포에서 삽질한 경험이 많아서 이참에 단단히 정리...
-- 개발 환경에서는 잘 굴러가던 어플리케이션이 배포할 때 sql 관련 문제가 생긴다면 거의 이것 때문이었음
-- 참고 링크
-- 1. https://learn.microsoft.com/ko-kr/windows/wsl/filesystems
-- 2. https://medium.com/@centizennationwide/mysql-naming-conventions-e3a6f6219efe
-- 참고 1에서 발췌: 'Windows 및 Linux 파일 시스템은 대/소문자를 다르게 처리합니다 - Windows는 대/소문자를 구분하지 않으며, Linux는 대/소문자를 구분합니다.'
-- 참고 2에서 발췌: 'MYSQL is usually hosted in Linux server which is case sensitive hence to stay on the safe side use lower case.'
-- lower_case_table_name 설정 확인
-- windows 기본값: 1(대소문자 구분 안하고 무조건 소문자로 입력)
-- linux 기본값: 0(대소문자 구분)
-- => mybatis에 쿼리 작성시 테이블명과 컬럼명을 소문자로 작성해야 linux가 쿼리에 작성된 테이블명으로 db상의 테이블명을 인식할 수 있음
-- 나중에 배포시 EC2에서 값 다시 확인하기 (이 설정이 발생시킨 오류 때문에 삽질하지 않기 위해서)
show variables like 'lower%';

-- 1. db 생성
CREATE DATABASE passing7by_port;
SHOW DATABASES;
-- 2. 유저 생성
CREATE USER 'port_admin'@'localhost' IDENTIFIED BY 'port_admin';
SELECT user FROM mysql.user;
-- 3. 유저에게 권한 부여
GRANT ALL PRIVILEGES ON passing7by_port.* TO 'port_admin'@'localhost';
SHOW GRANTS FOR 'port_admin'@'localhost';
-- 권한 저장
FLUSH PRIVILEGES;