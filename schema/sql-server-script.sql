/** 
 * Part of migration script to replace the postgres ETHelp database.
 * 
 * @author Kaleb - k@solutionladder.com
 * 
 */

CREATE TABLE member (
	    id bigint NOT NULL,
	    date_create datetime default current_timestamp,
	    date_of_birth date,
	    email character varying(255),
	    first_name character varying(255),
	    last_name character varying(255),
	    password_hash character varying(255),
	    salt character varying(255)
);

CREATE TABLE help (
	    id bigint NOT NULL,
	    date_created datetime default current_timestamp,
	    message text,
	    title character varying(255),
	    member_id integer NOT NULL
);

CREATE TABLE help_like (id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	member_id BIGINT NOT NULL,
	help_id BIGINT NOT NULL,
	FOREIGN KEY (member_id) REFERENCES member(id),
	FOREIGN KEY (help_id) REFERENCES help(id)
)

