package entity;

public class Apply {
	private int id ;
	private String postname;
	private String address;
	private String state;
	private String phone;
	private String name;
	private String sex;
	private String birthday;
	private String email;
	private String userphone;
	private String workday;
	private String taty;
	private String post;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getWorkday() {
		return workday;
	}
	public void setWorkday(String workday) {
		this.workday = workday;
	}
	public String getTaty() {
		return taty;
	}
	public void setTaty(String taty) {
		this.taty = taty;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	private String city;
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the postname
	 */
	public String getPostname() {
		return postname;
	}
	/**
	 * @param postname the postname to set
	 */
	public void setPostname(String postname) {
		this.postname = postname;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}
	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
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
	@Override
	public String toString() {
		return "Apply [id=" + id + ", postname=" + postname + ", address="
				+ address + ", state=" + state + ", phone=" + phone + ", name="
				+ name + ", sex=" + sex + ", birthday=" + birthday + ", email="
				+ email + ", userphone=" + userphone + ", workday=" + workday
				+ ", taty=" + taty + ", post=" + post + ", city=" + city + "]";
	}
}
