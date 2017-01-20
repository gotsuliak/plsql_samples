CREATE OR REPLACE FUNCTION insert_new_breed (v_breed_name IN VARCHAR2, lang CHAR := 'E') return NUMBER
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
END;
