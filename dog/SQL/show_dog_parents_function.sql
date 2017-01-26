CREATE OR REPLACE FUNCTION show_dog_parents(dog_id IN dog.id%TYPE) return pedigree_level IS
 l_dog_tab   pedigree_level :=pedigree_level();    
 Cursor dog_parents_cur(the_dog_id dog.id%TYPE) RETURN dog%rowtype
 IS
    (SELECT d.*
    from dog d JOIN parents p
    ON d.id=p.parent_id
    WHERE p.child_id=the_dog_id);
    
BEGIN
  FOR the_dog IN dog_parents_cur(dog_id)
  LOOP
    l_dog_tab.extend();
    l_dog_tab(l_dog_tab.last):= dog_parent_type(the_dog.id, dog_id, the_dog.sex); --
  END LOOP;
  
 RETURN l_dog_tab;
END;
