/*=====================
	IGroupDAO.java
	- 인터페이스
=====================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IGroupDAO
{
	// 메소드 선언
	ArrayList<GroupDTO> memberList(String gr_code);
	int memberCount(String gr_code);
	
}
