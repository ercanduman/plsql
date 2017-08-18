--implicit cursor
BEGIN

	FOR rec IN (SELECT * FROM trainers)
	LOOP
		dbms_output.put_line('INFO> ID: ' || rec.id || ' NAME: ' || rec.name ||
												 ' START_COUNT: ' || rec.start_count);
	END LOOP;

END;
/

-- explicit cursor
DECLARE

  CURSOR cur_Employees IS(
    SELECT * FROM trainers);
  rec_emp cur_Employees%ROWTYPE;

BEGIN

  OPEN cur_Employees;

  LOOP
    FETCH cur_Employees
      INTO rec_emp;
  
    EXIT WHEN cur_Employees%NOTFOUND;
    dbms_output.put_line('INFO> ID: ' || rec_emp.id || ' NAME: ' ||
                         rec_emp.name || ' START_COUNT: ' ||
                         rec_emp.start_count);
  END LOOP;

  CLOSE cur_Employees;
END;
/