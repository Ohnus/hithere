package xml;

public class StationVo {
	private String seq; 
	private String stationNm;
	private String direction;
	private String gpsX;
	private String gpsY;
	private String arsId;
	
	public StationVo() {
	}
	
	public StationVo(String seq, String stationNm, String direction, String gpsX, String gpsY, String arsId) {
		super();
		this.seq = seq;
		this.stationNm = stationNm;
		this.direction = direction;
		this.gpsX = gpsX;
		this.gpsY = gpsY;
		this.arsId = arsId;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getStationNm() {
		return stationNm;
	}

	public void setStationNm(String stationNm) {
		this.stationNm = stationNm;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getGpsX() {
		return gpsX;
	}

	public void setGpsX(String gpsX) {
		this.gpsX = gpsX;
	}

	public String getGpsY() {
		return gpsY;
	}

	public void setGpsY(String gpsY) {
		this.gpsY = gpsY;
	}

	public String getArsId() {
		return arsId;
	}

	public void setArsId(String arsId) {
		this.arsId = arsId;
	}

	@Override
	public String toString() {
		return "StationVo [seq=" + seq + ", stationNm=" + stationNm + ", direction=" + direction + ", gpsX="
				+ gpsX + ", gpsY=" + gpsY + ", arsId=" + arsId + "]";
	}
}
