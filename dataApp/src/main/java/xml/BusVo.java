package xml;

public class BusVo {
	private String busRouteId;
	private String busRouteNm;
	private String corpNm;
	private String edStationNm;
	private String stStationNm;
	private String firstBusTm;
	private String lastBusTm;
	private String term;
	
	public BusVo() {
	}
	
	public BusVo(String busRouteId, String busRouteNm, String corpNm, String edStationNm, String stStationNm,
			String firstBusTm, String lastBusTm, String term) {
		super();
		this.busRouteId = busRouteId;
		this.busRouteNm = busRouteNm;
		this.corpNm = corpNm;
		this.edStationNm = edStationNm;
		this.stStationNm = stStationNm;
		this.firstBusTm = firstBusTm;
		this.lastBusTm = lastBusTm;
		this.term = term;
	}

	public String getBusRouteId() {
		return busRouteId;
	}

	public void setBusRouteId(String busRouteId) {
		this.busRouteId = busRouteId;
	}

	public String getBusRouteNm() {
		return busRouteNm;
	}

	public void setBusRouteNm(String busRouteNm) {
		this.busRouteNm = busRouteNm;
	}

	public String getCorpNm() {
		return corpNm;
	}

	public void setCorpNm(String corpNm) {
		this.corpNm = corpNm;
	}

	public String getEdStationNm() {
		return edStationNm;
	}

	public void setEdStationNm(String edStationNm) {
		this.edStationNm = edStationNm;
	}

	public String getStStationNm() {
		return stStationNm;
	}

	public void setStStationNm(String stStationNm) {
		this.stStationNm = stStationNm;
	}

	public String getFirstBusTm() {
		return firstBusTm;
	}

	public void setFirstBusTm(String firstBusTm) {
		this.firstBusTm = firstBusTm;
	}

	public String getLastBusTm() {
		return lastBusTm;
	}

	public void setLastBusTm(String lastBusTm) {
		this.lastBusTm = lastBusTm;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	@Override
	public String toString() {
		return "BusVo [busRouteId=" + busRouteId + ", busRouteNm=" + busRouteNm + ", corpNm=" + corpNm
				+ ", edStationNm=" + edStationNm + ", stStationNm=" + stStationNm + ", firstBusTm=" + firstBusTm
				+ ", lastBusTm=" + lastBusTm + ", term=" + term + "]";
	}
	
}
