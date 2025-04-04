INSERT INTO tblMeetingPost 
  (tblMeetingPostSeq, title, content, postDate, location, capacity, startTime, endTime, photoFileName, tblMemberSeq, tblCategorySubSeq)
VALUES 
  (501, '테스트 모임', '모임 내용입니다.', SYSDATE, '강남역', 5, SYSDATE, SYSDATE + 1/24, 'meeting.jpg', 2, 1);

select * from tblMeetingPost where tblMeetingPostSeq = 501;

delete from tblMeetingPost where tblMeetingPostSeq = 501;
-- 신청 건 101: 회원 1, 승인 여부 'n'
INSERT INTO tblParticipationRequest 
  (tblParticipationRequestSeq, tblMeetingPostSeq, tblMemberSeq, approvalStatus)
VALUES 
  (101, 501, 1, 'n');

-- 신청 건 102: 회원 1, 승인 여부 'n' (거절 사유 없음)
INSERT INTO tblParticipationRequest 
  (tblParticipationRequestSeq, tblMeetingPostSeq, tblMemberSeq, approvalStatus)
VALUES 
  (102, 501, 1, 'n');

-- 신청 건 103: 회원 1, 승인 여부 'y'
INSERT INTO tblParticipationRequest 
  (tblParticipationRequestSeq, tblMeetingPostSeq, tblMemberSeq, approvalStatus)
VALUES 
  (103, 501, 1, 'y');
  
  
  CREATE TABLE tblRejectionReason (
	tblRejectionReasonSeq NUMBER NOT NULL, /* 거절사유seq */
	tblParticipationRequestSeq NUMBER NOT NULL, /* 참여신청seq */
	reason VARCHAR2(500) NOT NULL /* 거절사유 */
);
  SELECT m.nickname, p.title, r.reason 
             FROM tblRejectionReason r 
             JOIN tblParticipationRequest pr ON r.tblParticipationRequestSeq = pr.tblParticipationRequestSeq
             JOIN tblMember m ON pr.tblMemberSeq = m.tblMemberSeq
             JOIN tblMeetingPost p ON pr.tblMeetingPostSeq = p.tblMeetingPostSeq
             WHERE r.tblParticipationRequestSeq = 3;
             
SELECT * FROM tblRejectionReason;



commit;
-- 신청 건 101에 대한 거절 사유 입력 (tblParticipationRequestSeq = 101)
INSERT INTO tblRejectionReason 
  (tblRejectionReasonSeq, tblParticipationRequestSeq, reason)
VALUES 
  (2, 3, '오줌 마려워서 불참');
  
  commit;
  rollback; 
select * from tblRejectionReason;
delete from tblRejectionReason;
