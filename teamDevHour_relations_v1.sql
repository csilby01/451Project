CREATE TABLE Business(
    business_id 	VARCHAR(22) PRIMARY KEY,
    name 		VARCHAR,
    neighborhood 	VARCHAR,
    address 	VARCHAR,
    city 		VARCHAR,
    state 		VARCHAR,
    postal_code 	VARCHAR,
    latitude 	INT,
    longitude 	INT,
    stars 		FLOAT(2),
    review_count  INT,
    is_open 	BOOL,
    categories	VARCHAR[ ]
);

CREATE TABLE User(
    user_id		VARCHAR(22) PRIMARY KEY,
    average_stars 	FLOAT(2),
    compliment_cool 	INT,
    compliment_cute	INT,
    compliment_funny 	INT,
    compliment_hot 	INT,
    compilment_list	INT,
    compliment_more	INT,
    compliment_note	INT,
    compliment_photos	INT,
    compliment_plain	INT,
    compliment_profile	INT,
    compliment_writer	INT,
    cool			INT,
    elite			INT[ ],
    fans			INT,
    friends			VARCHAR[ ],
    funny 			INT,
    name			VARCHAR,
    review_count		INT,
    useful			INT,
    yelping_since		DATE NOT NULL
);
	
CREATE TABLE checkin(
	business _id	VARCHAR(22) PRIMARY KEY,
	time 		    TIME,
	FOREIGN KEY business_id REFERENCES Business(business_id)
);

CREATE TABLE reviews(
	review_id 	VARCHAR(22) PRIMARY KEY,
	business_id	VARCHAR(22) REFERENCES Business(business_id),
	user_id	    VARCHAR(22) REFERENCES User(user_id),
    date		DATE,
    stars		FLOAT(2),
    text 		VARCHAR,
    useful 		INT DEFAULT 0,
    funny 		INT DEFAULT 0,
    cool		INT DEFAULT 0
);

CREATE TABLE hours(
    business_id 	VARCHAR(22),
    day_of_week	VARCHAR (9),
    hours_of_op 	TIMESTAMP,
    PRIMARY KEY (business_id, day_of_week),
    FOREIGN KEY business_id REFERENCES Business(business_id) ON DELETE CASCADE
);
	
CREATE TABLE attributes(
	business_id 	VARCHAR(22), 
	attribute	VARCHAR,
	bool		BOOLEAN,
	PRIMARY KEY(business_id, attribute),
	FOREIGN KEY business_id REFERENCES Business(business_id) ON DELETE CASCADE
);
