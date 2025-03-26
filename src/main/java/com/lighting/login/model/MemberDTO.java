package com.lighting.login.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class MemberDTO {
    private String tblMemberseq;
    private String id;
    private String pw;
    private String name;
    private String nickname;
    private String birthday;
    private String tel;
    private String email;
    private String gender;
    private String photoFileName;
    private String registrationDate;
    private String status;
}
