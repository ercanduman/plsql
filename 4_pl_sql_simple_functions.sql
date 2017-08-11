--simple function definition
CREATE OR REPLACE FUNCTION functionName RETURN VARCHAR IS
	-- declarations
	vs_returnString VARCHAR(30);
BEGIN
	-- assingments
	vs_returnString := 'Hello from function! ';

	-- return 
	RETURN vs_returnString;
END functionName;
/

	-- run funcktion
SELECT functionName() FROM dual;
