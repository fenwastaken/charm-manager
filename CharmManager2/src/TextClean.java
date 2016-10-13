import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Vector;


public class TextClean {
	
	Vector<Skill> skill = new Vector<Skill>();
	
	public TextClean() {
		// TODO Auto-generated method stub
		Vector<String> liste = new Vector<String>();
		File file = new File("C:\\Users\\Aura\\Desktop\\kira.txt");
		BufferedReader reader = null;

		try {
		    reader = new BufferedReader(new FileReader(file));
		    String text = null;

		    while ((text = reader.readLine()) != null) {
		        if(text.length() > 0){
		        	liste.add(text);
		        }
		    }
		    
		} catch (FileNotFoundException e) {
		    e.printStackTrace();
		} catch (IOException e) {
		    e.printStackTrace();
		} finally {
		    try {
		        if (reader != null) {
		            reader.close();
		        }
		    } catch (IOException e) {
		    }
		}
//==========
		
		//print out the list
		Vector<String> vec = new Vector<String>();
		
		int i = 0;
		for(String str : liste){
			i++;
			skillManager.setGame(i, str);
		}

	}
}
