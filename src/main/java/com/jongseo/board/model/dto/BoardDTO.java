package com.jongseo.board.model.dto;

import java.sql.Date;

public class BoardDTO {

	private int no;
	private String title;
	private String writer;
	private Date createdDate;
	private int count;
	private String body;
	
	
	
	public BoardDTO() {
		
	}



	public BoardDTO(int no, String title, String writer, Date createdDate, int count, String body) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.createdDate = createdDate;
		this.count = count;
		this.body = body;
	}



	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public Date getCreatedDate() {
		return createdDate;
	}



	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String getBody() {
		return body;
	}



	public void setBody(String body) {
		this.body = body;
	}



	@Override
	public String toString() {
		return "BoardDTO [no=" + no + ", title=" + title + ", writer=" + writer + ", createdDate=" + createdDate
				+ ", count=" + count + ", body=" + body + "]";
	}



	
	
	
	
	
	
	
	
}
