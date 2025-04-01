insert into tblMeetingPost values(501, '제목제목', '내용내용', TO_DATE('2025-03-28 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), '어딜까요', 5,
			TO_DATE('2025-03-29 12:00:00', 'YYYY/MM/DD HH24:MI:SS'),
			TO_DATE('2025-03-29 13:00:00','YYYY/MM/DD HH24:MI:SS'),
			'basic스포츠유산소',
			2, 1
			);
			
insert into tblMeetingPost values(502, '제목제목', '내용내용', TO_DATE('2025-03-28 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), '어딜까요', 5,
			TO_DATE('2025-03-29 12:00:00', 'YYYY/MM/DD HH24:MI:SS'),
			TO_DATE('2025-03-29 13:00:00','YYYY/MM/DD HH24:MI:SS'),
			'basic스포츠유산소',
			2, 1
			);
			
insert into tblMeetingPost values(503, '1번회원이 주최한 모임(끝남)', '내용내용', TO_DATE('2025-03-28 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), '어딜까요', 5,
			TO_DATE('2025-03-29 12:00:00', 'YYYY/MM/DD HH24:MI:SS'),
			TO_DATE('2025-03-29 13:00:00','YYYY/MM/DD HH24:MI:SS'),
			'basic스포츠유산소',
			1, 1
			);
			
insert into tblMeetingPost values(504, '1번회원이 주최한 모임(대기중)', '내용내용', TO_DATE('2025-03-28 11:00:00', 'YYYY/MM/DD HH24:MI:SS'), '어딜까요', 5,
			TO_DATE('2025-04-05 12:00:00', 'YYYY/MM/DD HH24:MI:SS'),
			TO_DATE('2025-04-05 13:00:00','YYYY/MM/DD HH24:MI:SS'),
			'basic스포츠유산소',
			1, 1
			);
-- 임의로 4개의 게시글 추가 501, 502, 503은 모임 완료 504(1번 회원이 주최)는 아직 모임 시작안함 >> 신청관리 처리할 것
commit;

insert into tblEvaluation values(1, 1, 2, 2); -- 1번 모임(501 게시글)에 참여한 1번 회원이 2번 회원을 평가
insert into tblEvaluation values(1, 2, 1, 3.5); -- 1번 모임(501 게시글)에 참여한 2번 회원이 1번 회원을 평가 3.5점

insert into tblEvaluation values(2, 1, 2, 3);
insert into tblEvaluation values(2, 2, 1, 5); -- 2번 모임(502 게시글)에 참여한 2번 회원이 1번 회원을 평가 5점
-- 평가 테이블에 1번 회원에 대한 평가가 2개(3.5, 5)가 있음 이를 평균내서 등급으로 나타낼 것!!

-- 3번은 모임이 이루어 졌지만 아직 평가가 없음 >> 평가하기에서 평가할 수 있어야 함

insert into tblMeeting values(1, 501);-- tblMeeting에 insert 되었다 == 501게시글이 모임 시작 시간이 지나 모임이 성사됨
insert into tblMeeting values(2, 502);-- tblMeeting에 insert 되었다 == 502게시글이 모임 시작 시간이 지나 모임이 성사됨
insert into tblMeeting values(3, 503);-- tblMeeting에 insert 되었다 == 503게시글이 모임 시작 시간이 지나 모임이 성사됨

insert into tblParticipationRequest values (1, 501, 1, 'Y');-- 501 게시글에 1번 회원이 신청함 결과 'Y'(=승인)
insert into tblParticipationRequest values (2, 502, 1, 'Y');-- 502 게시글에 1번 회원이 신청함 결과 'Y'(=승인)
insert into tblParticipationRequest values (3, 503, 2, 'Y');-- 503 게시글에 2번 회원이 신청함 결과 'Y'(=승인)
insert into tblParticipationRequest values (4, 504, 2, null);-- 504 게시글에 2번 회원이 신청함 결과 없음 update 해야함!
insert into tblParticipationRequest values (5, 504, 3, null);-- 504 게시글에 3번 회원이 신청함 결과 없음 update 해야함!
insert into tblParticipationRequest values (6, 504, 4, null);-- 504 게시글에 4번 회원이 신청함 결과 없음 update 해야함!
insert into tblParticipationRequest values (7, 504, 5, null);-- 504 게시글에 5번 회원이 신청함 결과 없음 update 해야함!
insert into tblParticipationRequest values (8, 504, 6, null);-- 504 게시글에 6번 회원이 신청함 결과 없음 update 해야함!

select * from tblParticipationRequest;
select * from tblMeeting;
select * from tblMeetingPost order by tblMeetingPostSeq desc;
select * from tblParticipationRequest;

update tblCategoryMain set categoryname = '자기계발' where tblcategorymainseq = 5;
update tblCategoryMain set categoryname = '힐링' where tblcategorymainseq = 6;
select * from tblCategoryMain join tblCategorySub on tblCategorySub.tblCategoryMainSeq = tblCategoryMain.tblCategoryMainSeq;
update tblActivityRegion set tblActivityRegionCoordinateSeq = 1;
commit;

select * from tblMeetingPost where tblMemberseq = 1;