--Function 1. To calculate the winner candidate in each constitution
--Input, max(count of voters(voter_id), group by candidate_id)
--Output winner: CANDIDATE_ID

CREATE OR REPLACE FUNCTION get_winner(const_num in NUMBER)
RETURN NUMBER
IS winner_candidate NUMBER :=0;
BEGIN
SELECT CANDIDATE_ID 
INTO winner_candidate
FROM ( SELECT votes.CANDIDATE_ID,COUNT(votes.VOTER_ID),position.constituency_id
FROM VOTES
join position
on position.candidate_id= votes.candidate_id
where position.constituency_id=const_num
group by votes.candidate_id, position.constituency_id
order by count(voter_id) desc
fetch first row only);

RETURN winner_candidate;
END get_winner;


--




 


--FUNCTION GIVEN U_ID FROM VOTERS FIND AGE FROM PEOPLE
CREATE OR REPLACE FUNCTION GETAGE_PEOPLE (VOTERU_ID in NUMBER)
RETURN NUMBER
IS AGE_OUT NUMBER:=0;
BEGIN
SELECT  PEOPLE.AGE
INTO AGE_OUT
FROM PEOPLE
JOIN VOTER
ON VOTER.U_ID=PEOPLE.U_ID
WHERE VOTER.U_ID=VOTERU_ID;
RETURN AGE_OUT;
END GETAGE_PEOPLE;

--


--FUNCTON 5: GIVEN TIMESTAMP FROM VOTES FIND IF THE TIMESTAMP IS WITHIN THE POSITION TIME RANGE.

CREATE OR REPLACE FUNCTION TOCHECKVOTE_TIMESTAMP (VOTERU_ID in NUMBER)
RETURN NUMBER
IS VOTETIME TIMESTAMP;
POS_START_TIME TIMESTAMP;
POS_END_TIME TIMESTAMP;
BEGIN
SELECT VOTE_TIME 
INTO VOTETIME
FROM VOTES
WHERE VOTER_ID= VOTERU_ID;

SELECT POS_START
INTO POS_START_TIME
 FROM POSITION
WHERE CANDIDATE_ID=(SELECT CANDIDATE_ID FROM VOTES WHERE VOTER_ID=VOTERU_ID);


SELECT POS_END
INTO POS_END_TIME
 FROM POSITION
WHERE CANDIDATE_ID=(SELECT CANDIDATE_ID FROM VOTES WHERE VOTER_ID=VOTERU_ID);

IF VOTETIME BETWEEN POS_START_TIME AND POS_END_TIME
THEN RETURN 1;
ELSE
RETURN 0;
END IF;
END TOCHECKVOTE_TIMESTAMP;


--


--TO CHECK IF THE VOTER IS VOTING IN THE SAME CONSTITUENCY- RETURNS BOOLEAN 
CREATE OR REPLACE FUNCTION TOCHECKVOTE_CONSTI (VOTERU_ID in NUMBER)
RETURN NUMBER
IS PEOPLEUID NUMBER :=0;
PEOPLECONSTI NUMBER:=0;
POSITIONCONSTI NUMBER :=0;

BEGIN
SELECT U_ID 
INTO PEOPLEUID
FROM VOTER
WHERE VOTER_ID=(SELECT VOTER_ID FROM VOTES WHERE VOTER_ID=VOTERU_ID);

SELECT CONSTITUENCY_ID
INTO PEOPLECONSTI
FROM PEOPLE
WHERE 
U_ID=PEOPLEUID;
SELECT CONSTITUENCY_ID 
INTO POSITIONCONSTI
FROM POSITION
WHERE CANDIDATE_ID=(SELECT CANDIDATE_ID FROM VOTES WHERE VOTER_ID=VOTERU_ID);

IF PEOPLECONSTI = POSITIONCONSTI
THEN RETURN 1;
ELSE
RETURN 0;
END IF;
END TOCHECKVOTE_CONSTI;

--


--TO CHECK IF THE PERSON FROM PEOPLE CAN BE REGISTERED AS A VOTER IN VOTER TABLE
CREATE OR REPLACE FUNCTION TOCHECK_ELIGIBILITY(PU_ID in NUMBER)
RETURN NUMBER
IS  AGEINPUT NUMBER :=0;
BEGIN
SELECT AGE 
INTO AGEINPUT
FROM PEOPLE
WHERE U_ID=PU_ID;

IF AGEINPUT >= 18
THEN RETURN 1;
ELSE
RETURN 0;
END IF;
END TOCHECK_ELIGIBILITY;

--











