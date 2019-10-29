package entity;

public class TypeOne {
	private int id;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public TypeOne(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public TypeOne() {
		super();
	}
	@Override
	public String toString() {
		return "TypeOne [id=" + id + ", name=" + name + "]";
	}
	
	
}
