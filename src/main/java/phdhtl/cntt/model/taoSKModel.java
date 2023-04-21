package phdhtl.cntt.model;



public class taoSKModel {
	int idsk;
	String tensk;
	String tgbatdau;
	String tgketthuc;
	String diadiem;
	String img;
	String note;
	String qr;
	String nguoitao;
	int soluongnguoithamgia;
	
	
	
	
	
	
	
	
	
	
	public taoSKModel(int idsk, String tensk, String tgbatdau, String tgketthuc, String diadiem, String note,
			String nguoitao, int soluongnguoithamgia) {
		super();
		this.idsk = idsk;
		this.tensk = tensk;
		this.tgbatdau = tgbatdau;
		this.tgketthuc = tgketthuc;
		this.diadiem = diadiem;
		this.note = note;
		this.nguoitao = nguoitao;
		this.soluongnguoithamgia = soluongnguoithamgia;
	}
	public taoSKModel(int idsk, String tensk, String tgbatdau, String tgketthuc, String diadiem,String nguoitao) {
		super();
		this.idsk = idsk;
		this.tensk = tensk;
		this.tgbatdau = tgbatdau;
		this.tgketthuc = tgketthuc;
		this.diadiem = diadiem;
		this.nguoitao = nguoitao;
	}
	
	
	public taoSKModel(int idsk, String tensk, String tgbatdau, String tgketthuc, String diadiem) {
		super();
		this.idsk = idsk;
		this.tensk = tensk;
		this.tgbatdau = tgbatdau;
		this.tgketthuc = tgketthuc;
		this.diadiem = diadiem;
		
	}
	
	
	public taoSKModel(String tensk, String tgbatdau, String tgketthuc, String diadiem,  String note,
			String nguoitao, int soluongnguoithamgia) {
		super();
		this.tensk = tensk;
		this.tgbatdau = tgbatdau;
		this.tgketthuc = tgketthuc;
		this.diadiem = diadiem;
		
		this.note = note;
		this.nguoitao = nguoitao;
		this.soluongnguoithamgia = soluongnguoithamgia;
	}
	public taoSKModel() {
		super();
	}
	public taoSKModel(int idsk, String tensk, String tgbatdau, String tgketthuc, String diadiem, String img,
			String note, String qr, String nguoitao, int soluongnguoithamgia) {
		super();
		this.idsk = idsk;
		this.tensk = tensk;
		this.tgbatdau = tgbatdau;
		this.tgketthuc = tgketthuc;
		this.diadiem = diadiem;
		this.img = img;
		this.note = note;
		this.qr = qr;
		this.nguoitao = nguoitao;
		this.soluongnguoithamgia = soluongnguoithamgia;
	}
	public int getIdsk() {
		return idsk;
	}
	public void setIdsk(int idsk) {
		this.idsk = idsk;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getQr() {
		return qr;
	}
	public void setQr(String qr) {
		this.qr = qr;
	}
	public String getNguoitao() {
		return nguoitao;
	}
	public void setNguoitao(String nguoitao) {
		this.nguoitao = nguoitao;
	}
	public int getSoluongnguoithamgia() {
		return soluongnguoithamgia;
	}
	public void setSoluongnguoithamgia(int soluongnguoithamgia) {
		this.soluongnguoithamgia = soluongnguoithamgia;
	}
	
	
	
	
}
