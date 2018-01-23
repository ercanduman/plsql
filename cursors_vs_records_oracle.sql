DECLARE
  CURSOR vc_MyCursor IS
    SELECT * FROM employees e WHERE department_id = 30;

  vr_RecEmployees EMPLOYEES%ROWTYPE;
  PROCEDURE PrintOutput(pir_Record IN EMPLOYEES%ROWTYPE) IS
  BEGIN
    dbms_output.put_line('INFO> Name: ' || pir_Record.first_name ||
                         ' - Last Name: ' || pir_Record.last_name ||
                         ' - Salary: ' || pir_Record.salary);
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line('ERROR> ' || substr(SQLERRM ||
                                               dbms_utility.format_error_backtrace,
                                               1,
                                               1000));
  END PrintOutput;
BEGIN

  -- cursor 1. way open, fetch,close cursor
  OPEN vc_MyCursor; --open
  dbms_output.put_line(chr(11) || 'INFO> vc_MyCursor''s CURSOR LOOP!');
  LOOP
    IF NOT vc_MyCursor%ISOPEN THEN
      OPEN vc_MyCursor;
    END IF;
    FETCH vc_MyCursor -- fetch
      INTO vr_RecEmployees;
    EXIT WHEN vc_MyCursor%NOTFOUND;
    PrintOutput(vr_RecEmployees);
  END LOOP;
  IF vc_MyCursor%ISOPEN THEN
    CLOSE vc_MyCursor; --close
    dbms_output.put_line('INFO> CURSOR closed!');
  END IF;

  -- cursor 2. way -> using record as cursor of select statement in for loop!
  dbms_output.put_line(chr(11) ||
                       'INFO> FOR rec IN (SELECT statement) LOOP! ');
  FOR rec IN (SELECT * FROM employees e WHERE department_id = 30) LOOP
    PrintOutput(rec);
  END LOOP;

  -- cursor 3. way -> using record based on cursor in for loop!
  -- RECORD is every single item in cursor (cursordaki herbir kayýt RECORD diye tanýmlanýr)
  dbms_output.put_line(chr(11) ||
                       'INFO> FOR rec IN (Declared CURSOR) LOOP! ');
  FOR rec IN vc_MyCursor LOOP
    PrintOutput(rec);
  END LOOP;

EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('ERROR> ' || substr(SQLERRM ||
                                             dbms_utility.format_error_backtrace,
                                             1,
                                             1000));
END;
