import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.spi.DirStateFactory.Result;
import javax.xml.crypto.Data;


public class skillManager {

	public static Vector<String> getSkills(){
		String language = Ihm.cbLang.getSelectedItem().toString();
		String sql = "SELECT \"NAME-" + language + "\" FROM public.\"SKILLS\" ORDER BY \"NAME-" + language + "\";";
		Vector<String> vec = new Vector<String>();
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			while(rs.next()){
				vec.add(rs.getString("NAME-" + language));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("getskills: " + vec.size());
		return vec;
	}

	public static int addCharm(int rarity, String skill1, int value1, String skill2, int value2, int slots){
		int ID = -2;
		String language = Ihm.cbLang.getSelectedItem().toString();
		String sql = "INSERT INTO public.\"CHARM\"(\"RARITY\", \"SKILL1\", \"VALUE1\", \"SKILL2\", \"VALUE2\", \"SLOTS\", \"FAV\") VALUES (?, (SELECT \"ID\" FROM public.\"SKILLS\" AS s WHERE s.\"NAME-" + language + "\" = ?), ?, (SELECT \"ID\" FROM public.\"SKILLS\" AS s WHERE s.\"NAME-" + language + "\" = ?), ?, ?, ?) RETURNING \"ID\";";
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			st.setInt(1, rarity);
			st.setString(2, skill1);
			st.setInt(3, value1);
			st.setString(4, skill2);
			st.setInt(5, value2);
			st.setInt(6, slots);
			st.setBoolean(7, false);

			ResultSet rs = st.executeQuery();
			if(rs.next()){
				ID = rs.getInt("ID");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ID;
	}

	public static Vector<Skill> getAllCharms(boolean withFav, int withSlots){
		String skill = "\"SKILL1\"";
		if(Ihm.cbSorter.getSelectedItem().equals("game skill2")){
			skill = "\"SKILL2\"";
		}
		String language = Ihm.cbLang.getSelectedItem().toString();
		String sql = "SELECT  ROW_NUMBER() OVER ( ORDER BY (SELECT \"gameOrder\" FROM \"SKILLS\" AS s WHERE s.\"ID\" = c." + skill + "), "
				+ "c.\"VALUE1\" DESC, \"SKILL2\", \"VALUE2\" DESC ) AS rowNumber, "
				+ "c.\"ID\", (SELECT \"gameOrder\" FROM \"SKILLS\" WHERE \"ID\" = c.\"SKILL1\") AS gameOrder1, "
				+ "(SELECT \"NAME-" + language + "\" FROM public.\"SKILLS\" AS s WHERE s.\"ID\" = \"SKILL1\") AS SKILL1, "
				+ "\"VALUE1\", (SELECT \"gameOrder\" FROM \"SKILLS\" WHERE \"ID\" = c.\"SKILL2\") AS gameOrder2, "
				+ "(SELECT \"NAME-" + language + "\" FROM public.\"SKILLS\" AS s WHERE s.\"ID\" = \"SKILL2\") AS SKILL2, "
				+ "\"VALUE2\", \"SLOTS\", \"RARITY\", \"FAV\" FROM public.\"CHARM\" AS c";

		if(withFav && withSlots == 4){
			sql += " WHERE \"FAV\" = TRUE";
		}
		else if(withFav && withSlots < 4){
			sql += " WHERE \"FAV\" = TRUE AND \"SLOTS\" = " + withSlots;
		}
		else if(!withFav && withSlots < 4){
			sql += " WHERE \"SLOTS\" = " + withSlots;
		}

		String sortSelected = Ihm.cbSorter.getSelectedItem().toString();
		
		if(sortSelected.equals("alpha skill1")){
			sql += " ORDER BY SKILL1, \"VALUE1\" DESC, SKILL2, \"VALUE2\" DESC;";

		}
		else if(sortSelected.equals("alpha skill2")){
			sql += " ORDER BY SKILL2, \"VALUE2\" DESC, SKILL1, \"VALUE1\" DESC;";
		}
		else if(sortSelected.equals("game skill1")){
			sql += " ORDER BY gameOrder1, \"VALUE1\" DESC, \"SKILL2\", \"VALUE2\" DESC";
		}
		else if (sortSelected.equalsIgnoreCase("game skill2")){
			sql += " ORDER BY gameOrder2, \"VALUE2\" DESC, \"SKILL1\", \"VALUE1\" DESC";
		}
		else{
			System.out.println("HOUSTON WE GOT A PROBLEM");
		}

		Vector<Skill> vec = new Vector<Skill>();
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				String skill1 = rs.getString("SKILL1");
				int value1 = rs.getInt("VALUE1");
				String skill2 = rs.getString("SKILL2");
				int value2 = rs.getInt("VALUE2");
				int slots = rs.getInt("SLOTS");
				int rarity = rs.getInt("RARITY");
				int ID = rs.getInt("ID");
				boolean fav = rs.getBoolean("FAV");
				int position = rs.getInt("rowNumber");
				Skill skl = new Skill(ID, skill1, value1, skill2, value2, slots, rarity, fav, position);
				vec.add(skl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vec;
	}

	public static String getInfo(String skill){
		String sql = "SELECT \"NAME\", \"DESCRIPTION\" FROM public.\"LINE\" WHERE \"SKILL\" = (SELECT \"ID\" FROM public.\"SKILLS\" AS s WHERE s.\"NAME-FR\" = ?);";
		String ret = "";
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			st.setString(1, skill);
			ResultSet rs = st.executeQuery();

			while(rs.next()){
				ret += rs.getString("NAME") + " : " + rs.getString("DESCRIPTION") + "<br>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ret;
	}

	public static void delCharm(int ID){
		String sql = "DELETE FROM public.\"CHARM\" WHERE \"ID\" = ?;";
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			st.setInt(1, ID);
			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public static Vector<Skill> searchByValue(int value, boolean withFav, int withSlots){
		String skill = "\"SKILL1\"";
		if(Ihm.cbSorter.getSelectedItem().equals("game skill2")){
			skill = "\"SKILL2\"";
		}
		String language = Ihm.cbLang.getSelectedItem().toString();
		String sql = "SELECT ROW_NUMBER() OVER ( ORDER BY (SELECT \"gameOrder\" FROM \"SKILLS\" AS s WHERE s.\"ID\" = c." + skill + "), "
				+ "c.\"VALUE1\" DESC, \"SKILL2\", \"VALUE2\" DESC ) AS rowNumber, "
				+ "c.\"ID\", (SELECT \"gameOrder\" FROM \"SKILLS\" WHERE \"ID\" = c.\"SKILL1\") AS gameOrder1, "
				+ "(SELECT \"NAME-" + language + "\" FROM public.\"SKILLS\" AS s WHERE s.\"ID\" = \"SKILL1\") AS SKILL1, "
				+ "\"VALUE1\", (SELECT \"gameOrder\" FROM \"SKILLS\" WHERE \"ID\" = c.\"SKILL2\") AS gameOrder2, "
				+ "(SELECT \"NAME-" + language + "\" FROM public.\"SKILLS\" AS s WHERE s.\"ID\" = \"SKILL2\") AS SKILL2, "
				+ "\"VALUE2\", \"SLOTS\", \"RARITY\", \"FAV\" FROM public.\"CHARM\" AS c"
				+ " WHERE (\"VALUE1\" = ? OR \"VALUE2\" = ?)";
		
		if(withFav && withSlots == 4){
			sql += " AND \"FAV\" = TRUE";
		}
		else if(withFav && withSlots < 4){
			sql += " AND \"FAV\" = TRUE AND \"SLOTS\" = " + withSlots;
		}
		else if(!withFav && withSlots < 4){
			sql += " AND \"SLOTS\" = " + withSlots;
		}
		
		String sortSelected = Ihm.cbSorter.getSelectedItem().toString();
		
		if(sortSelected.equals("alpha skill1")){
			sql += " ORDER BY SKILL1, \"VALUE1\" DESC, SKILL2, \"VALUE2\" DESC;";

		}
		else if(sortSelected.equals("alpha skill2")){
			sql += " ORDER BY SKILL2, \"VALUE2\" DESC, SKILL1, \"VALUE1\" DESC;";
		}
		else if(sortSelected.equals("game skill1")){
			sql += " ORDER BY gameOrder1, \"VALUE1\" DESC, \"SKILL2\", \"VALUE2\" DESC";
		}
		else if (sortSelected.equalsIgnoreCase("game skill2")){
			sql += " ORDER BY gameOrder2, \"VALUE2\" DESC, \"SKILL1\", \"VALUE1\" DESC";
		}
		else{
			System.out.println("HOUSTON WE GOT A PROBLEM");
		}

		Vector<Skill> vec = new Vector<Skill>();
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			st.setInt(1, value);
			st.setInt(2, value);
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				String skill1 = rs.getString("SKILL1");
				int value1 = rs.getInt("VALUE1");
				String skill2 = rs.getString("SKILL2");
				int value2 = rs.getInt("VALUE2");
				int slots = rs.getInt("SLOTS");
				int rarity = rs.getInt("RARITY");
				int ID = rs.getInt("ID");
				boolean fav = rs.getBoolean("FAV");
				int position = rs.getInt("rowNumber");
				Skill skl = new Skill(ID, skill1, value1, skill2, value2, slots, rarity, fav, position);
				vec.add(skl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vec;
	}
	
	public static Vector<Skill> searchCharm(String str){
		String language = Ihm.cbLang.getSelectedItem().toString();
		String skill = "\"SKILL1\"";
		if(Ihm.cbSorter.getSelectedItem().equals("game skill2")){
			skill = "\"SKILL2\"";
		}
		String sql = "SELECT ROW_NUMBER() OVER ( ORDER BY (SELECT \"gameOrder\" FROM \"SKILLS\" AS s WHERE s.\"ID\" = c." + skill + ") ) AS rowNumber, "
				+ "c.\"ID\", (SELECT \"gameOrder\" FROM \"SKILLS\" WHERE \"ID\" = c.\"SKILL1\") AS gameOrder1, "
				+ "\"ID\", \"RARITY\", (SELECT \"NAME-" + language + "\" FROM public.\"SKILLS\" AS s WHERE s.\"ID\" = \"SKILL1\") as SKILL1, "
				+ "\"VALUE1\", (SELECT \"gameOrder\" FROM \"SKILLS\" WHERE \"ID\" = c.\"SKILL2\") AS gameOrder2, "
				+ "\"VALUE1\", (SELECT \"NAME-" + language + "\" FROM public.\"SKILLS\" AS s WHERE s.\"ID\" = \"SKILL2\") AS SKILL2, "
				+ "\"VALUE2\", \"SLOTS\", \"FAV\" FROM public.\"CHARM\" as c "
				+ "WHERE (LOWER((SELECT \"NAME-" + language + "\" FROM public.\"SKILLS\" AS s WHERE s.\"ID\" = \"SKILL1\")) "
				+ "LIKE LOWER(?)) OR ((LOWER((SELECT \"NAME-" + language +"\" FROM public.\"SKILLS\" AS s WHERE s.\"ID\" = \"SKILL2\")) LIKE LOWER(?)))";

		if(Ihm.cbFav.isSelected()){
			sql += " AND \"FAV\" = TRUE";
		}

		if(Ihm.cbSlots.getSelectedIndex() > 0){
			sql += " AND \"SLOTS\" = " + Integer.parseInt(Ihm.cbSlots.getSelectedItem().toString());
		}

		if(Ihm.cbSorter.getSelectedItem().equals("alpha skill1")){
			sql += " ORDER BY SKILL1, \"VALUE1\" DESC, SKILL2, \"VALUE2\" DESC;";

		}
		else if(Ihm.cbSorter.getSelectedItem().equals("alpha skill2")){
			sql += " ORDER BY SKILL2, \"VALUE2\" DESC, SKILL1, \"VALUE1\" DESC;";
		}
		else if(Ihm.cbSorter.getSelectedItem().equals("game skill1")){
			sql += " ORDER BY gameOrder1, \"VALUE1\" DESC, \"SKILL2\", \"VALUE2\" DESC";
		}
		else{
			sql += " ORDER BY gameOrder2, \"VALUE2\" DESC, \"SKILL1\", \"VALUE1\" DESC";
		}

		Vector<Skill> vec = new Vector<Skill>();

		PreparedStatement st;
		try {
			st = Database.getConnexion().prepareStatement(sql);
			st.setString(1, str);
			st.setString(2, str);

			ResultSet rs = st.executeQuery();
			while(rs.next()){
				String skill1 = rs.getString("SKILL1");
				int value1 = rs.getInt("VALUE1");
				String skill2 = rs.getString("SKILL2");
				int value2 = rs.getInt("VALUE2");
				int slots = rs.getInt("SLOTS");
				int rarity = rs.getInt("RARITY");
				int ID = rs.getInt("ID");
				boolean fav = rs.getBoolean("FAV");
				int position = rs.getInt("rowNumber");
				Skill skl = new Skill(ID, skill1, value1, skill2, value2, slots, rarity, fav, position);
				vec.add(skl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vec;

	}

	public static void setFav(boolean fav, int ID){
		String sql = "UPDATE public.\"CHARM\" SET \"FAV\"=? WHERE \"ID\" = ?;";
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			st.setBoolean(1, fav);
			st.setInt(2, ID);
			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static int countCharms(){
		int total = 0;
		String sql = "SELECT COUNT(*) AS \"TOTAL\" FROM public.\"CHARM\";";
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			if(rs.next()){
				total = rs.getInt("TOTAL");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return total;
	}

	public static int getMaxValue(String skill){
		int ret = -2;
		String language = Ihm.cbLang.getSelectedItem().toString();
		String sql = "SELECT GREATEST((SELECT max(\"VALUE1\")FROM public.\"CHARM\" WHERE (\"SKILL1\" = (SELECT \"ID\" FROM public.\"SKILLS\" AS s WHERE s.\"NAME-" + language + "\" = ?))), (SELECT max(\"VALUE2\")AS MAX FROM public.\"CHARM\" WHERE (\"SKILL2\" = (SELECT \"ID\" FROM public.\"SKILLS\" AS s WHERE s.\"NAME-" + language + "\" = ?)))) AS MAX;";
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			st.setString(1, skill);
			st.setString(2, skill);
			ResultSet rs =st.executeQuery();
			if(rs.next()){
				ret = rs.getInt("MAX");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}

	public static boolean exists(String skill1, int value1, String skill2, int value2, int slots){
		boolean ret = false;
		String language = Ihm.cbLang.getSelectedItem().toString();
		String sql = "SELECT * FROM public.\"CHARM\" WHERE \"SKILL1\" = (SELECT \"ID\" FROM public.\"SKILLS\" AS s WHERE s.\"NAME-" + language + "\" = ?) "
				+ "AND \"VALUE1\" = ? AND \"SKILL2\" = (SELECT \"ID\" FROM public.\"SKILLS\" AS s WHERE s.\"NAME-" + language + "\" = ?) "
				+ "AND \"VALUE2\" = ? AND \"SLOTS\" = ?;";
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);

			st.setString(1, skill1);
			st.setInt(2, value1);
			st.setString(3, skill2);
			st.setInt(4, value2);
			st.setInt(5, slots);

			ResultSet rs = st.executeQuery();

			System.out.println("Search: " + st.toString());

			if(rs.next()){
				ret = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ret;
	}

	public static boolean findDuplicate(){
		String sql = "select \"RARITY\", \"SKILL1\", \"VALUE1\", \"SKILL2\", \"VALUE2\", \"SLOTS\", count(*) FROM public.\"CHARM\" group by \"RARITY\", \"SKILL1\", \"VALUE1\", \"SKILL2\", \"VALUE2\", \"SLOTS\" HAVING count(*) > 1";
		boolean ret = false;
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			if(rs.next()){
				ret = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}

	public static String exportAthena(){
		String language = Ihm.cbLang.getSelectedItem().toString();
		String sql = "SELECT \"SLOTS\", (SELECT \"NAME-" + language + "\" FROM public.\"SKILLS\" AS s WHERE s.\"ID\" = \"SKILL1\") AS SKILL1, \"VALUE1\", (SELECT \"NAME-" + language + "\" FROM public.\"SKILLS\" AS s WHERE s.\"ID\" = \"SKILL2\") AS SKILL2, \"VALUE2\" FROM public.\"CHARM\" ORDER BY SKILL1, \"VALUE1\" DESC, SKILL2, \"VALUE2\" DESC;";
		String ret = "";
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			int i = 0;
			while(rs.next()){
				i++;
				int slots = rs.getInt("SLOTS");
				String value1 = "" + rs.getInt("VALUE1");
				String value2 = "" + rs.getInt("VALUE2");
				String skill1 = rs.getString("SKILL1");
				String skill2 = rs.getString("SKILL2");

				if(value1.equals("0")){
					value1 = "";
					skill1 = "";
				}

				if(value2.equals("0")){
					value2 = "";
					skill2 = "";
				}


				ret += slots + "," + skill1 + "," + value1 + "," + skill2 + "," + value2 + "\n";

			}
			ret += "Total: " + i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}

	public static Vector<String> searchSkill(String search){
		search = search.toLowerCase();
		String sql = "SELECT (SELECT s.\"NAME-FR\" FROM \"SKILLS\" AS s WHERE s.\"ID\" = l.\"SKILL\") AS SKILL, l.\"NAME\", l.\"DESCRIPTION\" FROM public.\"LINE\" AS l WHERE LOWER(\"NAME\") LIKE '%' || ? ||'%' OR LOWER(\"DESCRIPTION\") LIKE '%' || ? ||'%' OR (SELECT LOWER(s.\"NAME-FR\") FROM \"SKILLS\" AS s WHERE s.\"ID\" = l.\"SKILL\") LIKE '%' || ? ||'%';";
		Vector<String> vec = new Vector<String>();
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			st.setString(1, search);
			st.setString(2, search);
			st.setString(3, search);
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				vec.add(rs.getString("SKILL") + " | " + rs.getString("NAME") + " | " + rs.getString("DESCRIPTION"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vec;
	}

	public static boolean isSkill(String str){
		boolean ret = false;
		String sql = "SELECT \"NAME-FR\" FROM public.\"SKILLS\" WHERE \"NAME-FR\" = ?;";
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			st.setString(1, str);
			ResultSet rs = st.executeQuery();
			if(rs.next()){
				ret = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ret;
	}

	public static void setGame(int order, String skill){
		String sql = "UPDATE public.\"SKILLS\" SET \"gameOrder\"= ? WHERE \"NAME-FR\"= ?;";
		try {
			PreparedStatement st = Database.getConnexion().prepareStatement(sql);
			st.setInt(1, order);
			st.setString(2, skill);
			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
