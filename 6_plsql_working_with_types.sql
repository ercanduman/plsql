-- Defining a type_1 (simple way)
DECLARE
	TYPE t_Trainers IS RECORD(
		SocialNetwork VARCHAR(15),
		Username      VARCHAR(30),
		birthDate     DATE);

	vt_Person t_Trainers;

BEGIN

	vt_Person.socialnetwork := 'Github';
	vt_Person.username      := 'ercanduman';
	vt_Person.birthdate     := to_date('06/04/1990', 'DD/MM/YYYY');

	dbms_output.put_line('INFO> Social Network ' || vt_Person.socialnetwork ||
											 ' is used with ''' || vt_Person.username ||
											 ''' user name.');
	dbms_output.put_line('INFO> Age is: ' ||
											 --finding age from given date of birth
											 TRUNC((SYSDATE - vt_Person.birthdate) / 365.25));
END;
/


-- Defining a type_2 (using as a list)
DECLARE
	TYPE t_Person IS RECORD(
		NAME         VARCHAR(20),
		phoneNum     VARCHAR(11),
		vacationDays NUMBER(5));

	TYPE t_PersonList IS TABLE OF t_Person;

	vt_Employees t_PersonList;
BEGIN

	--initialize 
	vt_Employees := t_PersonList();

	--1. employee
	vt_Employees.EXTEND();
	vt_Employees(vt_Employees.count).name := 'Ercan';
	vt_Employees(vt_Employees.count).phonenum := '5421112233';
	vt_Employees(vt_Employees.count).vacationdays := 15;

	--2. employee
	vt_Employees.extend;
	vt_Employees(vt_Employees.count).name := 'Serhat';
	vt_Employees(vt_Employees.count).phonenum := '5438887799';
	vt_Employees(vt_Employees.count).vacationdays := 7;

	--3. employee
	vt_Employees.extend;
	vt_Employees(vt_Employees.count).name := 'Baris';
	vt_Employees(vt_Employees.count).phonenum := '5435550011';
	vt_Employees(vt_Employees.count).vacationdays := 11;
	/*  .
      .
      .
  can assign many more employees to vt_Employees list*/

	IF vt_Employees IS NOT NULL
	THEN
	
		-- print all employee information one by one.
		FOR i IN 1 .. vt_Employees.count
		LOOP
			dbms_output.put_line('INFO> ' || vt_Employees(i).name || ' has ' || vt_Employees(i)
													 .vacationdays ||
													 ' vacation days. In any case contact him/her with ''' || vt_Employees(i)
													 .phonenum || ''' phone number.');
		END LOOP;
	END IF;

END;
/
