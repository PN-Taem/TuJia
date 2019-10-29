package entity;

public class TypeThree extends TypeTwo {

	private int twoid;
	public TypeThree(int id, String name, int oneid, int twoid) {
		super(id, name, oneid);
		this.twoid = twoid;
	}

	public TypeThree() {
		super();
	}

	public int getTwoid() {
		return twoid;
	}

	public void setTwoid(int twoid) {
		this.twoid = twoid;
	}
	
}
