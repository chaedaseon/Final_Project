/*=====================
	IGroupDAO.java
	- 인터페이스
=====================*/

package com.study.mybatis.model;

import java.util.ArrayList;

public interface IGroupDAO
{
	// 메소드 선언
	ArrayList<GroupDTO> memberList(String gr_code);
	int memberCount(String gr_code);
	int addMemberCount(String gr_code);
	int addMember(String gr_code, String period_code);
	
}
