package db3;

public class User {
    private int id;
    private String name;
    private String dep;
    private String password;
 
    // getters and setters are not shown for brevity   
    
    public void setName(String name) {
    	this.name=name;
    }
    public void setID(int id) {
    	this.id=id;
    }
    public void setDep(String dep) {
    	this.dep=dep;
    }
    public void setPsw(String psw) {
    	this.password=psw;
    }
    public int getID() {
    	return this.id;
    }
    
    public String getName() {
    	 return name;
     }
     public String getDep() {
    	 return dep;
     }
     public String getPassword() {
    	 return password;
     }
}
