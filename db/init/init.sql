CREATE DATABASE synapse ENCODING 'UTF8' LC_COLLATE='C' LC_CTYPE='C' TEMPLATE = template0;

\connect synapse
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'synapse_user') THEN --Define synapse db User and change subsequent commands
        CREATE ROLE synapse_user LOGIN PASSWORD ''; -- Define Password
	
	ALTER DATABASE synapse OWNER TO synapse_user;

	REVOKE ALL ON DATABASE synapse FROM PUBLIC;
	REVOKE CREATE ON SCHEMA public FROM PUBLIC;

	ALTER SCHEMA public OWNER TO synapse_user;
	GRANT ALL ON SCHEMA public TO synapse_user;

	GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO synapse_user;
	GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO synapse_user;

	GRANT CONNECT ON DATABASE synapse TO synapse_user;

    END IF;
END
$$;


