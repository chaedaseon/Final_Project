/*=====================
	SearchDTO.java
	- 검색 DTO
=====================*/

package com.study.mybatis.model;

public class SearchDTO
{
    private int page;             // 현재 페이지 번호
    private int recordSize;       // 페이지당 출력할 데이터 개수
    private int pageSize;         // 화면 하단에 출력할 페이지 사이즈
    private String searchValue;   // 검색 키워드
    private String searchKey;    // 검색 유형
    private String fbState, reState;

    public SearchDTO()
    {
        this.page = 1;
        this.recordSize = 10;
        this.pageSize = 10;
    }

    public int getOffset() {
        return (page - 1) * recordSize;
    }
    
	public String getFbState()
	{
		return fbState;
	}

	public void setFbState(String fbState)
	{
		this.fbState = fbState;
	}

	public String getReState()
	{
		return reState;
	}

	public void setReState(String reState)
	{
		this.reState = reState;
	}

	public int getPage()
	{
		return page;
	}
	
	public void setPage(int page)
	{
		this.page = page;
	}

	public int getRecordSize()
	{
		return recordSize;
	}

	public void setRecordSize(int recordSize)
	{
		this.recordSize = recordSize;
	}

	public int getPageSize()
	{
		return pageSize;
	}

	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
	}

	public String getSearchValue()
	{
		return searchValue;
	}

	public void setSearchValue(String searchValue)
	{
		this.searchValue = searchValue;
	}

	public String getSearchKey()
	{
		return searchKey;
	}

	public void setSearchKey(String searchKey)
	{
		this.searchKey = searchKey;
	}
    

}
