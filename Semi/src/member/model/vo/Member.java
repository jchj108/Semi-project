package member.model.vo;

import java.sql.Date;

public class Member {
	private int m_no;
	private String m_email;
	private String m_pwd;
	private String m_name;
	private char m_gender;
	private String m_address;
	private Date m_date;
	private String m_etc;
	private int m_auth;
	private String m_status;
	
	public Member() {}
	
	public Member(String m_email, String m_pwd) {
		super();
		this.m_email = m_email;
		this.m_pwd = m_pwd;
	}

	public Member(int m_no, String m_email, String m_pwd, String m_name, char m_gender, String m_address, Date m_date,
			String m_etc, int m_auth, String m_status) {
		super();
		this.m_no = m_no;
		this.m_email = m_email;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_address = m_address;
		this.m_date = m_date;
		this.m_etc = m_etc;
		this.m_auth = m_auth;
		this.m_status = m_status;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public char getM_gender() {
		return m_gender;
	}

	public void setM_gender(char m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

	public String getM_etc() {
		return m_etc;
	}

	public void setM_etc(String m_etc) {
		this.m_etc = m_etc;
	}

	public int getM_auth() {
		return m_auth;
	}

	public void setM_auth(int m_auth) {
		this.m_auth = m_auth;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	@Override
	public String toString() {
		return "Member [m_no=" + m_no + ", m_email=" + m_email + ", m_pwd=" + m_pwd + ", m_name=" + m_name
				+ ", m_gender=" + m_gender + ", m_address=" + m_address + ", m_date=" + m_date + ", m_etc=" + m_etc
				+ ", m_auth=" + m_auth + ", m_status=" + m_status + "]";
	}
	
}
