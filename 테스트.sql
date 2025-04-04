select * from tblFriendList where mainmemberseq = 1;

select * from tblBlockList where blockermemberseq = 1;

insert into tblfriendlist values (1, 2, '2025-03-26');
insert into tblfriendlist values (1, 3, '2025-03-26');
insert into tblfriendlist values (1, 4, '2025-03-26');
insert into tblfriendlist values (1, 5, '2025-03-26');
insert into tblfriendlist values (1, 6, '2025-03-26');

SELECT DISTINCT m.tblMeetingPostSeq, m.title, m.location, m.capacity,
                         TO_CHAR(m.startTime, 'YYYY\"년 \"FMMM\"월 \"FMDD\"일\"') AS startTime
                            FROM tblMeetingPost m JOIN tblParticipationRequest pr
                                ON m.tblMeetingPostSeq = pr.tblMeetingPostSeq
                                    WHERE m.tblMemberSeq = 1;

select * from tblMember where tblmemberseq = 1;

CREATE TABLE tblRejectionReason (
	tblRejectionReasonSeq NUMBER NOT NULL, /* 거절사유seq */
	tblParticipationRequestSeq NUMBER NOT NULL, /* 참여신청seq */
	reason VARCHAR2(500) NOT NULL /* 거절사유 */
);

insert into tblRejectionReason values (1, 3, '오줌마려워서 불참');

select * from tblParticipationRequest;

select * from tblRejectionReason;


insert into tblFriendList values (1, 2, '2025-03-25');
commit;

SELECT * FROM tblEvaluation;

select * from tblActivityRegionCoordinate;

SELECT * 
FROM tblEvaluation;
commit;

delete from tblEvaluation where tblmeetingseq = 3;
SELECT *
FROM tblMember mb 
JOIN tblActivityRegion ar 
  ON mb.tblMemberSeq = ar.tblMemberSeq;

SELECT * FROM tblMember WHERE tblMemberSeq = 1;
select * from tblActivityRegion;


select * from tblMeeting;


select * from tblAttendance;


CREATE TABLE tblAttendance (
    tblMeetingSeq NUMBER NOT NULL, /* 모임seq */
    tblMemberSeq NUMBER NOT NULL,  /* 회원seq */
    PRIMARY KEY (tblMeetingSeq, tblMemberSeq), -- 복합 기본키
    
    CONSTRAINT FK_tblMeeting_TO_tblAttendance
        FOREIGN KEY (tblMeetingSeq)
        REFERENCES tblMeeting (tblMeetingSeq),
        
    CONSTRAINT FK_tblMember_TO_tblAttendance
        FOREIGN KEY (tblMemberSeq)
        REFERENCES tblMember (tblMemberSeq)
);

ALTER TABLE tblFriendRequest
	ADD
		CONSTRAINT FK_tblMember_TO_tblFriendRequest
		FOREIGN KEY (
			requestingMemberSeq
		)
		REFERENCES tblMember (
			tblMemberSeq
		);

select * from tblRejectionReason;

/* 거절사유 */
CREATE TABLE tblRejectionReason (
	tblRejectionReasonSeq NUMBER NOT NULL, /* 거절사유seq */
	tblParticipationRequestSeq NUMBER NOT NULL, /* 참여신청seq */
	reason VARCHAR2(500) NOT NULL /* 거절사유 */
);

CREATE TABLE tblParticipationRequest (
	tblParticipationRequestSeq NUMBER NOT NULL, /* 참여신청seq */
	tblMeetingPostSeq NUMBER NOT NULL, /* 모임게시글seq */
	tblMemberSeq NUMBER NOT NULL, /* 회원seq */
	approvalStatus VARCHAR2(1) /* 승인여부 */
);

insert into tblrejectionreason values (1,;

select * from tblParticipationRequest;


select * from tblEvaluation;
commit;
delete from tblEvaluation where tblmeetingseq = 3;

commit;
select * from tblmember where nickname = '상냥한별64';






SELECT * FROM tblMeeting WHERE tblMeetingSeq = 1;
SELECT * FROM tblMember WHERE tblMemberSeq = 2;
        
insert into tblAttendance values (1, 2);
insert into tblAttendance values (1, 3);
insert into tblAttendance values (1, 4);
insert into tblAttendance values (1, 5);

insert into tblAttendance values (3, 4);
insert into tblAttendance values (3, 5);
insert into tblAttendance values (3, 6);
insert into tblAttendance values (3, 7);

select * from tblAttendance;

SELECT * FROM tblMeeting WHERE tblMeetingPostSeq = 501;
SELECT * FROM tblParticipationRequest WHERE tblMeetingPostSeq = 501 AND approvalStatus = 'y';

SELECT tblMeetingSeq FROM tblMeeting m JOIN tblMeetingPost p ON m.tblMeetingPostSeq = p.tblMeetingPostSeq WHERE p.tblMemberSeq = 1;
SELECT * FROM tblMeeting WHERE tblMeetingSeq = 501;

-- 모임 게시글
INSERT INTO tblMeetingPost (tblMeetingPostSeq, title, content, postDate, location, capacity, startTime, endTime, photoFileName, tblMemberSeq, tblCategorySubSeq)
VALUES (501, '강남 스터디', '내용', SYSDATE, '강남역', 5, SYSDATE, SYSDATE + 1/24, 'sample.png', 1, 51);

commit;

-- tblMeeting
INSERT INTO tblMeeting (tblMeetingSeq, tblMeetingPostSeq)
VALUES (3, 501);  -- tblMeetingSeq = 3

-- 승인된 참여자
INSERT INTO tblParticipationRequest (tblParticipationRequestSeq, tblMeetingPostSeq, tblMemberSeq, approvalStatus)
VALUES (1001, 501, 2, 'y');

SELECT * FROM tblMeeting;

select * from tblMeetingPost where tblmemberseq = 1;
SELECT m.tblMeetingSeq, p.tblMeetingPostSeq, p.tblMemberSeq
FROM tblMeeting m
JOIN tblMeetingPost p ON m.tblMeetingPostSeq = p.tblMeetingPostSeq
WHERE p.tblMemberSeq = 1
ORDER BY p.postDate DESC;

SELECT m.tblMeetingSeq, p.tblMeetingPostSeq, r.tblMemberSeq
FROM tblMeeting m
JOIN tblMeetingPost p ON m.tblMeetingPostSeq = p.tblMeetingPostSeq
JOIN tblParticipationRequest r ON p.tblMeetingPostSeq = r.tblMeetingPostSeq
WHERE p.tblMemberSeq = 1
AND LOWER(r.approvalStatus) = 'y';

SELECT m.*
FROM tblParticipationRequest r
JOIN tblMember m ON r.tblMemberSeq = m.tblMemberSeq
WHERE r.approvalStatus = 'y'
  AND r.tblMeetingPostSeq = (
    SELECT tblMeetingPostSeq
    FROM tblMeeting
    WHERE tblMeetingSeq = 1
);
SELECT * FROM tblParticipationRequest;
SELECT * FROM tblMember WHERE tblMemberSeq = 2;
commit;
insert into tblEvaluation values (1, 1, 45, 5);
insert into tblEvaluation values (1, 1, 78, 2);
insert into tblEvaluation values (1, 1, 89, 3);
insert into tblEvaluation values (1, 1, 230, 1);

INSERT INTO tblParticipationRequest 
(tblParticipationRequestSeq, tblMeetingPostSeq, tblMemberSeq, approvalStatus) 
VALUES (1002, 504, 3, 'y');
INSERT INTO tblParticipationRequest VALUES (1007, 503, 4, 'y');
INSERT INTO tblParticipationRequest VALUES (1008, 503, 5, 'y');

SELECT m.* FROM tblParticipationRequest r
            JOIN tblMember m ON r.tblMemberSeq = m.tblMemberSeq
            JOIN tblMeeting t ON r.tblMeetingPostSeq = t.tblMeetingPostSeq
            WHERE r.approvalStatus = 'y' AND t.tblMeetingSeq = 1;

SELECT * FROM tblParticipationRequest WHERE tblMeetingPostSeq = 504 AND approvalStatus = 'y';

SELECT COUNT(*) FROM tblParticipationRequest 
WHERE tblMeetingPostSeq = 504 AND approvalStatus = 'y';

commit;
SELECT NVL(AVG(score), 0) AS avgScore FROM tblEvaluation WHERE evaluatedMemberSeq = 1;

select Evaluatormemberseq, score from tblEvaluation;

SELECT * FROM tblBlockList WHERE blockerMemberSeq = 1;

SELECT b.blockedMemberSeq, m.nickname
                         FROM tblBlockList b 
                         JOIN tblMember m ON b.blockedMemberSeq = m.tblMemberSeq
                         WHERE b.blockerMemberSeq = 1;

SELECT * FROM tblMeeting WHERE tblMeetingSeq =3;

SELECT *
FROM tblParticipationRequest
WHERE tblMeetingPostSeq = (
    SELECT tblMeetingPostSeq
    FROM tblMeeting
    WHERE tblMeetingSeq = (SELECT MAX(tblMeetingSeq) FROM tblMeeting)
)
AND approvalStatus = 'y';

SELECT mainMemberSeq, f.subMemberSeq, m.nickname
                         FROM tblFriendList f
                         JOIN tblMember m ON f.subMemberSeq = m.tblMemberSeq
                         WHERE f.mainMemberSeq = 1;
commit;
//내가 참여한 모임보기(joined)
SELECT tblMeetingPostSeq, title, location, capacity,
                            TO_CHAR(startTime, 'YYYY\"년 \"FMMM\"월 \"FMDD\"일\"') AS startTime
                                FROM tblMeetingPost WHERE tblMemberSeq = 1;


//내가 작성한 글 보기(written)
SELECT tblMeetingPostSeq, title, location, capacity,
                         TO_CHAR(postDate, 'YYYY\"년 \"MM\"월 \"DD\"일\"') AS postDate
                            FROM tblMeetingPost WHERE tblMemberSeq = 1;

//내가 찜한 모임 보기 (wish)
SELECT m.tblMeetingPostSeq, m.title, m.location, m.capacity,
                         TO_CHAR(m.startTime, 'YYYY\"년 \"FMMM\"월 \"FMDD\"일\"') AS startTime
                            FROM tblMeetingPost m JOIN tblWishlist w
                                ON m.tblMeetingPostSeq = w.tblMeetingPostSeq
                                    WHERE w.tblMemberSeq = 1;

//내가 신청한 모임 보기(requesting)
SELECT m.tblMeetingPostSeq, m.title, m.location, m.capacity,
                         TO_CHAR(m.startTime, 'YYYY\"년 \"FMMM\"월 \"FMDD\"일\"') AS startTime
                            FROM tblMeetingPost m JOIN tblParticipationRequest pr
                                ON m.tblMeetingPostSeq = pr.tblMeetingPostSeq 
                                    WHERE pr.tblMemberSeq = 1;
                         

//내가 만든 모임 신청 보기(requested)
SELECT DISTINCT m.tblMeetingPostSeq, m.title, m.location, m.capacity,
                         TO_CHAR(m.startTime, 'YYYY\"년 \"FMMM\"월 \"FMDD\"일\"') AS startTime
                            FROM tblMeetingPost m JOIN tblParticipationRequest pr
                                ON m.tblMeetingPostSeq = pr.tblMeetingPostSeq
                                    WHERE m.tblMemberSeq = 1;

commit;
