CREATE SCHEMA policy;
GO

CREATE TABLE policy.policy_fact 
	(
	policy_number INT FOREIGN KEY (policy)
	policy_holder_id INT FOREIGN KEY (policyholder)
	,claim_id INT FOREIGN KEY (claim)
	);

CREATE TABLE policy.policy
	(
	policy_number INT PRIMARY KEY
	,policy_holder_id INT FOREIGN KEY (policy_holder)
	,coverage NVARCHAR(50)
	,premium INT
	,deductible INT
	,amount_covered INT
	,effective_date DATE
	,expiration_date DATE
	)

CREATE TABLE policy.policy_holder
	(
	policy_holder_id INT PRIMARY KEY
	,policy_number INT FOREIGN KEY (policy)
	,Name NVARCHAR(250)
	,gender NVARCHAR(50)
	,age INT
	,date_of_birth DATE NOT NULL
	,social_security_number NVARCHAR(50)
	,smoking_status BIT
	,allergies NVARCHAR(MAX)
	,health_conditions NVARCHAR(MAX)
	);

CREATE TABLE policy.claim
	(
	claim_id INT NOT NULL PRIMARY KEY
	,policy_holder_id INT FOREIGN KEY (policy_holder)
	,policy_number INT FOREIGN KEY (policy)
	,loss_date DATE
	,amount_billed INT
	,claim_type NVARCHAR(50)
	,claimant_name NVARCHAR(250)
	);
