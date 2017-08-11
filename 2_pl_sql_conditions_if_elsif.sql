-- conditions (if and elsif)
DECLARE 
	vn_startNumber NUMBER := -4;
	vn_endNumber NUMBER := NULL; -- null or '' 

BEGIN
  IF (vn_startNumber > 0) THEN
    dbms_output.put_line('INFO> vn_startNumber is negative');
  ELSIF (MOD(vn_startNumber, 2) = 0) THEN
    dbms_output.put_line('INFO> vn_startNumber is an even number');
  ELSE
    dbms_output.put_line('INFO> vn_startNumber is positive');
  END IF;

  -- null checking 'IS NULL' keyword has to be used! othervise not going through if statement
  IF (vn_endNumber IS NULL) THEN
    dbms_output.put_line('INFO> vn_endNumber is empty');
  END IF;

END;
/