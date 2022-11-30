package dto;

import java.util.Date;

public class Message {

	private int msNo;
	private int memberNo;
	private int mboardNo;
	private int mntboardNo;
	private String sendId;
	private String recvId;
	private Date sendDate;
	private String msContent;
	
	public Message() {}

	public Message(int msNo, int memberNo, int mboardNo, int mntboardNo, String sendId, String recvId, Date sendDate,
			String msContent) {
		super();
		this.msNo = msNo;
		this.memberNo = memberNo;
		this.mboardNo = mboardNo;
		this.mntboardNo = mntboardNo;
		this.sendId = sendId;
		this.recvId = recvId;
		this.sendDate = sendDate;
		this.msContent = msContent;
	}

	@Override
	public String toString() {
		return "Message [msNo=" + msNo + ", memberNo=" + memberNo + ", mboardNo=" + mboardNo + ", mntboardNo="
				+ mntboardNo + ", sendId=" + sendId + ", recvId=" + recvId + ", sendDate=" + sendDate + ", msContent="
				+ msContent + "]";
	}

	public int getMsNo() {
		return msNo;
	}

	public void setMsNo(int msNo) {
		this.msNo = msNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getMboardNo() {
		return mboardNo;
	}

	public void setMboardNo(int mboardNo) {
		this.mboardNo = mboardNo;
	}

	public int getMntboardNo() {
		return mntboardNo;
	}

	public void setMntboardNo(int mntboardNo) {
		this.mntboardNo = mntboardNo;
	}

	public String getSendId() {
		return sendId;
	}

	public void setSendId(String sendId) {
		this.sendId = sendId;
	}

	public String getRecvId() {
		return recvId;
	}

	public void setRecvId(String recvId) {
		this.recvId = recvId;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getMsContent() {
		return msContent;
	}

	public void setMsContent(String msContent) {
		this.msContent = msContent;
	}
	
	
}
