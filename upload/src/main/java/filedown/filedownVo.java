package filedown;

import java.sql.Date;

public class filedownVo {
	private int num;
	private String writer;
	private Date wdate;
	private String title;
	private String content;
	private String fname;
	private int cnt;
	
	public filedownVo() {
		
	}
	
	public filedownVo(int num, String writer, Date wdate, String title, String content, String fname, int cnt) {
		super();
		this.num = num;
		this.writer = writer;
		this.wdate = wdate;
		this.title = title;
		this.content = content;
		this.fname = fname;
		this.cnt = cnt;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "filedownVo [num=" + num + ", writer=" + writer + ", wdate=" + wdate + ", title=" + title + ", content="
				+ content + ", fname=" + fname + ", cnt=" + cnt + "]";
	}
	
	
}
