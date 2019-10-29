package entity;

public class Post {
	private int postid;
	private String postname;
	private int typeOneId;
	private int typeTwoId;
	private int typeThreeId;
	private String describe;
	private String request;
	private int postrecruit;
	private String posttime;
	private String address;
	private String typeName;
	private int addressid;
	/**
	 * @return the 编号
	 */
	public int getPostid() {
		return postid;
	}
	/**
	 * @param postid the 编号 to set
	 */
	public void setPostid(int postid) {
		this.postid = postid;
	}
	/**
	 * @return the 职位名称
	 */
	public String getPostname() {
		return postname;
	}
	/**
	 * @param postname the 职位名称 to set
	 */
	public void setPostname(String postname) {
		this.postname = postname;
	}
	/**
	 * @return the typeOneId
	 */
	public int getTypeOneId() {
		return typeOneId;
	}
	/**
	 * @param typeOneId the typeOneId to set
	 */
	public void setTypeOneId(int typeOneId) {
		this.typeOneId = typeOneId;
	}
	/**
	 * @return the typeTwoId
	 */
	public int getTypeTwoId() {
		return typeTwoId;
	}
	/**
	 * @param typeTwoId the typeTwoId to set
	 */
	public void setTypeTwoId(int typeTwoId) {
		this.typeTwoId = typeTwoId;
	}
	/**
	 * @return the typeThreeId
	 */
	public int getTypeThreeId() {
		return typeThreeId;
	}
	/**
	 * @param typeThreeId the typeThreeId to set
	 */
	public void setTypeThreeId(int typeThreeId) {
		this.typeThreeId = typeThreeId;
	}
	/**
	 * @return the describe
	 */
	public String getDescribe() {
		return describe;
	}
	/**
	 * @param describe the describe to set
	 */
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	/**
	 * @return the request
	 */
	public String getRequest() {
		return request;
	}
	/**
	 * @param request the request to set
	 */
	public void setRequest(String request) {
		this.request = request;
	}
	/**
	 * @return the postrecruit
	 */
	public int getPostrecruit() {
		return postrecruit;
	}
	/**
	 * @param postrecruit the postrecruit to set
	 */
	public void setPostrecruit(int postrecruit) {
		this.postrecruit = postrecruit;
	}
	/**
	 * @return the posttime
	 */
	public String getPosttime() {
		return posttime;
	}
	
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	/**
	 * @param posttime the posttime to set
	 */
	public void setPosttime(String posttime) {
		this.posttime = posttime;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Post [postid=" + postid + ", postname=" + postname
				+ ", typeOneId=" + typeOneId + ", typeTwoId=" + typeTwoId
				+ ", typeThreeId=" + typeThreeId + ", describe=" + describe
				+ ", request=" + request + ", postrecruit=" + postrecruit
				+ ", posttime=" + posttime + ", typename=" + address + "]";
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the addressid
	 */
	public int getAddressid() {
		return addressid;
	}
	/**
	 * @param addressid the addressid to set
	 */
	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}
	
	
	
}
