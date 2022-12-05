

select * from tab;


    --select : ����ϱ�
    /*
        select(����ϱ�) *(����÷���)    
        from ���̺��̸�
    */
    
-- ���̺��� ���� Ȯ���ϱ�

-- 1. employee ���̺��� ��� �÷��� ����ض�
    -- �ٷ���(�����)�� ���� ������ ����
select * 
from employee;

-- 2. department ���̺��� ��� �÷��� ���
    -- �μ��� ���� ������ �����ϴ� ���̺�
select *
from department;

-- 3. salgrade ���̺��� ��� �÷�(�ʵ�, ��ƼƼ)�� ���
    -- �Ǹ� ������ �����ϴ� ���̺�
select *
from salgerade;

-- =========================================

-- �� ���̺��� ������ �÷�����

-- 1. employee ���̺�
select * from employee;
/*
    ������ �÷��� ���� ����
    ENO : �����ȣ 
    ENAME : �����
    JOB : ��å
    MANAGER : ����� �����ȣ(����� �����ȣ)
    HIREDATE : �Ի���
    SALARY : ����
    COMMISSION : ���ʽ�
    DNO : �μ���ȣ
*/

-- 2. �μ������� �����ϴ� ���̺�
select * from department;
/*
    DNO : �μ���ȣ
    DNAME : �μ���
    LOC : �μ��� ��ġ
*/

-- 3. ������ ������ �����ϴ� ���̺�
select * from salgrade;
/*
     GRADE : ���� <- ������ ���� : ���ڰ� �������� ������ ����
     LOSAL : ���� ���� ����
     HISAL : ���� ���� ����
*/

-- ======================================

-- �÷�, �ʵ�, ��ƼƼ (��� �����Ѹ�)
-- ���ڵ� : �� �÷��� �� ��, 1��(1����)
-- ���ڵ� �� : ���ڵ���� ����
select *
from employee;

-- Ư�� �÷��� ����ϱ�
select eno
from employee;

-- Ư�� �÷� ������ ����ϱ� (�ϳ��� �÷��� ���� ��� ,(�޸�)�� ����)
select eno, ename, salary
from employee;

-- ��� �÷� ����ϱ�
select eno, ename,job,manager, hiredate, salary, commission, dno
from employee;

-- Ư�� �÷��� ��½� ������ ����ϱ�
select eno, ename, salary, ename, ename
from employee;

-- ���̺��� ���� Ȯ�� �ϱ� : ���̺��� �÷����� Ȯ��
DESCRIBE employee;
desc employee; --���� ����

-- �÷��� ��Ī���� ����ϱ�(�÷��� as(��������) ��Ī)
select eno as �����ȣ, ename as �����, job as ��å
from employee;

select eno �����ȣ, ename  �����, job  ��å
from employee;

-- employee ���̺��� ��� �÷��� ��Ī���� ���
select eno �����ȣ, ename �����, job ��å, manager �����ȣ,
    hiredate " �Ի���", salary "�� ��", commission "��%�ʽ�", dno "�μ� ��ȣ"
FROM employee;

-- ������ ����Ͽ� ��� : where
select *
from employee
where eno = 7499; -- eno �÷��� ���� 7499�ΰ͸� ����ض�

desc employee; -- emplouee ���̺��� ������ Ȯ��

-- ���� ��½� : number ������ Ÿ���� ���� '' ���� ���
-- number �̿��� ������ Ÿ���� ��� ''�� ���� ��� : char, varchar, date

select * from employee
where job = 'MANAGER' ; --''���ٸ� ���ڷ� �޾Ƶ��� ����
--job�� ������Ÿ���� varchar2, ���� �����ö��� ��ҹ��� ����

select * from employee;

-- �μ���ȣ�� 20���� ��� �÷�
select * from employee
where dno = 20;

-- <����>
desc employee;
-- salary (����) 2000�̻��� ����ڸ� ��� �÷� ���
select * from employee
where salary >= 2000;

-- �̸��� CLARK �� ������� ���޸� ���
select salary from employee
where ename = 'CLARK';

-- �����ȣ (eno) 7788�� �̸��� �Ի糯¥ <-�÷��̸��� ��Ī���� ���
select ename ��´�, hiredate from employee
where eno = 7788;

--Select ���� ��ü ����-----------
/* ������ ���Ѿ� ������ �ȳ�
select  -- �÷��� : * (����÷�), * �ݵ�� ������
distinct  -- �ߺ��� ���� �����ؼ� ����ض�(��������)
from    -- ���̺��, ���̸�       * �ݵ�� ������    
 - where   -- ����
   - group by -- �÷��� : Ư�� �÷��� ������ ���� �׷���
   - Having   -- group by ���� ���� ����� ������ ó��
 - Order by -- �����ؼ� ��� �� �÷�, asc : ��������, desc : ��������
*/

select * from employee;

select distinct dno �μ���ȣ 
--distinct ����, �ٸ� �÷��� ���ÿ� �۵��ϸ� �����߻�
from employee;

select distinct dno, eno
-- �÷� �ΰ��� ����
from employee;

-- �÷��� ������ ���� : �÷����� ������, alias�ؼ� ���
select eno, ename, salary as ���� , salary * 12 as ����, commission ���ʽ�
from employee;

-- ��ü ���� ���ϱ� : ���޿��� *12 + ���ʽ� = ��ü ����
    --null �÷��� ����(+,-,*,/)�� �ϰԵǸ� ��ü�� null
select eno, ename, salary, commission, salary * 12 as ����, 
(salary * 12) + commission as ��ü����
from employee;

-- ��ü ������ ����Ҷ� null �� �÷��� 0���� ���� �� ������ �����ؾ� �Ѵ�
    -- nvl �Լ� : null�� �� �÷��� �ٸ� ������ ��ȯ�ؼ� ó���� �ִ� �Լ�
    -- nvl (commission, 0); <-Ŀ�̼� �÷��� null�� 0���� �ٲ㼭 ó���ض� 
select eno, ename, salary, commission, salary * 12 as ����, 
(salary * 12) + nvl (commission, 0) as ��ü����
from employee;

-- null�� �� �÷��� ����ϱ� <== ����
    -- null�� �˻� �Ҷ��� = �� �ƴ� is�� ����ؾ��Ѵ�
select *
from employee
where commission is null;

select *
from employee
  -- null�� �ȵ��� �˻��ض� 
where commission is not null; 

-- where ���ǿ��� and, or ����ϱ�
-- �μ� ��ȣ(DNO)�� 20���̰ų� 30�� ��� �÷� ���
select *
from employee
where dno = 20 or dno = 30;

select *
from employee
  -- �μ���ȣ�� 20�̰� ������ 1500�̻��̸� ��� �÷� ���
where dno = 20 and salary >= 1500;

-- job(��å)�� MANAGER �̸鼭 ������ 2000�̻��� ����ڸ� ���
select *
from employee
where job = 'MANAGER' and salary >= 2000;


-- <����>
/* employee ���̺��� �۾�, select ���� ���, where ������ ����ؼ� ���
<����1> �÷� �˸��(��Ī), cimmission(���ʽ�) �÷��� null�� ���� ����ϵ� 
�����ȣ(eno),����̸�(ename),�Ի糯¥(hiredate)�� ���
<����2> dno(�μ���ȣ)�� 20�̰� �Ի糯¥�� 81�� 4�� ���� ����� �̸��� ��å��
�Ի糯¥�� ���
<����3> ������ ����ؼ� �����ȣ, ����̸�, ����, ���ʽ�, ��ü���� ���
<����4> commission�� null�� �ƴ� ������� �̸��� ���
<����5> manager (���)7698�� ����̸��� ��å�� ���
<����6> ������ 1500�̻��̰� �μ��� 20�� ����� ����̸��� �Ի糯¥, �μ���ȣ, ���� ��� 
<����7> �Ի糯¥�� 81�� 4�� 1�� �̻��̰� 81�� 12�� ���ϱ����� ����̸��� �Ի糯¥�� ���
<����8> ��å(job) salesman�̸鼭 ������ 1500�̻��̸鼭 �μ���ȣ�� 30�� ������� ���
<����9> ������ 1500 �����̸鼭 �μ���ȣ�� 20���� �ƴ� ����̸��� ���ް� �μ���ȣ�� ���
<����10> �����ȣ(eno)�� 7788,7782�� �μ���ȣ�� �̸��� ��å�� ���
*/

select * from employee;
desc employee;
--1
select eno �����ȣ, ename ����̸�, hiredate �Ի糯¥
from employee
where commission is null;

--2
select ename, job, hiredate 
from employee
where dno = 20 or hiredate = '80/04/01';

--3
select eno �����ȣ, ename ����̸�, salary ����, commission ���ʽ�,
(salary * 12)+ nvl (commission,0) ��ü����
from employee;

--4
select ename ������̸�
from employee
where commission is not null;

--5
select ename ����̸�, job ��å
from employee
where MANAGER = 7698;

--6
select ename ����̸�, hiredate �Ի糯¥, dno �μ���ȣ, salary ����
from employee
where salary >= 1500 and dno = 20;

--7
select ename ����̸�, hiredate �Ի糯¥
from employee
where hiredate >= '81/04/01' and hiredate <= '81/12/31';

--8
select ename �����
from employee
where job = 'SALESMAN' and dno = 30 and salary >= 1500;

--9
select ename ����̸�, salary ����, dno �μ���ȣ
from employee
where salary <= 1500 and dno != 20;

--10
select dno �μ���ȣ, ename �̸�, job ��å
from employee
where eno = 7788 or eno = 7782;
