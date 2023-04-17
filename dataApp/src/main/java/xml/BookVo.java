package xml;

public class BookVo {
	private int num;
	private String title;
	private String author;
	private int price;
	
	public BookVo() {
	}
	
	public BookVo(int num, String title, String author, int price) {
		super();
		this.num = num;
		this.title = title;
		this.author = author;
		this.price = price;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BookVo [num=" + num + ", title=" + title + ", author=" + author + ", price=" + price + "]";
	}
	

}
