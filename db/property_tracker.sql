DROP TABLE IF EXISTS property_tracker;

CREATE TABLE property_tracker (
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value INT,
  number_of_bedrooms INT2,
  buylet_status VARCHAR(255)
);
