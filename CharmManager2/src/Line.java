import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.IOException;
import java.util.Vector;

import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;


public class Line extends JPanel{

	int ID;

	JLabel s1;
	JLabel v1;
	JLabel s2;
	JLabel v2;
	JLabel slo;
	//JLabel rar;

	JButton bt = new JButton();
	JCheckBox check = new JCheckBox("Fav");
	

	public Line(int ID, String skill1, int value1, String skill2, int value2, int slots, int rarity, boolean fav, int position){

		bt.setIcon(new ImageIcon("iconDelete.png"));
		
		this.ID = ID;
		
		this.setMaximumSize(new Dimension(900, 35));
		bt.setPreferredSize(new Dimension(22, 23));
		this.setBorder(BorderFactory.createEtchedBorder());


		if(value1 == 0){
			v1 = new JLabel("");
			s1 = new JLabel("");
		}
		else{
			v1 = new JLabel(value1 + "");
			s1 = new JLabel(skill1);
			
			if(value1 == skillManager.getMaxValue(skill1)){
				v1.setForeground(Color.red);
				s1.setForeground(Color.red);
			}
			
		}

		if(value2 == 0){
			v2 = new JLabel("");
			s2 = new JLabel("");
		}
		else{
			v2 = new JLabel(value2 + "");
			s2 = new JLabel(skill2);
			
			if(value2 == skillManager.getMaxValue(skill2)){
				v2.setForeground(Color.red);
				s2.setForeground(Color.red);
			}
			
		}

		check.setSelected(fav);

		String sl = "";
		for(int i = 0 ; i < slots ; i++){
			sl += "O";
		}

		slo = new JLabel(sl);

		//rar = new JLabel("Rarity: " + rarity + "");

		Dimension d = new Dimension(80, 25);
		Dimension d2 = new Dimension(30, 25);
		Dimension d3 = new Dimension(60, 25);

		s1.setPreferredSize(d);
		v1.setPreferredSize(d2);
		s2.setPreferredSize(d);
		v2.setPreferredSize(d2);
		slo.setPreferredSize(d);
		//rar.setPreferredSize(d);

		/*
		 * 		s1.setBorder(BorderFactory.createLineBorder(Color.blue));
		v1.setBorder(BorderFactory.createLineBorder(Color.blue));
		s2.setBorder(BorderFactory.createLineBorder(Color.blue));
		v2.setBorder(BorderFactory.createLineBorder(Color.blue));
		slo.setBorder(BorderFactory.createLineBorder(Color.blue));
		rar.setBorder(BorderFactory.createLineBorder(Color.blue));
		 */

		Double pos = (double) position;
		pos = Math.ceil(pos/9);
			check.setText("Fav");
			check.setToolTipText("#" + position + ", Page:" + pos.intValue());
			
			if(Ihm.tfSaisie.getText().isEmpty() && position%9 == 1 && ((Ihm.cbSorter.getSelectedItem().equals("game skill1"))||(Ihm.cbSorter.getSelectedItem().equals("game skill2")))){
				check.setForeground(Color.blue);
			}
			

		
		JLabel labSpace1 = new JLabel();
		labSpace1.setPreferredSize(d);

		String tt1 = skillManager.getInfo(s1.getText());
		String tt2 = skillManager.getInfo(s2.getText());

		if(tt1.length() > 150){
			tt1 = linebreak(tt1);
		}

		if(tt2.length() > 150){
			tt2 = linebreak(tt2);
		}

		s1.setToolTipText("<html>" + tt1 + "</html>");
		s2.setToolTipText("<html>" + tt2 + "</html>");

		this.add(check);
		this.add(Box.createRigidArea(d));
		this.add(s1);
		this.add(v1);
		this.add(labSpace1);
		this.add(s2);
		this.add(v2);
		this.add(slo);
		//this.add(rar);
		this.add(bt);

		bt.addActionListener(new appActionListener());
		s1.addMouseListener(new appMouseListener());
		s2.addMouseListener(new appMouseListener());
		check.addItemListener(new appItemListerner());
	}

	public class appItemListerner implements ItemListener{

		@Override
		public void itemStateChanged(ItemEvent e) {
			// TODO Auto-generated method stub
			if(e.getSource() == check){
				skillManager.setFav(check.isSelected(), ID);
			}
		}

	}

	public class appActionListener implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			if(e.getSource() == bt){
				skillManager.delCharm(Line.this.ID);
				
				Ihm.displayAny();
				
				Ihm.cbSkill1.setSelectedItem(s1.getText());
				Ihm.cbSkill2.setSelectedItem(s2.getText());
				Ihm.cbNbr1.setSelectedItem(v1.getText());
				Ihm.cbNbr2.setSelectedItem(v2.getText());
				Ihm.cbSlots2.setSelectedItem(slo.getText());
				//Ihm.cbRarity.setSelectedItem(rar.getText());
				
				
			}
		}

	}

	public class appMouseListener implements MouseListener{

		@Override
		public void mouseClicked(MouseEvent e) {
			// TODO Auto-generated method stub
			if(e.getSource() == s1 && e.getButton() == MouseEvent.BUTTON3){
				help h = new help(s1.getText());
			}
			if(e.getSource() == s2 && e.getButton() == MouseEvent.BUTTON3){
				help h = new help(s2.getText());
			}
		}

		@Override
		public void mousePressed(MouseEvent e) {
			// TODO Auto-generated method stub

		}

		@Override
		public void mouseReleased(MouseEvent e) {
			// TODO Auto-generated method stub

		}

		@Override
		public void mouseEntered(MouseEvent e) {
			// TODO Auto-generated method stub

		}

		@Override
		public void mouseExited(MouseEvent e) {
			// TODO Auto-generated method stub

		}

	}

	public String linebreak(String text){
		Vector<String> vec = new Vector<String>();
		int i = 0;
		while(text.length() > 150 && i < 10 && text.indexOf(" ") != -1){
			i++;
			int space = text.indexOf(" ", 130);
			if(space != -1){
				vec.add(text.substring(0, space));
				text = text.substring(space);
			}
		}
		if(!vec.contains(text)){
			vec.add(text);
		}

		String ret = "";
		for(String str : vec){
			ret += str + "<br>";
		}

		return ret;

	}

	public class help extends JFrame{

		JTextArea ta = new JTextArea();

		public help(String skill){
			this.setTitle("tooltip");
			this.setSize(850, 150);
			this.setLocationRelativeTo(null);

			JPanel zoneClient = (JPanel)getContentPane();
			zoneClient.add(ta);
			ta.setText(linebreak(skillManager.getInfo(skill)).replace("<br>", "\n"));
			ta.setEditable(false);
			this.setVisible(true);

			this.requestFocus();
			this.addFocusListener(new appFocusListener());

		}

		public class appFocusListener implements FocusListener{

			@Override
			public void focusGained(FocusEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void focusLost(FocusEvent e) {
				// TODO Auto-generated method stub
				help.this.dispose();
			}

		}
	}



}
