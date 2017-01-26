CREATE OR REPLACE FUNCTION show_parents_sr(dog_id IN NUMBER) return SYS_REFCURSOR
IS
    dog_parents SYS_REFCURSOR;

BEGIN
    OPEN dog_parents FOR
    SELECT d.*
    from dog d JOIN parents p
    ON d.id=p.parent_id
    WHERE p.child_id=dog_id;
    
    RETURN dog_parents;
END;
