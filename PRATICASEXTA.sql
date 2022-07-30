CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	fullName VARCHAR(30) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	email TEXT NOT NULL,
	password TEXT NOT NULL

);

CREATE TABLE customerPhones(
	id SERIAL PRIMARY KEY,
	customerId INTEGER NOT NULL REFERENCES "customers"("id"),
	number BIGINT NOT NULL UNIQUE,
	type TEXT

);

CREATE TABLE cities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	stateId INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE states(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);



CREATE TABLE customerAddresses(
	id SERIAL PRIMARY KEY,
	customerId INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
	street VARCHAR(50) NOT NULL,
	number INTEGER NOT NULL,
	complement VARCHAR(50) NOT NULL,
	postalCode INTEGER NOT NULL,
	cityId INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE bankAccount(
	id SERIAL PRIMARY KEY,
	customerId INTEGER NOT NULL REFERENCES "customers"("id"),
	accountNumber BIGINT NOT NULL,
	agency VARCHAR(30) NOT NULL,
	openDate TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	closeDate DATE
);

CREATE TABLE transations(
	id SERIAL PRIMARY KEY,
	bankAccountId INTEGER NOT NULL REFERENCES "bankaccount"("id"),
	amount BIGINT NOT NULL,
	type VARCHAR(30) NOT NULL,
	time TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	description TEXT NOT NULL,
	cancelled BOOLEAN NOT NULL DEFAULT false
);





