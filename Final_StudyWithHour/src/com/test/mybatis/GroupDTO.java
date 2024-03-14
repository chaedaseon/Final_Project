/*=====================
	GroupDTO.java
	- 스터디그룹 DTO
=====================*/

package com.test.mybatis;

public class GroupDTO
{
	// 주요 속성 구성
	String gr_code, gr_name, gj_code, gj_date, gu_id, gu_nick, category_code, gu_name, category_list, gender, ld_state;
	int age, rnum, gr_count;
	
	// getter / setter 구성
	public String getGr_code()
	{
		return gr_code;
	}

	public void setGr_code(String gr_code)
	{
		this.gr_code = gr_code;
	}

	public int getGr_count()
	{
		return gr_count;
	}

	public void setGr_count(int gr_count)
	{
		this.gr_count = gr_count;
	}

	public int getRnum()
	{
		return rnum;
	}

	public void setRnum(int rnum)
	{
		this.rnum = rnum;
	}

	public String getLd_state()
	{
		return ld_state;
	}

	public void setLd_state(String ld_state)
	{
		this.ld_state = ld_state;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public int getAge()
	{
		return age;
	}

	public void setAge(int age)
	{
		this.age = age;
	}

	public String getGr_name()
	{
		return gr_name;
	}

	public void setGr_name(String gr_name)
	{
		this.gr_name = gr_name;
	}

	public String getGj_code()
	{
		return gj_code;
	}

	public void setGj_code(String gj_code)
	{
		this.gj_code = gj_code;
	}

	public String getGj_date()
	{
		return gj_date;
	}

	public void setGj_date(String gj_date)
	{
		this.gj_date = gj_date;
	}

	public String getGu_id()
	{
		return gu_id;
	}

	public void setGu_id(String gu_id)
	{
		this.gu_id = gu_id;
	}

	public String getGu_nick()
	{
		return gu_nick;
	}

	public void setGu_nick(String gu_nick)
	{
		this.gu_nick = gu_nick;
	}

	public String getCategory_code()
	{
		return category_code;
	}

	public void setCategory_code(String category_code)
	{
		this.category_code = category_code;
	}

	public String getGu_name()
	{
		return gu_name;
	}

	public void setGu_name(String gu_name)
	{
		this.gu_name = gu_name;
	}

	public String getCategory_list()
	{
		return category_list;
	}

	public void setCategory_list(String category_list)
	{
		this.category_list = category_list;
	}
	
	
}
