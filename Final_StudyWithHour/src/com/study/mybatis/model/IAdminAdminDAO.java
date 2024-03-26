package com.study.mybatis.model;

import java.util.ArrayList;

public interface IAdminAdminDAO
{

	public ArrayList<AdminDTO> adminList(int vNum);
	public int count();
	
	public int adminInsert(String adPw);
	public int adminState(String adCode);
}
