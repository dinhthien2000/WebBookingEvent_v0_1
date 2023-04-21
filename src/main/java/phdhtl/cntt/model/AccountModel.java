package phdhtl.cntt.model;

public class AccountModel {
	int iduser;
	String hoten;
	String sdt;
	String email;
	Boolean gioitinh;
	String username;
	
	
	public AccountModel(int iduser, String hoten, String sdt, String email, Boolean gioitinh) {
		super();
		this.iduser = iduser;
		this.hoten = hoten;
		this.sdt = sdt;
		this.email = email;
		this.gioitinh = gioitinh;
	}
	String password;
	
	
	
	
	
	public AccountModel(String hoten, String sdt, String email, Boolean gioitinh, String username, String password) {
		super();
		this.hoten = hoten;
		this.sdt = sdt;
		this.email = email;
		this.gioitinh = gioitinh;
		this.username = username;
		this.password = password;
	}
	public AccountModel() {
		super();
	}
	public AccountModel(String username) {
		super();
		this.username = username;
	}
	public AccountModel(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public AccountModel(int iduser, String hoten, String sdt, String email, Boolean gioitinh, String username,
			String password) {
		super();
		this.iduser = iduser;
		this.hoten = hoten;
		this.sdt = sdt;
		this.email = email;
		this.gioitinh = gioitinh;
		this.username = username;
		this.password = password;
	}
	public int getIduser() {
		return iduser;
	}
	public void setIduser(int iduser) {
		this.iduser = iduser;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Boolean getGioitinh() {
		return gioitinh;
	}
	public void setGioitinh(Boolean gioitinh) {
		this.gioitinh = gioitinh;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
