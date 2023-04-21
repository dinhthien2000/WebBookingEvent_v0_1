package phdhtl.cntt.model;

public class diadiemModel {
	int iddd;
	String tenp;
	String img;
	
	
	
	
	
	
	
	
	public diadiemModel(int iddd) {
		super();
		this.iddd = iddd;
	}
	public diadiemModel(String tenp, String img) {
		super();
		this.tenp = tenp;
		this.img = img;
	}
	public diadiemModel() {
		super();
	}
	public diadiemModel(int iddd, String tenp, String img) {
		super();
		this.iddd = iddd;
		this.tenp = tenp;
		this.img = img;
	}
	public int getIddd() {
		return iddd;
	}
	public void setIddd(int iddd) {
		this.iddd = iddd;
	}
	public String getTenp() {
		return tenp;
	}
	public void setTenp(String tenp) {
		this.tenp = tenp;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	
}
