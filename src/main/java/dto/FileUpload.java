package dto;

public class FileUpload {
	
	private int fileUpload_no;
	private int fBoard_no;
	private int mtBoard_no;
	private int mntBoard_no;
	private int mBoard_no;
	private int sroom_no;
	private int member_no;
	private String fileUpload_ori;
	private String fileUpload_stor;
	
	
	public FileUpload() {}


	public FileUpload(int fileUpload_no, int fBoard_no, int mtBoard_no, int mntBoard_no, int mBoard_no, int sroom_no,
			int member_no, String fileUpload_ori, String fileUpload_stor) {
		super();
		this.fileUpload_no = fileUpload_no;
		this.fBoard_no = fBoard_no;
		this.mtBoard_no = mtBoard_no;
		this.mntBoard_no = mntBoard_no;
		this.mBoard_no = mBoard_no;
		this.sroom_no = sroom_no;
		this.member_no = member_no;
		this.fileUpload_ori = fileUpload_ori;
		this.fileUpload_stor = fileUpload_stor;
	}


	@Override
	public String toString() {
		return "FileUpload [fileUpload_no=" + fileUpload_no + ", fBoard_no=" + fBoard_no + ", mtBoard_no=" + mtBoard_no
				+ ", mntBoard_no=" + mntBoard_no + ", mBoard_no=" + mBoard_no + ", sroom_no=" + sroom_no
				+ ", member_no=" + member_no + ", fileUpload_ori=" + fileUpload_ori + ", fileUpload_stor="
				+ fileUpload_stor + "]";
	}


	public int getFileUpload_no() {
		return fileUpload_no;
	}


	public void setFileUpload_no(int fileUpload_no) {
		this.fileUpload_no = fileUpload_no;
	}


	public int getfBoard_no() {
		return fBoard_no;
	}


	public void setfBoard_no(int fBoard_no) {
		this.fBoard_no = fBoard_no;
	}


	public int getMtBoard_no() {
		return mtBoard_no;
	}


	public void setMtBoard_no(int mtBoard_no) {
		this.mtBoard_no = mtBoard_no;
	}


	public int getMntBoard_no() {
		return mntBoard_no;
	}


	public void setMntBoard_no(int mntBoard_no) {
		this.mntBoard_no = mntBoard_no;
	}


	public int getmBoard_no() {
		return mBoard_no;
	}


	public void setmBoard_no(int mBoard_no) {
		this.mBoard_no = mBoard_no;
	}


	public int getSroom_no() {
		return sroom_no;
	}


	public void setSroom_no(int sroom_no) {
		this.sroom_no = sroom_no;
	}


	public int getMember_no() {
		return member_no;
	}


	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	public String getFileUpload_ori() {
		return fileUpload_ori;
	}


	public void setFileUpload_ori(String fileUpload_ori) {
		this.fileUpload_ori = fileUpload_ori;
	}


	public String getFileUpload_stor() {
		return fileUpload_stor;
	}


	public void setFileUpload_stor(String fileUpload_stor) {
		this.fileUpload_stor = fileUpload_stor;
	}

	
	
}
