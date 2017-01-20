 -- drop table parents 
----------------------------
-- Create table parents
------------------------
CREATE TABLE parents(
      -- id NUMBER,
       child_id NUMBER,
       parent_id NUMBER,
       CONSTRAINT parents_pk PRIMARY KEY (child_id, parent_id)
)
----------------------------
ALTER TABLE parents ADD CONSTRAINT child_fk
      FOREIGN KEY(child_id)
      REFERENCES dogs(id);
ALTER TABLE parents ADD CONSTRAINT parent_fk
      FOREIGN KEY(parent_id)
      REFERENCES dogs(id);  
----------------------------

