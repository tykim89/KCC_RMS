package rms.com.cmn.vo;

public class MenuVO {
	private String menu_id;
	private String parent_menu_id;
	private String login_yn;
	private String menu_name;
	private String parent_menu_name;
	private String menu_img_url;
	private String url;
	private String sort_seq;
	private String menu_description;
	private String depth;
	private String enable_tf;
	private String writer;
	private String write_date;
	private String modifier;
	private String modify_date;
	private String version;
	private String jsonString;

	/**
	 * @return the parent_menu_name
	 */
	public String getParent_menu_name() {
		return parent_menu_name;
	}

	/**
	 * @param parent_menu_name
	 *            the parent_menu_name to set
	 */
	public void setParent_menu_name(String parent_menu_name) {
		this.parent_menu_name = parent_menu_name;
	}

	/**
	 * @return the jsonString
	 */
	public String getJsonString() {
		return jsonString;
	}

	/**
	 * @param jsonString
	 *            the jsonString to set
	 */
	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}

	/** 메뉴ID */
	public String getMenu_id() {
		return menu_id;
	}

	/** 메뉴ID */
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	/** 상위메뉴ID */
	public String getParent_menu_id() {
		return parent_menu_id;
	}

	/** 상위메뉴ID */
	public void setParent_menu_id(String parent_menu_id) {
		this.parent_menu_id = parent_menu_id;
	}

	/** 로그인필수여부 */
	public String getLogin_yn() {
		return login_yn;
	}

	/** 로그인필수여부 */
	public void setLogin_yn(String login_yn) {
		this.login_yn = login_yn;
	}

	/** 메뉴명 */
	public String getMenu_name() {
		return menu_name;
	}

	/** 메뉴명 */
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	/** 메뉴이미지URL */
	public String getMenu_img_url() {
		return menu_img_url;
	}

	/** 메뉴이미지URL */
	public void setMenu_img_url(String menu_img_url) {
		this.menu_img_url = menu_img_url;
	}

	/** 메뉴URL */
	public String getUrl() {
		return url;
	}

	/** 메뉴URL */
	public void setUrl(String url) {
		this.url = url;
	}

	public String getSort_seq() {
		return sort_seq;
	}

	public void setSort_seq(String sort_seq) {
		this.sort_seq = sort_seq;
	}

	/** 메뉴설명 */
	public String getMenu_description() {
		return menu_description;
	}

	/** 메뉴설명 */
	public void setMenu_description(String menu_description) {
		this.menu_description = menu_description;
	}

	/** 메뉴Depth */
	public String getDepth() {
		return depth;
	}

	/** 메뉴Depth */
	public void setDepth(String depth) {
		this.depth = depth;
	}

	public String getEnable_tf() {
		return enable_tf;
	}

	public void setEnable_tf(String enable_tf) {
		this.enable_tf = enable_tf;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}
}
