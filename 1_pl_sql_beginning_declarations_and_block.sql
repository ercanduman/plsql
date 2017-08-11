/******* PLSQL trainings *******/
DECLARE
  -- declaration part, all variables should be declared here.
  vn_i    NUMBER;
  vs_name VARCHAR2(15) := 'Ercan';

  -- variable assignment (not recommended only constants should be assigned here, variable assignments should be in begin-end block)
  vn_k NUMBER := 1000;

BEGIN
  -- variable assignment prefixes
  /*for variable assignments
        vs_ -> string variable
        vn_ -> number variable
        vd_ -> date variabel  
        vb_ -> boolean variable
  */
  -- vn_i := 2;
  -- 'INFO> ' keys are nice to see in output messages
  dbms_output.put_line('INFO> vn_k = "' || vn_k || '"');
  dbms_output.put_line('INFO> vn_i = "' || vn_i || '"');

  vn_k := 10 / 0; --Power(vn_i, -10);
  dbms_output.put_line('INFO> vn_k = "' || vn_k '"');

  -- exception handling...
EXCEPTION
  WHEN OTHERS THEN
    -- 'ERROR> ' keys are nice to see in output messages
    dbms_output.put_line('ERROR> Exception occurred = ' || SQLERRM);
  
END;
