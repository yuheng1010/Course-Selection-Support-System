package db3;

public class Professor {
	private int profID;
	private String profName;
	
	public Professor(int profID,String profName) {
		this.profID=profID;
		this.profName=profName;
	}
	public int getProfID() {
		return profID;
	}
	public String getProfName() {
		return profName;
	}
}
