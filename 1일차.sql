
insert into muTbl values('1','1234'); --���̺� �� ����
commit -- DB�� ���������� �����ض�

show user; -- ���� ����

select * from muTbl;

-- �� �� �ּ� : ���α׷����� �ؼ����� �ʴ� ����
/*
  ������ �ּ�
*/

-- 1. HR ���� ���� : 12 �������� ������ ������ ������ �տ� C## ��   �ٿ��� �Ѵ�.
-- HR : ������, ��ȣ : 1234
create user C##HR identified by 1234;

-- 2. HR ������ ���� �ο� : connect, resource ������ �ο�
grant connect, resource to C##HR;

-- 3. ���̺� �����̽��� ����� ���� �ο� (system ��������)
    -- USERS ���̺� �����̽��� ��뷮�� ������ ����� �� �ֵ��� ���� �ο�
alter user C##HR quota unlimited on USERS;

-- 4. HR ���� ���� �غ���
drop user C##HR;


/*HR ���� ����*/

-- 1. HR �������� ���� Ȯ�� : resoure (���̺� ����,����,����)
show user;

-- 2. ���̺� ����  ; <- ���� ������ ��ɾ ó���Ǵ� ���
create table myTbl2 (
    id varchar2 (20),
    pass varchar2 (20)
    );

-- 3. ���̺� �� �ֱ� : commit (�����϶�)
insert into myTbl2 values ('1', '1234');
commit; -- DB�� ���������� �����ض�(insrt,update,delete �������� ���)

-- 4. ���̺��� ���� ����ϱ�
select * from myTbl2;

-- 5. ���̺� ���� �ϱ�
drop table myTbl2;

