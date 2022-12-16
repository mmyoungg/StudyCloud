package dto;

import java.util.Date;

public class Reservation {
	
	private int reserveNo;
	private int sroomNo;
	private int memberNo;
	private String reserveDate;
	private String reserveStime;
	private String reserveEtime;
	private int reservePeople;
	private int reservePrice;
	private String reserveReq;
	private Date reservePaydate;
	private String sroomName;
	
	public Reservation() {}

	public Reservation(int reserveNo, int sroomNo, int memberNo, String reserveDate, String reserveStime,
			String reserveEtime, int reservePeople, int reservePrice, String reserveReq, Date reservePaydate) {
		super();
		this.reserveNo = reserveNo;
		this.sroomNo = sroomNo;
		this.memberNo = memberNo;
		this.reserveDate = reserveDate;
		this.reserveStime = reserveStime;
		this.reserveEtime = reserveEtime;
		this.reservePeople = reservePeople;
		this.reservePrice = reservePrice;
		this.reserveReq = reserveReq;
		this.reservePaydate = reservePaydate;
	}


	public Reservation(int reserveNo, int sroomNo, int memberNo, String reserveDate, String reserveStime,
			String reserveEtime, int reservePeople, int reservePrice, String reserveReq, Date reservePaydate,
			String sroomName) {
		super();
		this.reserveNo = reserveNo;
		this.sroomNo = sroomNo;
		this.memberNo = memberNo;
		this.reserveDate = reserveDate;
		this.reserveStime = reserveStime;
		this.reserveEtime = reserveEtime;
		this.reservePeople = reservePeople;
		this.reservePrice = reservePrice;
		this.reserveReq = reserveReq;
		this.reservePaydate = reservePaydate;
		this.sroomName = sroomName;
	}

	@Override
	public String toString() {
		return "Reservation [reserveNo=" + reserveNo + ", sroomNo=" + sroomNo + ", memberNo=" + memberNo
				+ ", reserveDate=" + reserveDate + ", reserveStime=" + reserveStime + ", reserveEtime=" + reserveEtime
				+ ", reservePeople=" + reservePeople + ", reservePrice=" + reservePrice + ", reserveReq=" + reserveReq
				+ ", reservePaydate=" + reservePaydate + ", sroomName=" + sroomName + "]";
	}

	public String getSroomName() {
		return sroomName;
	}

	public void setSroomName(String sroomName) {
		this.sroomName = sroomName;
	}


	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public int getSroomNo() {
		return sroomNo;
	}

	public void setSroomNo(int sroomNo) {
		this.sroomNo = sroomNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getReserveStime() {
		return reserveStime;
	}

	public void setReserveStime(String reserveStime) {
		this.reserveStime = reserveStime;
	}

	public String getReserveEtime() {
		return reserveEtime;
	}

	public void setReserveEtime(String reserveEtime) {
		this.reserveEtime = reserveEtime;
	}

	public int getReservePeople() {
		return reservePeople;
	}

	public void setReservePeople(int reservePeople) {
		this.reservePeople = reservePeople;
	}

	public int getReservePrice() {
		return reservePrice;
	}

	public void setReservePrice(int reservePrice) {
		this.reservePrice = reservePrice;
	}

	public String getReserveReq() {
		return reserveReq;
	}

	public void setReserveReq(String reserveReq) {
		this.reserveReq = reserveReq;
	}

	public Date getReservePaydate() {
		return reservePaydate;
	}

	public void setReservePaydate(Date reservePaydate) {
		this.reservePaydate = reservePaydate;
	}
	

}
