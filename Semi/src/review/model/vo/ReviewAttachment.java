package review.model.vo;

import java.sql.Date;

public class ReviewAttachment {
	private int r_file_no;
	private String r_file_path;
	private String r_origin_name;
	private String r_change_name;
	private Date r_upload_date;
	private String r_status;
	private int r_no;
	private int g_no;
	private int m_no;
	private String m_name;
	
	public ReviewAttachment() {}

	public ReviewAttachment(int r_file_no, String r_file_path, String r_origin_name, String r_change_name,
			Date r_upload_date, String r_status, int r_no) {
		super();
		this.r_file_no = r_file_no;
		this.r_file_path = r_file_path;
		this.r_origin_name = r_origin_name;
		this.r_change_name = r_change_name;
		this.r_upload_date = r_upload_date;
		this.r_status = r_status;
		this.r_no = r_no;
	}

	public ReviewAttachment(int r_file_no, String r_file_path, String r_origin_name, String r_change_name,
			Date r_upload_date, String r_status, int r_no, int g_no, int m_no, String m_name) {
		super();
		this.r_file_no = r_file_no;
		this.r_file_path = r_file_path;
		this.r_origin_name = r_origin_name;
		this.r_change_name = r_change_name;
		this.r_upload_date = r_upload_date;
		this.r_status = r_status;
		this.r_no = r_no;
		this.g_no = g_no;
		this.m_no = m_no;
		this.m_name = m_name;
	}

	public int getR_file_no() {
		return r_file_no;
	}

	public void setR_file_no(int r_file_no) {
		this.r_file_no = r_file_no;
	}

	public String getR_file_path() {
		return r_file_path;
	}

	public void setR_file_path(String r_file_path) {
		this.r_file_path = r_file_path;
	}

	public String getR_origin_name() {
		return r_origin_name;
	}

	public void setR_origin_name(String r_origin_name) {
		this.r_origin_name = r_origin_name;
	}

	public String getR_change_name() {
		return r_change_name;
	}

	public void setR_change_name(String r_change_name) {
		this.r_change_name = r_change_name;
	}

	public Date getR_upload_date() {
		return r_upload_date;
	}

	public void setR_upload_date(Date r_upload_date) {
		this.r_upload_date = r_upload_date;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	
	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	@Override
	public String toString() {
		return "ReviewAttachment [r_file_no=" + r_file_no + ", r_file_path=" + r_file_path + ", r_origin_name="
				+ r_origin_name + ", r_change_name=" + r_change_name + ", r_upload_date=" + r_upload_date
				+ ", r_status=" + r_status + ", r_no=" + r_no + ", g_no=" + g_no + ", m_no=" + m_no + ", m_name="
				+ m_name + "]";
	}

}
