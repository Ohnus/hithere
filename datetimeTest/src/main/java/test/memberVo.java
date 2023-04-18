package test;

public class memberVo {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String status;
	
	public memberVo() {
	}
	
	public memberVo(String id, String pwd, String name, String email, String status) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "memberVo [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", status=" + status
				+ "]";
	}
}
