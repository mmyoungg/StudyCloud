package dto;

public class StudyRoom {
	private int sRoom_no;
	private String sRoom_name;
	private String sRoom_addr;
	private String sRoom_photo;
	private int sRoom_price;
	private int sRoom_people;
	private String sRoom_info;
	private String sRoom_role;
	
	public StudyRoom() {}

	public StudyRoom(int sRoom_no, String sRoom_name, String sRoom_addr, String sRoom_photo, int sRoom_price,
			int sRoom_people, String sRoom_info, String sRoom_role) {
		super();
		this.sRoom_no = sRoom_no;
		this.sRoom_name = sRoom_name;
		this.sRoom_addr = sRoom_addr;
		this.sRoom_photo = sRoom_photo;
		this.sRoom_price = sRoom_price;
		this.sRoom_people = sRoom_people;
		this.sRoom_info = sRoom_info;
		this.sRoom_role = sRoom_role;
	}

	@Override
	public String toString() {
		return "StudyRoom [sRoom_no=" + sRoom_no + ", sRoom_name=" + sRoom_name + ", sRoom_addr=" + sRoom_addr
				+ ", sRoom_photo=" + sRoom_photo + ", sRoom_price=" + sRoom_price + ", sRoom_people=" + sRoom_people
				+ ", sRoom_info=" + sRoom_info + ", sRoom_role=" + sRoom_role + "]";
	}

	public int getsRoom_no() {
		return sRoom_no;
	}

	public void setsRoom_no(int sRoom_no) {
		this.sRoom_no = sRoom_no;
	}

	public String getsRoom_name() {
		return sRoom_name;
	}

	public void setsRoom_name(String sRoom_name) {
		this.sRoom_name = sRoom_name;
	}

	public String getsRoom_addr() {
		return sRoom_addr;
	}

	public void setsRoom_addr(String sRoom_addr) {
		this.sRoom_addr = sRoom_addr;
	}

	public String getsRoom_photo() {
		return sRoom_photo;
	}

	public void setsRoom_photo(String sRoom_photo) {
		this.sRoom_photo = sRoom_photo;
	}

	public int getsRoom_price() {
		return sRoom_price;
	}

	public void setsRoom_price(int sRoom_price) {
		this.sRoom_price = sRoom_price;
	}

	public int getsRoom_people() {
		return sRoom_people;
	}

	public void setsRoom_people(int sRoom_people) {
		this.sRoom_people = sRoom_people;
	}

	public String getsRoom_info() {
		return sRoom_info;
	}

	public void setsRoom_info(String sRoom_info) {
		this.sRoom_info = sRoom_info;
	}

	public String getsRoom_role() {
		return sRoom_role;
	}

	public void setsRoom_role(String sRoom_role) {
		this.sRoom_role = sRoom_role;
	}
	
	

	
}
