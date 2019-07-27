-- =============================================
-- Author:     Akberet
-- Create date: 07/23/2019
-- Description: New table creation, relating with help table & member table
--              & counting total likes up to date
-- =============================================

   --Add primary key to help table
ALTER TABLE  help
    ADD CONSTRAINT help_pkey PRIMARY KEY (id);

   --Add primary key to member table
ALTER TABLE member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);

      -- Create new table to count Likes
create table Like_Traker
(
    Id int not null primary key,
    member_id bigint foreign key references member(id),
    help_id bigint foreign key references help(id),
	date_created date ,
	);



       -- Counting total likes
select count(Id) as 'Total Likes' from Like_Traker ;




