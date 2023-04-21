package phdhtl.cntt.model;

public class thamgiaSKModel {
	int iddk;
	String tensk;
	String tgbatdau;
	String tgketthuc;
	String diadiem;	
	String nguoitao;
	String hotendk;
	String masv;
	String sdt;
	String email;
	int soluong;
	
	
	
	
	
	public thamgiaSKModel(String tensk, String tgbatdau, String tgketthuc, String diadiem, String nguoitao, String hotendk,
			String masv, String sdt, String email) {
		super();
		this.tensk = tensk;
		this.tgbatdau = tgbatdau;
		this.tgketthuc = tgketthuc;
		this.diadiem = diadiem;
		this.nguoitao = nguoitao;
		this.hotendk = hotendk;
		this.masv = masv;
		this.sdt = sdt;
		this.email = email;
	}
	public thamgiaSKModel(String tensk, String tgbatdau, String tgketthuc, String nguoitao, String hotendk, String sdt,
			String email, int soluong) {
		super();
		this.tensk = tensk;
		this.tgbatdau = tgbatdau;
		this.tgketthuc = tgketthuc;
		this.nguoitao = nguoitao;
		this.hotendk = hotendk;
		this.sdt = sdt;
		this.email = email;
		this.soluong = soluong;
	}
	public thamgiaSKModel() {
		super();
	}
	public thamgiaSKModel(int iddk, String tensk, String tgbatdau, String tgketthuc, String nguoitao, String hotendk,
			String masv, String sdt, String email, int soluong) {
		super();
		this.iddk = iddk;
		this.tensk = tensk;
		this.tgbatdau = tgbatdau;
		this.tgketthuc = tgketthuc;
		this.nguoitao = nguoitao;
		this.hotendk = hotendk;
		this.masv = masv;
		this.sdt = sdt;
		this.email = email;
		this.soluong = soluong;
	}
	public int getIddk() {
		return iddk;
	}
	public void setIddk(int iddk) {
		this.iddk = iddk;
	}
	public String getTensk() {
		return tensk;
	}
	public void setTensk(String tensk) {
		this.tensk = tensk;
	}
	public String getTgbatdau() {
		return tgbatdau;
	}
	public void setTgbatdau(String tgbatdau) {
		this.tgbatdau = tgbatdau;
	}
	public String getTgketthuc() {
		return tgketthuc;
	}
	public void setTgketthuc(String tgketthuc) {
		this.tgketthuc = tgketthuc;
	}
	
	public String getDiadiem() {
		return diadiem;
	}
	public void setDiadiem(String diadiem) {
		this.diadiem = diadiem;
	}
	
	public String getNguoitao() {
		return nguoitao;
	}
	public void setNguoitao(String nguoitao) {
		this.nguoitao = nguoitao;
	}
	public String getHotendk() {
		return hotendk;
	}
	public void setHotendk(String hotendk) {
		this.hotendk = hotendk;
	}
	public String getMasv() {
		return masv;
	}
	public void setMasv(String masv) {
		this.masv = masv;
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
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	
	
	
	
	
}
