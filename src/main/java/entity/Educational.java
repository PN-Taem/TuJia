package entity;

public class Educational {

	private String schoolname;   //ѧУ����
	
	private String time;   //ʱ��

	private String majorname;   //רҵ����
	
	private String education;   //ѧ��
	
	private String degree;    //ѧλ

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
