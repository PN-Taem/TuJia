package entity;

public class TypeTwo extends TypeOne {
	private int oneid;

	public int getOneid() {
		return oneid;
	}

	public void setOneid(int oneid) {
		this.oneid = oneid;
	}

	public TypeTwo(int id, String name, int oneid) {
		super(id, name);
		this.oneid = oneid;
	}

	public TypeTwo() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
