package diary;

import java.sql.Date;

public class diaryVo {
	private int num;
	private String writer;
	private Date wdate;
	private String content;
	private String pic1;
	private String pic2;
	private String pic3;
	
	public diaryVo() {
		
	}
	
	public diaryVo(int num, String writer, Date wdate, String content, String pic1, String pic2, String pic3) {
		super();
		this.num = num;
		this.writer = writer;
		this.wdate = wdate;
		this.content = content;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	public String getPic3() {
		return pic3;
	}

	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}

	@Override
	public String toString() {
		return "diaryVo [num=" + num + ", writer=" + writer + ", wdate=" + wdate + ", content=" + content + ", pic1="
				+ pic1 + ", pic2=" + pic2 + ", pic3=" + pic3 + "]";
	}
	
	
	
}
