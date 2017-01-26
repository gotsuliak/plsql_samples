------------------------------------------------
--1. dog_parent_type
------------------------------------------------
--drop type dog_parent_type
CREATE OR REPLACE TYPE dog_parent_type AS OBJECT
(
        DOG_ID NUMBER 
       ,CHILD_ID NUMBER 
       ,SEX CHAR(1)
)
------------------------------------------------
--2. pedigree_level
------------------------------------------------   
--drop  type pedigree_level
CREATE OR REPLACE TYPE pedigree_level Is Table of dog_parent_type
