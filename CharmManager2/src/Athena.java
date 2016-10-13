import java.awt.Dimension;

import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;


public class Athena extends JDialog{
	JTextArea ta = new JTextArea();
	public Athena(){
		
		this.setTitle("Athena export");
		this.setSize(new Dimension(230, 600));
		this.setLocationRelativeTo(null);
		this.setVisible(true);
		this.setModal(true);
		
		JPanel zoneClient = (JPanel)getContentPane();
		JScrollPane span = new JScrollPane(ta);
		zoneClient.add(span);
		
		ta.setText(skillManager.exportAthena());
		
	}
	
}
