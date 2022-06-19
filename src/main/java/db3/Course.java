package db3;

public class Course {
	
	private int courseID;
	private int freeD;
	private int gradeD;
	private String feedback;
	private String session;
	private String cname;
	private int credit;
	private String field;
	private int prof;
	private String limitP;
	private String inputDate;
	
	public Course(int courseID,String field,String session,String cname,int credit,String limitP,int prof) {
		this.courseID=courseID;
		this.field=field;
		this.session=session;
		this.cname=cname;
		this.credit=credit;
		this.limitP=limitP;
		this.prof=prof;
	}
	public Course(int courseID, int freeD, int gradeD, String feedback, String inputDate) {
		this.courseID=courseID;
		this.freeD=freeD;
		this.gradeD=gradeD;
		this.feedback=feedback;
		this.inputDate=inputDate;
	}
	
	public void setCourseID(int id) {
		this.courseID=id;
	}
	public void setFreeD(int fd) {
		this.freeD=fd;
	}
	public void setGradeD(int gd) {
		this.gradeD=gd;
	}
	public void setFeedback(String fb) {
		this.feedback=fb;
	}
	public void setSession(String session) {
		this.session=session;
	}
	public void setName(String cname) {
		this.cname=cname;
	}
	public void setCredit(int cre) {
		this.credit=cre;
	}
	public void setField(String field) {
		this.field=field;
	}
	public void setProf(int pro) {
		this.prof=pro;
	}
	public void setLimitP(String people) {
		this.limitP=people;
	}
	public int getCourseID() {
		return courseID;
	}
	public int getFreeD() {
		return freeD;
	}
	public int getGradeD() {
		return gradeD;
	}
	public String getFeedback() {
		return feedback;
	}
	public String getSession() {
		return session;
	}
	public String getName() {
		return cname;
	}
	public int getCredit() {
		return credit;
	}
	public String getField() {
		return field;
	}
	public int getProf() {
		return prof;
	}
	public String getLimitP() {
		return limitP;
	}
	public String getInputDate() {
		return inputDate;
	}

	
	
}
