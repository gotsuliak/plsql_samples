CREATE OR REPLACE FUNCTION show_pedigree_next_level(ped_lev IN pedigree_level) return pedigree_level IS
       pedigree_next_level pedigree_level:=pedigree_level();
       the_dog_parents pedigree_level:=pedigree_level();
BEGIN
       the_dog_parents.extend(2);
       FOR i IN  ped_lev.FIRST..ped_lev.LAST
       LOOP
         the_dog_parents:=show_dog_parents(ped_lev(i).dog_id);
         pedigree_next_level:= pedigree_next_level multiset union the_dog_parents;
       END LOOP;
RETURN  pedigree_next_level;
END;
