package entity;

public class User {
	private String name;
	private String sex;
	private String birthday;
	private String email;
	private String phone;
	private String workday;
	private String trade;
	private String post;
	private String city;
	private String pwd;
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String email, String phone, String pwd) {
		super();
		this.email = email;
		this.phone = phone;
		this.pwd = pwd;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return the birthday
	 */
	public String getBirthday() {
		return birthday;
	}
	/**
	 * @param birthday the birthday to set
	 */
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the workday
	 */
	public String getWorkday() {
		return workday;
	}
	/**
	 * @param workday the workday to set
	 */
	public void setWorkday(String workday) {
		this.workday = workday;
	}
	/**
	 * @return the trade
	 */
	public String getTrade() {
		return trade;
	}
	/**
	 * @param trade the trade to set
	 */
	public void setTrade(String trade) {
		this.trade = trade;
	}
	/**
	 * @return the post
	 */
	public String getPost() {
		return post;
	}
	/**
	 * @param post the post to set
	 */
	public void setPost(String post) {
		this.post = post;
	}
	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return the pwd
	 */
	public String getPwd() {
		return pwd;
	}
	/**
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "User [name=" + name + ", sex=" + sex + ", birthday=" + birthday
				+ ", email=" + email + ", phone=" + phone + ", workday="
				+ workday + ", trade=" + trade + ", post=" + post + ", city="
				+ city + ", pwd=" + pwd + "]";
	}
	
}
