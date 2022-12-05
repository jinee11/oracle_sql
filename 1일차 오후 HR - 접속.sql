

select * from tab;


    --select : 출력하기
    /*
        select(출력하기) *(모든컬럼을)    
        from 테이블이름
    */
    
-- 테이블의 구조 확인하기

-- 1. employee 테이블의 모든 컬럼을 출력해라
    -- 근로자(고용자)에 대한 정보를 저장
select * 
from employee;

-- 2. department 테이블의 모든 컬럼을 출력
    -- 부서에 대한 정보를 저장하는 테이블
select *
from department;

-- 3. salgrade 테이블의 모든 컬럼(필드, 엔티티)를 출력
    -- 판매 순위를 저장하는 테이블
select *
from salgerade;

-- =========================================

-- 각 테이블의 각각의 컬럼정보

-- 1. employee 테이블
select * from employee;
/*
    각각의 컬럼에 대한 설명
    ENO : 사원번호 
    ENAME : 사원명
    JOB : 직책
    MANAGER : 상관의 사원번호(사수의 사원번호)
    HIREDATE : 입사일
    SALARY : 월급
    COMMISSION : 보너스
    DNO : 부서번호
*/

-- 2. 부서정보를 저장하는 테이블
select * from department;
/*
    DNO : 부서번호
    DNAME : 부서명
    LOC : 부서의 위치
*/

-- 3. 월급의 순위를 저장하는 테이블
select * from salgrade;
/*
     GRADE : 순위 <- 월급의 순위 : 숫자가 작을수록 월급이 낮다
     LOSAL : 제일 낮은 월급
     HISAL : 제일 높은 연봉
*/

-- ======================================

-- 컬럼, 필드, 엔티티 (모두 동일한말)
-- 레코드 : 각 컬럼에 들어간 값, 1행(1라인)
-- 레코드 셋 : 레코드들의 집합
select *
from employee;

-- 특정 컬럼만 출력하기
select eno
from employee;

-- 특정 컬럼 여러개 출력하기 (하나의 컬럼이 끝날 경우 ,(콤마)로 구별)
select eno, ename, salary
from employee;

-- 모든 컬럼 출력하기
select eno, ename,job,manager, hiredate, salary, commission, dno
from employee;

-- 특정 컬럼만 출력시 여러번 출력하기
select eno, ename, salary, ename, ename
from employee;

-- 테이블의 구조 확인 하기 : 테이블의 컬럼들을 확인
DESCRIBE employee;
desc employee; --위와 같다

-- 컬럼을 별칭으로 출력하기(컬럼명 as(생략가능) 별칭)
select eno as 사원번호, ename as 사원명, job as 직책
from employee;

select eno 사원번호, ename  사원명, job  직책
from employee;

-- employee 테이블의 모든 컬럼을 별칭으로 출력
select eno 사원번호, ename 사원명, job 직책, manager 상관번호,
    hiredate " 입사일", salary "월 급", commission "보%너스", dno "부서 번호"
FROM employee;

-- 조건을 사용하여 출력 : where
select *
from employee
where eno = 7499; -- eno 컬럼의 값이 7499인것만 출력해라

desc employee; -- emplouee 테이블의 구조를 확인

-- 값을 출력시 : number 데이터 타입의 값은 '' 없이 출력
-- number 이외의 데이터 타입은 모두 ''로 값을 출력 : char, varchar, date

select * from employee
where job = 'MANAGER' ; --''없다면 숫자로 받아들임 오류
--job은 데이터타입이 varchar2, 값을 가져올때는 대소문자 구별

select * from employee;

-- 부서번호가 20번인 모든 컬럼
select * from employee
where dno = 20;

-- <문제>
desc employee;
-- salary (월급) 2000이상인 사용자만 모든 컬럼 출력
select * from employee
where salary >= 2000;

-- 이름이 CLARK 인 사용자의 월급만 출력
select salary from employee
where ename = 'CLARK';

-- 사원번호 (eno) 7788인 이름과 입사날짜 <-컬럼이름을 별칭으로 출력
select ename 잠온다, hiredate from employee
where eno = 7788;

--Select 문의 전체 구조-----------
/* 순서를 지켜야 오류가 안남
select  -- 컬럼명 : * (모든컬럼), * 반드시 들어가야함
distinct  -- 중복된 값을 제거해서 출력해라(생략가능)
from    -- 테이블명, 뷰이름       * 반드시 들어가야함    
 - where   -- 조건
   - group by -- 컬럼명 : 특정 컬럼의 동일한 값을 그룹핑
   - Having   -- group by 에서 나온 결과를 조건을 처리
 - Order by -- 정렬해서 출력 할 컬럼, asc : 내림차순, desc : 오름차순
*/

select * from employee;

select distinct dno 부서번호 
--distinct 삽입, 다른 컬럼과 동시에 작동하면 오류발생
from employee;

select distinct dno, eno
-- 컬럼 두개라서 오류
from employee;

-- 컬럼에 연산을 적용 : 컬럼명이 없어짐, alias해서 출력
select eno, ename, salary as 월급 , salary * 12 as 연봉, commission 보너스
from employee;

-- 전체 연봉 구하기 : 월급에서 *12 + 보너스 = 전체 연봉
    --null 컬럼과 연산(+,-,*,/)을 하게되면 전체가 null
select eno, ename, salary, commission, salary * 12 as 연봉, 
(salary * 12) + commission as 전체연봉
from employee;

-- 전체 연봉을 계산할때 null 들어간 컬럼을 0으로 변경 후 연산을 적용해야 한다
    -- nvl 함수 : null이 들어간 컬럼을 다른 값으로 변환해서 처리해 주는 함수
    -- nvl (commission, 0); <-커미션 컬럼에 null을 0으로 바꿔서 처리해라 
select eno, ename, salary, commission, salary * 12 as 연봉, 
(salary * 12) + nvl (commission, 0) as 전체연봉
from employee;

-- null이 들어간 컬럼을 출력하기 <== 주의
    -- null을 검색 할때는 = 이 아닌 is를 사용해야한다
select *
from employee
where commission is null;

select *
from employee
  -- null이 안들어간걸 검색해라 
where commission is not null; 

-- where 조건에서 and, or 사용하기
-- 부서 번호(DNO)가 20번이거나 30인 모든 컬럼 출력
select *
from employee
where dno = 20 or dno = 30;

select *
from employee
  -- 부서번호가 20이고 월급이 1500이상이면 모든 컬럼 출력
where dno = 20 and salary >= 1500;

-- job(직책)이 MANAGER 이면서 월급이 2000이상인 사용자만 출력
select *
from employee
where job = 'MANAGER' and salary >= 2000;


-- <문제>
/* employee 테이블에서 작업, select 문을 사용, where 조건을 사용해서 출력
<문제1> 컬럼 알리어스(별칭), cimmission(보너스) 컬럼의 null인 값만 출력하되 
사원번호(eno),사원이름(ename),입사날짜(hiredate)를 출력
<문제2> dno(부서번호)가 20이고 입사날짜가 81년 4월 이후 사원의 이름과 직책과
입사날짜를 출력
<문제3> 연봉을 계산해서 사원번호, 사원이름, 월급, 보너스, 전체연봉 출력
<문제4> commission이 null이 아닌 사용자의 이름만 출력
<문제5> manager (사수)7698인 사원이름과 직책을 출력
<문제6> 월급이 1500이상이고 부서가 20인 사원의 사원이름과 입사날짜, 부서번호, 월급 출력 
<문제7> 입사날짜가 81년 4월 1일 이상이고 81년 12월 말일까지의 사원이름과 입사날짜를 출력
<문제8> 직책(job) salesman이면서 월급이 1500이상이면서 부서번호가 30인 사원명을 출력
<문제9> 월급이 1500 이하이면서 부서번호가 20번이 아닌 사원이름과 월급과 부서번호를 출력
<문제10> 사원번호(eno)가 7788,7782인 부서번호와 이름과 직책을 출력
*/

select * from employee;
desc employee;
--1
select eno 사원번호, ename 사원이름, hiredate 입사날짜
from employee
where commission is null;

--2
select ename, job, hiredate 
from employee
where dno = 20 or hiredate = '80/04/01';

--3
select eno 사원번호, ename 사원이름, salary 월급, commission 보너스,
(salary * 12)+ nvl (commission,0) 전체연봉
from employee;

--4
select ename 사용자이름
from employee
where commission is not null;

--5
select ename 사원이름, job 직책
from employee
where MANAGER = 7698;

--6
select ename 사원이름, hiredate 입사날짜, dno 부서번호, salary 월급
from employee
where salary >= 1500 and dno = 20;

--7
select ename 사원이름, hiredate 입사날짜
from employee
where hiredate >= '81/04/01' and hiredate <= '81/12/31';

--8
select ename 사원명
from employee
where job = 'SALESMAN' and dno = 30 and salary >= 1500;

--9
select ename 사원이름, salary 월급, dno 부서번호
from employee
where salary <= 1500 and dno != 20;

--10
select dno 부서번호, ename 이름, job 직책
from employee
where eno = 7788 or eno = 7782;
