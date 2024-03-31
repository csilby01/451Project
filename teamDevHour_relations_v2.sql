CREATE TABLE Business(
    business_id 	VARCHAR(22) PRIMARY KEY,
    name 		    VARCHAR(30),
    neighborhood 	VARCHAR(20),
    address 	    VARCHAR(80),
    city 		    VARCHAR(30),
    state 		    VARCHAR(13),
    postal_code 	VARCHAR(10),
    latitude 	    DECIMAL(12, 9),
    longitude 	    DECIMAL (12, 9),
    numCheckins     INT DEFAULT 0,
    reviewrating    FLOAT(2) DEFAULT 0.0,
    stars 		    FLOAT(2),
    review_count    INT,
    is_open 	    BOOLEAN
);

CREATE TABLE Attribute(
    business_id     VARCHAR(22),
    attribute       VARCHAR(30),
    value           TEXT,
    PRIMARY KEY (business_id, attribute),
    FOREIGN KEY business_id REFERENCES Business(business_id) ON DELETE CASCADE
)

CREATE TABLE SubAttribute(
    business_id    VARCHAR(22),
    attribute      VARCHAR(30),
    sub_attribute  VARCHAR(30),
    value          TEXT,
    PRIMARY KEY (business_id, attribute, sub_attribute),
    FOREIGN KEY business_id REFERENCES Business(business_id) ON DELETE CASCADE,
    FOREIGN KEY attribute REFERENCES Attribute(attribute)
)

CREATE TABLE User(
    user_id		        VARCHAR(22) PRIMARY KEY,
    average_stars 	    FLOAT(2),
    compliment_cool 	INT,
    compliment_cute	    INT,
    compliment_funny 	INT,
    compliment_hot 	    INT,
    compliment_list	    INT,
    compliment_more	    INT,
    compliment_note	    INT,
    compliment_photos	INT,
    compliment_plain	INT,
    compliment_profile	INT,
    compliment_writer	INT,
    cool			    INT,
    fans			    INT,
    funny 			    INT,
    name			    VARCHAR(30),
    review_count		INT,
    useful			    INT,
    yelping_since		DATE NOT NULL
);
	
CREATE TABLE Friends(
    user_id     VARCHAR(22),
    friend_id   VARCHAR(22),
    PRIMARY KEY(user_id, friend_id),
    FOREIGN KEY user_id REFERENCES User(user_id),
    FOREIGN KEY friend_id REFERENCES User(user_id)
);

CREATE TABLE Elite(
    user_id     VARCHAR(22),
    year        INT,
    PRIMARY KEY(user_id, year),
    FOREIGN KEY user_id REFERENCES User(user_id)
)

CREATE TABLE Checkin(
	business_id	    VARCHAR(22),
	time 		    VARCHAR(5),
    day             VARCHAR(9),
    count           INT,
    PRIMARY KEY(business_id, time, day),
	FOREIGN KEY business_id REFERENCES Business(business_id) ON DELETE CASCADE
);

CREATE TABLE Reviews(
	review_id 	VARCHAR(22) PRIMARY KEY,
	business_id	VARCHAR(22) REFERENCES Business(business_id),
	user_id	    VARCHAR(22) REFERENCES User(user_id),
    date		DATE,
    stars		FLOAT(2) NOT NULL,
    text 		TEXT,
    useful 		INT DEFAULT 0,
    funny 		INT DEFAULT 0,
    cool		INT DEFAULT 0
);

CREATE TABLE Hours(
    business_id 	VARCHAR(22),
    day_of_week	    VARCHAR (9),
    hours_of_op 	TIMESTAMP,
    PRIMARY KEY (business_id, day_of_week),
    FOREIGN KEY business_id REFERENCES Business(business_id) ON DELETE CASCADE
);

CREATE TABLE Categories(
    business_id     VARCHAR(22),
    category_name   VARCHAR(30),
    PRIMARY KEY(business_id, category_name),
    FOREIGN KEYU business_id REFERENCES Business(business_id) ON DELETE CASCADE
);

