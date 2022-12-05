
insert into muTbl values('1','1234'); --테이블 행 삽입
commit -- DB에 영구적으로 저장해라

show user; -- 현재 유저

select * from muTbl;

-- 한 줄 주석 : 프로그램에서 해석되지 않는 영역
/*
  여러줄 주석
*/

-- 1. HR 계정 생성 : 12 버전부터 계정을 생성시 계정명 앞에 C## 을   붙여야 한다.
-- HR : 계정명, 암호 : 1234
create user C##HR identified by 1234;

-- 2. HR 계정의 권한 부여 : connect, resource 권한을 부여
grant connect, resource to C##HR;

-- 3. 테이블 스페이스를 사용할 권한 부여 (system 계정에서)
    -- USERS 테이블 스페이스의 사용량을 무제한 사용할 수 있도록 권한 부여
alter user C##HR quota unlimited on USERS;

-- 4. HR 계정 삭제 해보기
drop user C##HR;


/*HR 계정 접속*/

-- 1. HR 계정으로 접속 확인 : resoure (테이블 생성,수정,삭제)
show user;

-- 2. 테이블 생성  ; <- 끝에 붙으면 명령어가 처리되는 블락
create table myTbl2 (
    id varchar2 (20),
    pass varchar2 (20)
    );

-- 3. 테이블에 값 넣기 : commit (저장하라)
insert into myTbl2 values ('1', '1234');
commit; -- DB에 영구적으로 저장해라(insrt,update,delete 구문에서 사용)

-- 4. 테이블의 값을 출력하기
select * from myTbl2;

-- 5. 테이블 삭제 하기
drop table myTbl2;

