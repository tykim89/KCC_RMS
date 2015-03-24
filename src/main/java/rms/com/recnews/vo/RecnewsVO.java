package rms.com.recnews.vo;

import java.io.Serializable;
import java.sql.Timestamp;




public class RecnewsVO extends DefaultVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**채용소식번호*/	
	private String rec_news_no;	
	/**채용소식제목*/	
	private String rec_news_title;     
	/**채용소식내용*/	
	private String rec_news_content;   
	/**채용소식작성일*/	
	private Timestamp write_date;
	/**채용소식수정일*/	
	private Timestamp modi_date;   
	/**채용소식작성자*/	
	private String writer;   
	/**채용소식수정자*/	
	private String modifier;
	/**채용소식활용여부*/
	private String enable_tf;
	/**채용소식버전*/
	private int version;          
	/**채용소식조회수*/	
	private int rec_news_hits;    
	/**채용소식허브메인노출여부*/	
	private String hubmain_view_tf;   
	/**채용소식메인노출여부*/	
	private String main_view_tf;     
	/**채용소식프론트노출여부*/	
	private String front_view_tf;
	
	private int num;

	public RecnewsVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getRec_news_no() {
		return rec_news_no;
	}

	public void setRec_news_no(String rec_news_no) {
		this.rec_news_no = rec_news_no;
	}

	public String getRec_news_title() {
		return rec_news_title;
	}

	public void setRec_news_title(String rec_news_title) {
		this.rec_news_title = rec_news_title;
	}

	public String getRec_news_content() {
		return rec_news_content;
	}

	public void setRec_news_content(String rec_news_content) {
		this.rec_news_content = rec_news_content;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public Timestamp getModi_date() {
		return modi_date;
	}

	public void setModi_date(Timestamp modi_date) {
		this.modi_date = modi_date;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public String getEnable_tf() {
		return enable_tf;
	}

	public void setEnable_tf(String enable_tf) {
		this.enable_tf = enable_tf;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public int getRec_news_hits() {
		return rec_news_hits;
	}

	public void setRec_news_hits(int rec_news_hits) {
		this.rec_news_hits = rec_news_hits;
	}

	public String getHubmain_view_tf() {
		return hubmain_view_tf;
	}

	public void setHubmain_view_tf(String hubmain_view_tf) {
		this.hubmain_view_tf = hubmain_view_tf;
	}

	public String getMain_view_tf() {
		return main_view_tf;
	}

	public void setMain_view_tf(String main_view_tf) {
		this.main_view_tf = main_view_tf;
	}

	public String getFront_view_tf() {
		return front_view_tf;
	}

	public void setFront_view_tf(String front_view_tf) {
		this.front_view_tf = front_view_tf;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public RecnewsVO(String rec_news_no, String rec_news_title,
			String rec_news_content, Timestamp write_date, Timestamp modi_date,
			String writer, String modifier, String enable_tf, int version,
			int rec_news_hits, String hubmain_view_tf, String main_view_tf,
			String front_view_tf, int num) {
		super();
		this.rec_news_no = rec_news_no;
		this.rec_news_title = rec_news_title;
		this.rec_news_content = rec_news_content;
		this.write_date = write_date;
		this.modi_date = modi_date;
		this.writer = writer;
		this.modifier = modifier;
		this.enable_tf = enable_tf;
		this.version = version;
		this.rec_news_hits = rec_news_hits;
		this.hubmain_view_tf = hubmain_view_tf;
		this.main_view_tf = main_view_tf;
		this.front_view_tf = front_view_tf;
		this.num = num;
	}

	@Override
	public String toString() {
		return "RecnewsVO [rec_news_no=" + rec_news_no + ", rec_news_title="
				+ rec_news_title + ", rec_news_content=" + rec_news_content
				+ ", write_date=" + write_date + ", modi_date=" + modi_date
				+ ", writer=" + writer + ", modifier=" + modifier
				+ ", enable_tf=" + enable_tf + ", version=" + version
				+ ", rec_news_hits=" + rec_news_hits + ", hubmain_view_tf="
				+ hubmain_view_tf + ", main_view_tf=" + main_view_tf
				+ ", front_view_tf=" + front_view_tf + ", num=" + num + "]";
	}	

	
}
