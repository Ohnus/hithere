package json;

public class FoodVo {
	private String label;
	private String price;
	private String area;
	private String routeName;
	private String direction;

	public FoodVo() {
	}

	public FoodVo(String label, String price, String area, String routeName, String direction) {
		super();
		this.label = label;
		this.price = price;
		this.area = area;
		this.routeName = routeName;
		this.direction = direction;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getRouteName() {
		return routeName;
	}

	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	@Override
	public String toString() {
		return "FoodVo [label=" + label + ", price=" + price + ", area=" + area + ", routeName=" + routeName
				+ ", direction=" + direction + "]";
	}

}
