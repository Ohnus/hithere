package filedown;

import java.sql.Date;

public class FileDownVo {
	private int num;
	private String writer;
	private Date w_date;
	private String title;
	private String content;
	private String fname;
	private int cnt;

	public FileDownVo() {
	}

	public FileDownVo(int num, String writer, Date w_date, String title, String content, String fname, int cnt) {
		this.num = num;
		this.writer = writer;
		this.w_date = w_date;
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

	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
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
		return "FileDownVo [num=" + num + ", writer=" + writer + ", w_date=" + w_date + ", title=" + title
				+ ", content=" + content + ", fname=" + fname + ", cnt=" + cnt + "]";
	}

}
