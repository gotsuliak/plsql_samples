--DROP TABLE dogs;
---------------------------------
-- Create table -----------------
---------------------------------
CREATE TABLE dogs
(
  id             NUMBER,
  dog_name       VARCHAR2(256),
  short_name     VARCHAR2(100),
  birthay        DATE,
  photo          VARCHAR2(256),
  kennel         VARCHAR2(512),
  kennel_oni     VARCHAR2(512),
  pedigree_n     VARCHAR2(512),
  country_birth  VARCHAR2(512),
  country_living VARCHAR2(512),
  address_birth  VARCHAR2(512),
  address_living VARCHAR2(512),
  breed          NUMBER,
  color          VARCHAR2(100),
  sex            CHAR(1),
  chip           VARCHAR2(100)
)
----------------------------------------------------------------
ALTER TABLE dogs ADD CONSTRAINT dogs_pk PRIMARY KEY (id);
ALTER TABLE dogs ADD CONSTRAINT breeds_fk FOREIGN KEY(breed) REFERENCES breeds(breed_id);
----------------------------------------------------------------
-----CREATE SEQUENCE -------------------------------------------
----------------------------------------------------------------
-- DROP SEQUENCE dog_id_seq
CREATE SEQUENCE dog_id_seq
START WITH 1
INCREMENT BY 1;
----------------------------------------------------------------
---- BEFORE INSERT TRIGGER -------------------------------------
----------------------------------------------------------------
CREATE OR REPLACE TRIGGER dog_seq_trigger
BEFORE INSERT ON dogs FOR EACH ROW
BEGIN
       :NEW.id := dog_id_seq.NEXTVAL;
END;


