package xml;

public class WeatherVo {
	private String city;
	private String dateTime;
	private String info;
	private String tmn; // 최저온도
	private String tmx; // 최고온도
	private String rnst; // 비올확률
	
	public WeatherVo() {
	}
	
	public WeatherVo(String city, String dateTime, String info, String tmn, String tmx, String rnst) {
		super();
		this.city = city;
		this.dateTime = dateTime;
		this.info = info;
		this.tmn = tmn;
		this.tmx = tmx;
		this.rnst = rnst;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getTmn() {
		return tmn;
	}

	public void setTmn(String tmn) {
		this.tmn = tmn;
	}

	public String getTmx() {
		return tmx;
	}

	public void setTmx(String tmx) {
		this.tmx = tmx;
	}

	public String getRnst() {
		return rnst;
	}

	public void setRnst(String rnst) {
		this.rnst = rnst;
	}

	@Override
	public String toString() {
		return "WeatherVo [city=" + city + ", dateTime=" + dateTime + ", info=" + info + ", tmn=" + tmn + ", tmx=" + tmx
				+ ", rnst=" + rnst + "]";
	}
}
