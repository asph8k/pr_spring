package com.spring.pr.user.service;

import org.apache.ibatis.annotations.Param;

import com.spring.pr.command.UserVO;

public interface IUserService {

	// 아이디 중복 확인 
	int idCheck(String userId);
	
	// 회원 가입 
	void join(UserVO user);
	
	// 로그인
	UserVO login(@Param("id") String id, @Param("pw") String pw);
	
	// 회원정보 얻어오기 
	UserVO getInfo(String userId);
	
	// 회원 정보 수정 
	void updateUser(UserVO user);
	
	// 회원 정보 삭제 
	void deleteUser(@Param("id") String id, @Param("pw") String pw);
}
