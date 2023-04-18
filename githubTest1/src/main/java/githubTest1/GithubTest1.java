package githubTest1;

import java.sql.Date;

// github test1
public class GithubTest1 {
	private int num; 
	private String wirter;
	private String title;
	private String content;
	private Date wdate;
	private String rply;
	
	public GithubTest1() {
	}
	
	public GithubTest1(int num, String wirter, String title, String content, Date wdate, String rply) {
		super();
		this.num = num;
		this.wirter = wirter;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.rply = rply;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWirter() {
		return wirter;
	}

	public void setWirter(String wirter) {
		this.wirter = wirter;
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

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	

	public String getRply() {
		return rply;
	}

	public void setRply(String rply) {
		this.rply = rply;
	}

	@Override
	public String toString() {
		return "GithubTest1 [num=" + num + ", wirter=" + wirter + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + ", rply=" + rply + "]";
	}

}
