package com.lighting.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString


public class MainDTO {
    //tblMember
    private String tblMemberSeq;
    //private String photoFileName;
    private String memberPhoto;
    private String nickname;
    
    
    //tblMeetingPost
    private String tblMeetingPostSeq;
    private String title;
    //private String photoFileName;
    private String meetingPhoto;
    private String capacity;
    
    
    //tblCategorySub
    private String tblCategorySubSeq;
    
    
}
