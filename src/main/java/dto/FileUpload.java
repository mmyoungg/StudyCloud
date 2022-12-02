package dto;

public class FileUpload {
	
	private int fileUploadNo;
	private int fBoardNo;
	private int mtBoardNo;
	private int mntBoardNo;
	private int mBoardNo;
	private int sroomNo;
	private int memberNo;
	private String fileUploadOri;
	private String fileUploadStor;
	
	
	public FileUpload() {}


	public FileUpload(int fileUploadNo, int fBoardNo, int mtBoardNo, int mntBoardNo, int mBoardNo, int sroomNo,
			int memberNo, String fileUploadOri, String fileUploadStor) {
		super();
		this.fileUploadNo = fileUploadNo;
		this.fBoardNo = fBoardNo;
		this.mtBoardNo = mtBoardNo;
		this.mntBoardNo = mntBoardNo;
		this.mBoardNo = mBoardNo;
		this.sroomNo = sroomNo;
		this.memberNo = memberNo;
		this.fileUploadOri = fileUploadOri;
		this.fileUploadStor = fileUploadStor;
	}


	@Override
	public String toString() {
		return "FileUpload [fileUploadNo=" + fileUploadNo + ", fBoardNo=" + fBoardNo + ", mtBoardNo=" + mtBoardNo
				+ ", mntBoardNo=" + mntBoardNo + ", mBoardNo=" + mBoardNo + ", sroomNo=" + sroomNo + ", memberNo="
				+ memberNo + ", fileUploadOri=" + fileUploadOri + ", fileUploadStor=" + fileUploadStor + "]";
	}


	public int getFileUploadNo() {
		return fileUploadNo;
	}


	public void setFileUploadNo(int fileUploadNo) {
		this.fileUploadNo = fileUploadNo;
	}


	public int getfBoardNo() {
		return fBoardNo;
	}


	public void setfBoardNo(int fBoardNo) {
		this.fBoardNo = fBoardNo;
	}


	public int getMtBoardNo() {
		return mtBoardNo;
	}


	public void setMtBoardNo(int mtBoardNo) {
		this.mtBoardNo = mtBoardNo;
	}


	public int getMntBoardNo() {
		return mntBoardNo;
	}


	public void setMntBoardNo(int mntBoardNo) {
		this.mntBoardNo = mntBoardNo;
	}


	public int getmBoardNo() {
		return mBoardNo;
	}


	public void setmBoardNo(int mBoardNo) {
		this.mBoardNo = mBoardNo;
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


	public String getFileUploadOri() {
		return fileUploadOri;
	}


	public void setFileUploadOri(String fileUploadOri) {
		this.fileUploadOri = fileUploadOri;
	}


	public String getFileUploadStor() {
		return fileUploadStor;
	}


	public void setFileUploadStor(String fileUploadStor) {
		this.fileUploadStor = fileUploadStor;
	}

	
	
	
	
}
