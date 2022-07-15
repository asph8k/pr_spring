package com.spring.pr.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	
	//	CREATE TABLE pruser(
	//    u_UserId VARCHAR2(30) primary key, 
	//    u_UserPw VARCHAR2(30) not null,
	//    u_UserName VARCHAR2(30) not null, 
	//    
	//    u_UserTel VARCHAR2(50),
	//    u_UserEmail VARCHAR2(50), 
	//    u_UserAddr VARCHAR2(100)
	//    
	//);
	
	private String userId;
	private String userPw;
	private String userName;
	
	private String userTel1;
	private String userTel2;
	private String userTel3;
	
	private String userEmail1;
	private String userEmail2;
	
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	
	private String totalUserTel;
	private String totalUserEmail;
	private String totalUserAddr;

}
