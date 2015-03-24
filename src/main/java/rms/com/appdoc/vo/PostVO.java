package rms.com.appdoc.vo;

public class PostVO {
	
	   private String addrall;//실제 사용하는 변수
	   
	   private String zipcode;
	   private String sido;
	   private String gugun;
	   private String dong;
	   private String ri;
	   private String bldg;
	   private String bunji;
	   private String seq;
	   
	public PostVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getAddrall() {
		return addrall;
	}

	public void setAddrall(String addrall) {
		this.addrall = addrall;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getRi() {
		return ri;
	}

	public void setRi(String ri) {
		this.ri = ri;
	}

	public String getBldg() {
		return bldg;
	}

	public void setBldg(String bldg) {
		this.bldg = bldg;
	}

	public String getBunji() {
		return bunji;
	}

	public void setBunji(String bunji) {
		this.bunji = bunji;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public PostVO(String addrall, String zipcode, String sido, String gugun,
			String dong, String ri, String bldg, String bunji, String seq) {
		super();
		this.addrall = addrall;
		this.zipcode = zipcode;
		this.sido = sido;
		this.gugun = gugun;
		this.dong = dong;
		this.ri = ri;
		this.bldg = bldg;
		this.bunji = bunji;
		this.seq = seq;
	}

	@Override
	public String toString() {
		return "PostVO [addrall=" + addrall + ", zipcode=" + zipcode
				+ ", sido=" + sido + ", gugun=" + gugun + ", dong=" + dong
				+ ", ri=" + ri + ", bldg=" + bldg + ", bunji=" + bunji
				+ ", seq=" + seq + "]";
	}
	
	 
}
