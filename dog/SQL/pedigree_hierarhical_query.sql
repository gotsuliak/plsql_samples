--pedigree hierarhical query 1st variant -----------------------------
WITH Parents_info As
 (SELECT p.child_id child_id, p.parent_id parent_id, d.sex parent_sex
    FROM Parents p, Dog d
   WHERE p.parent_id = d.id)
   
SELECT d.id,
       d.dog_name || NVL2(d.short_name, '(' || d.short_name || ')', ''),
       pi.parent_id,
       pi.parent_sex,
       level
  FROM Dog d
  LEFT OUTER JOIN Parents_info pi
    ON d.id = pi.child_id
 START WITH d.id = 1
CONNECT BY PRIOR pi.parent_id = d.id;
--pedigree hierarhical query 2nd variant --------------------------------   
SELECT d.id,
       d.dog_name || NVL2(d.short_name, '(' || d.short_name || ')', ''),
       p.parent_id,
       (SELECT d1.sex
        FROM Dogs d1
        WHERE p.parent_id = d1.id) parent_sex,
       level
  FROM Dog d
  LEFT OUTER JOIN Parents p
    ON d.id = p.child_id
 START WITH d.id = 1
CONNECT BY PRIOR p.parent_id = d.id;
---------------------------------------------------------------------------
