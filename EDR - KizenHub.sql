CREATE TABLE "observatory" (
  "observatory_id" integer PRIMARY KEY,
  "observatory_name" char(50),
  "observatory_latitude" float,
  "observatory_longitude" float
);

CREATE TABLE "astronomer" (
  "astronomer_id" integer PRIMARY KEY,
  "observatory_id" integer,
  "astronomer_affiliation_date" date,
  "astronomer_name" char(50)
);

CREATE TABLE "paper" (
  "paper_id" integer PRIMARY KEY,
  "astronomer_id" integer,
  "paper_title" char(10),
  "paper_publication_date" date,
  "journal_name" char(10)
);

CREATE TABLE "instrument" (
  "instrument_id" integer PRIMARY KEY,
  "observatory_id" integer,
  "astronomer_id" integer,
  "instrument_wavelenght" integer,
  "instrument_type" char(50)
);

ALTER TABLE "astronomer" ADD FOREIGN KEY ("observatory_id") REFERENCES "observatory" ("observatory_id");

ALTER TABLE "paper" ADD FOREIGN KEY ("astronomer_id") REFERENCES "astronomer" ("astronomer_id");

ALTER TABLE "astronomer" ADD FOREIGN KEY ("astronomer_id") REFERENCES "instrument" ("astronomer_id");

ALTER TABLE "observatory" ADD FOREIGN KEY ("observatory_id") REFERENCES "instrument" ("observatory_id");
