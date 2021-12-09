/*===========================
      GuestDTO.java
     - dto 또는 vo 활용
============================ */


package com.test;

public class GuestDTO
{
	private String name, title, contents;

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getContents()
	{
		return contents;
	}

	public void setContents(String contents)
	{
		this.contents = contents;
	}
	
	/*
	// 메소드 추가
	public String result()
	{
		String result =  name + title + contents;
				
		return result;
	}
	*/
	
}
