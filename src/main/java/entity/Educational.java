package entity;

public class Educational {

	private String schoolname;   //学校名称
	
	private String time;   //时间

	private String majorname;   //专业名称
	
	private String education;   //学历
	
	private String degree;    //学位

	public String getSchoolname() {
		return schoolname;
	}

	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getMajorname() {
		return majorname;
	}

	public void setMajorname(String majorname) {
		this.majorname = majorname;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	@Override
	public String toString() {
		return "Educational [schoolname=" + schoolname + ", time=" + time
				+ ", majorname=" + majorname + ", education=" + education
				+ ", degree=" + degree + "]";
	}
	
	
	
}
