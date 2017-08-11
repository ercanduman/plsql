-- exception handling
DECLARE
	vn_customerId   NUMBER;
	vs_customerName VARCHAR(5);
	ve_invalidCustomerId         EXCEPTION;
	ve_invalidCustomerNameLength EXCEPTION;

BEGIN
	vn_customerId   := 10; -- put -1 for ve_invalidCustomerId exception
	vs_customerName := '';

	-- all exceptions should be handled at the end. because the rest of the won't run. 
	IF vn_customerId < 0
	THEN
		RAISE ve_invalidCustomerId;
	END IF;

	-- Another option: you can have nested block to handle exception in the beginning
	BEGIN
		IF vs_customerName IS NULL
			 OR length(vs_customerName) = 0
		THEN
			RAISE ve_invalidCustomerNameLength;
		END IF;
	EXCEPTION
		WHEN OTHERS THEN
			vs_customerName := 'EMPTY';
      dbms_output.put_line('ERROR> Nested block error > customer name is: ' || vs_customerName);
	END;

EXCEPTION
	WHEN ve_invalidCustomerID THEN
		dbms_output.put_line('ERROR> Invalid customer id, customer id should be a positive number and unique!');
		dbms_output.put_line('ERROR> Given customer id is: ' || vn_customerId);
	WHEN ve_invalidCustomerNameLength THEN
		dbms_output.put_line('ERROR> Customer name should not be null');
	WHEN OTHERS THEN
		dbms_output.put_line('ERROR> An error occurred which is: ' || SQLERRM);
END;
