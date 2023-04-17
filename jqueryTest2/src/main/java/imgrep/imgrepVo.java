package imgrep;

public class imgrepVo {
	private int num;
	private int pnum;
	private String writer;
	private String content;
	
	public imgrepVo() {
		
	}
	
	public imgrepVo(int num, int pnum, String writer, String content) {
		super();
		this.num = num;
		this.pnum = pnum;
		this.writer = writer;
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "imgrepVo [num=" + num + ", pnum=" + pnum + ", writer=" + writer + ", content=" + content + "]";
	}
	
	
}
