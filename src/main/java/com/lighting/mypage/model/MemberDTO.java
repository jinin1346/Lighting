package com.lighting.mypage.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {

    private int tblMemberSeq;       // 회원 seq
    private String id;              // 아이디
    private String nickname;        // 닉네임
    private String email;           // 이메일
    private String photoFileName;   // 사진 파일명
}