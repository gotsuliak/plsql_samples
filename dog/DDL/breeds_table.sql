-------------------------------------------------------
--DROP TABLE breeds
-------------------------------------------------------
CREATE TABLE breeds
(
       breed_id NUMBER NOT NULL,
       breed_name_eng VARCHAR2(256) NOT NULL,
       breed_name_ukr VARCHAR2(256),
       breed_name_rus VARCHAR2(256),
       CONSTRAINT breed_pk PRIMARY KEY (breed_id)
);
--------------------------------------------------------
ALTER TABLE breeds ADD CONSTRAINT breed_name_eng_con UNIQUE(breed_name_eng);
ALTER TABLE breeds ADD CONSTRAINT breed_name_ukr_con UNIQUE(breed_name_ukr);
ALTER TABLE breeds ADD CONSTRAINT breed_name_rus_con UNIQUE(breed_name_rus);
---------------------------------------------------------
--DROP SEQUENCE breed_id_seq
---------------------------------------------------------
CREATE SEQUENCE breed_id_seq
       START WITH 1
       INCREMENT BY 1;
---------------------------------------------------------
/*CREATE OR REPLACE FUNCTION insert_new_breed (v_breed_name IN VARCHAR2, lang CHAR := 'E') return NUMBER
IS
BEGIN
  CASE lang 
    WHEN 'E' THEN
                 INSERT INTO breeds(breed_id, breed_name_eng)
                 VALUES(breed_id_seq.nextval ,v_breed_name);
    WHEN 'U' THEN
                 INSERT INTO breeds(breed_id, breed_name_ukr)
                 VALUES(breed_id_seq.nextval ,v_breed_name);
    WHEN 'R' THEN 
                 INSERT INTO breeds(breed_id, breed_name_rus)
                 VALUES(breed_id_seq.nextval ,v_breed_name);
  END CASE;
  
  COMMIT;
  RETURN breed_id_seq.currval;   
END;*/
-----------------------------------------------------------

