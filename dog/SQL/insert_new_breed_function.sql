CREATE OR REPLACE FUNCTION insert_new_breed (v_breed_name IN VARCHAR2, lang CHAR := 'E') return NUMBER
IS
invalid_lang EXCEPTION;
PRAGMA EXCEPTION_INIT (invalid_lang, -20001); 
BEGIN
  CASE UPPER(lang) 
    WHEN 'E' THEN
                 INSERT INTO breeds(breed_id, breed_name_eng)
                 VALUES(breed_id_seq.nextval ,v_breed_name);
    WHEN 'U' THEN
                 INSERT INTO breeds(breed_id, breed_name_ukr)
                 VALUES(breed_id_seq.nextval ,v_breed_name);
    WHEN 'R' THEN 
                 INSERT INTO breeds(breed_id, breed_name_rus)
                 VALUES(breed_id_seq.nextval ,v_breed_name);
    ELSE 
      RAISE_APPLICATION_ERROR( -20001, 'Incorrect lang value "'||lang||'" The lang value should be in "E|U|R"');
  END CASE;
  COMMIT;
  RETURN breed_id_seq.currval;   
END;
