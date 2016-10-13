
public class Skill {

	int ID;
	
	String skill1;
	int value1;
	String skill2;
	int value2;
	int slots;
	int rarity;
	boolean fav;
	int position;
	
	public Skill(int ID, String skill1, int value1, String skill2, int value2,
			int slots, int rarity, boolean fav, int position) {
		super();
		this.ID = ID;
		this.skill1 = skill1;
		this.value1 = value1;
		this.skill2 = skill2;
		this.value2 = value2;
		this.slots = slots;
		this.rarity = rarity;
		this.fav = fav;
		this.position = position;
	}
	
	
	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	public boolean isFav() {
		return fav;
	}

	public void setFav(boolean fav) {
		this.fav = fav;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getSkill1() {
		return skill1;
	}

	public void setSkill1(String skill1) {
		this.skill1 = skill1;
	}

	public int getValue1() {
		return value1;
	}

	public void setValue1(int value1) {
		this.value1 = value1;
	}

	public String getSkill2() {
		return skill2;
	}

	public void setSkill2(String skill2) {
		this.skill2 = skill2;
	}

	public int getValue2() {
		return value2;
	}

	public void setValue2(int value2) {
		this.value2 = value2;
	}

	public int getSlots() {
		return slots;
	}

	public void setSlots(int slots) {
		this.slots = slots;
	}

	public int getRarity() {
		return rarity;
	}

	public void setRarity(int rarity) {
		this.rarity = rarity;
	}
	
	
	
}
