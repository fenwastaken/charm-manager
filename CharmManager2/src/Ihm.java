import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.Vector;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;


public class Ihm extends JFrame {

	//global
	JPanel zoneClient;
	JPanel panTopTop = new JPanel();
	JPanel panTop = new JPanel();
	JPanel panMid = new JPanel();

	static JTextField tfSaisie = new JTextField();
	static JComboBox<String> cbSlots = new JComboBox<String>();

	static JComboBox<String> cbSkill1 = new JComboBox<String>();
	static JComboBox<String> cbSkill2 = new JComboBox<String>();
	static JComboBox<String> cbNbr1 = new JComboBox<String>();
	static JComboBox<String> cbNbr2 = new JComboBox<String>();
	static JComboBox<String> cbSlots2 = new JComboBox<String>();
	static JComboBox<String> cbLang = new JComboBox<String>();
	static JComboBox<String> cbSorter = new JComboBox<String>();

	//static JComboBox<String> cbRarity = new JComboBox<String>();

	static JCheckBox cbFav = new JCheckBox("Only Fav");
	//static JCheckBox cbSort = new JCheckBox("Sort by Skill2");

	static JPanel panBot = new JPanel();
	JScrollPane spanBot = new JScrollPane(panBot);

	static JButton btExport = new JButton("Export");
	static JButton btAdd = new JButton(new ImageIcon("iconAdd.gif"));
	JButton btDel = new JButton("Del");

	static JLabel labCharms = new JLabel();

	static int currentNumber = 0;

	public Ihm(){

		this.setTitle("Charm Manager V0.1");
		this.setSize(700, 600);
		this.setResizable(false);
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
		initControles();
	}

	public void initControles(){

		cbLang.addItem("FR");	
		cbLang.addItem("EN");

		feedSkills();

		zoneClient = (JPanel)getContentPane();

		zoneClient.setLayout(new BoxLayout(zoneClient, BoxLayout.Y_AXIS));
		panBot.setLayout(new BoxLayout(panBot, BoxLayout.Y_AXIS));


		cbSorter.addItem("alpha skill1");
		cbSorter.addItem("alpha skill2");
		cbSorter.addItem("game skill1");
		cbSorter.addItem("game skill2");


		panTopTop.add(tfSaisie);
		panTopTop.add(btDel);
		panTop.add(cbLang);
		panTop.add(cbSlots);
		panTop.add(cbFav);
		panTop.add(cbSorter);
		panTop.add(labCharms);
		//panTop.add(Box.createRigidArea(new Dimension(40, 20)));
		panTop.add(btExport);


		JLabel lab1 = new JLabel("Skill 1: ");
		JLabel lab2 = new JLabel("Skill 2: ");
		JLabel lab3 = new JLabel("Slots: ");
		//JLabel lab4 = new JLabel("Rarity: ");


		panMid.add(lab1);
		panMid.add(cbSkill1);
		panMid.add(cbNbr1);
		panMid.add(lab2);
		panMid.add(cbSkill2);
		panMid.add(cbNbr2);
		panMid.add(lab3);
		panMid.add(cbSlots2);
		//panMid.add(lab4);
		//panMid.add(cbRarity);
		panMid.add(btAdd);

		cbSlots.addItem("All");

		for(int i = -10 ; i < 16; i++){
			cbNbr1.addItem("" + i);
			cbNbr2.addItem("" + i);
			if(i > -1 && i < 4){
				cbSlots.addItem("" + i);
				cbSlots2.addItem("" + i);
			}
			if(i < 11 && i > 0){
				//cbRarity.addItem("" + i);
			}
		}

		cbNbr1.setSelectedIndex(10);
		cbNbr2.setSelectedIndex(10);

		tfSaisie.setPreferredSize(new Dimension(200, 28));
		labCharms.setPreferredSize(new Dimension (80, 25));

		panTopTop.setMaximumSize(new Dimension(900, 50));
		panTop.setMaximumSize(new Dimension(900, 50));
		panMid.setMaximumSize(new Dimension(900, 50));


		zoneClient.add(panTopTop);
		zoneClient.add(panTop);
		zoneClient.add(panMid);
		zoneClient.add(spanBot);

		spanBot.getVerticalScrollBar().setUnitIncrement(8);

		btAdd.addActionListener(new appActionListener());
		btAdd.addKeyListener(new appKeyListener());
		btDel.addActionListener(new appActionListener());
		btExport.addActionListener(new appActionListener());

		tfSaisie.addKeyListener(new appKeyListener());

		tfSaisie.addMouseListener(new appMouseListener());

		cbSkill1.addKeyListener(new appKeyListener());
		cbSkill2.addKeyListener(new appKeyListener());
		cbNbr1.addKeyListener(new appKeyListener());
		cbNbr2.addKeyListener(new appKeyListener());
		cbFav.addItemListener(new appItemListener());
		cbSorter.addItemListener(new appItemListener());
		cbSlots.addItemListener(new appItemListener());
		cbSlots2.addKeyListener(new appKeyListener());

		cbSkill1.addItemListener(new appItemListener());
		cbSkill2.addItemListener(new appItemListener());
		cbSlots2.addItemListener(new appItemListener());
		cbNbr1.addItemListener(new appItemListener());
		cbNbr2.addItemListener(new appItemListener());
		cbLang.addItemListener(new appItemListener());

		displayAny();

		if(skillManager.findDuplicate()){
			labCharms.setForeground(Color.RED);
		}

	}

	public class appMouseListener implements MouseListener{

		@Override
		public void mouseClicked(MouseEvent e) {
			// TODO Auto-generated method stub
			if(e.getSource() == tfSaisie && e.getButton() == MouseEvent.BUTTON3){
				Athena at = new Athena();
				at.setTitle("Skills");
				Vector<String> vec = skillManager.searchSkill(tfSaisie.getText().toLowerCase());
				String ret = "";
				for(String str : vec){
					ret += str + "\n";
				}

				at.ta.setText(ret);
				int height = 50 + (30 * vec.size());

				if(height > 799){
					height = 800;
				}

				at.setSize(new Dimension(1000, height));
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

	public class appItemListener implements ItemListener{

		@Override
		public void itemStateChanged(ItemEvent e) {
			// TODO Auto-generated method stub
			if(e.getSource()  == cbFav){
				//cbSlots.setSelectedItem("All");
				displayAny();
			}

			if(e.getSource()  == cbSorter){
				//cbSlots.setSelectedItem("All");
				displayAny();
			}

			if(e.getSource() == cbSlots){
				displayAny();
			}

			if(e.getSource() == cbLang){
				displayAny();
				feedSkills();
			}

			if(e.getSource() == cbSkill1 || e.getSource() == cbSkill2 || e.getSource() == cbNbr1 || e.getSource() == cbNbr2 || e.getSource() ==  cbSlots2){
				if(e.getStateChange() == e.DESELECTED){
					System.out.println("skill1 " + (cbSkill1.getSelectedIndex() + 1) + "/" + cbSkill1.getItemCount());
					checkDuplicate();
				}
			}
		}

	}

	public class appKeyListener implements KeyListener{

		@Override
		public void keyTyped(KeyEvent e) {
			// TODO Auto-generated method stub

		}

		@Override
		public void keyPressed(KeyEvent e) {
			// TODO Auto-generated method stub

		}

		@Override
		public void keyReleased(KeyEvent e) {
			// TODO Auto-generated method stub
			if(cbSkill1.hasFocus() && e.getKeyCode() == KeyEvent.VK_DELETE){
				cbSkill1.setSelectedIndex(0);
				cbNbr1.setSelectedIndex(10);
			}

			if(cbSkill2.hasFocus() && e.getKeyCode() == KeyEvent.VK_DELETE){
				cbSkill2.setSelectedIndex(0);
				cbNbr2.setSelectedIndex(10);
			}

			if(cbNbr1.hasFocus() && e.getKeyCode() == KeyEvent.VK_DELETE){
				cbNbr1.setSelectedIndex(10);
			}

			if(cbNbr2.hasFocus() && e.getKeyCode() == KeyEvent.VK_DELETE){
				cbNbr2.setSelectedIndex(10);
			}

			if(cbSlots2.hasFocus() && e.getKeyCode() == KeyEvent.VK_DELETE){
				cbSlots2.setSelectedIndex(0);
			}

			if(btAdd.hasFocus() && e.getKeyCode() == KeyEvent.VK_ENTER){
				addCharm();
				cbSkill1.requestFocus();
				displayAny();
			}

			if(e.getSource() == tfSaisie){
				displayAny();
			}
		}

	}

	public class appActionListener implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			if(e.getSource() == btAdd){
				addCharm();
				displayAny();
			}

			if(e.getSource() == btDel){
				tfSaisie.setText("");
				displayAny();
			}

			if(e.getSource() == btExport){
				Athena ath = new Athena();
			}
		}

	}

	public void searchByValue(int value){
		skillManager.searchByValue( value, cbFav.isSelected(), cbSlots.getSelectedIndex());
		displayAny();
	}

	public static boolean isNumeric(String s) {  
		return s.matches("[-+]?\\d*\\.?\\d+");  
	}

	public void addCharm(){
		//int rarity = Integer.parseInt(cbRarity.getSelectedItem().toString());
		int rarity = 10;
		String skill1 = cbSkill1.getSelectedItem().toString();
		int value1 = Integer.parseInt(cbNbr1.getSelectedItem().toString());
		String skill2 = cbSkill2.getSelectedItem().toString();
		int value2 = Integer.parseInt(cbNbr2.getSelectedItem().toString());
		int slots = Integer.parseInt(cbSlots2.getSelectedItem().toString());

		if(skill1.length() < 1){
			value1 = 0;
		}

		if(skill2.length() < 1){
			value2 = 0;
		}


		if((value1 == 0 && value2 == 0) || (skill1.length() < 1 && skill2.length() < 1)){
			System.out.println("nope");
		}
		else{
			skillManager.addCharm(rarity, skill1, value1, skill2, value2, slots);
			System.out.println("beep");
		}

	}


	public static void displayAny(){
		if(tfSaisie.getText().isEmpty()){
			displayList();
		}
		else if(isNumeric(tfSaisie.getText())){
		displayByValue();	
		}
		else{
			displaySearch();
		}
	}

	public static void displayByValue(){
		int withSlots;
		if(!cbSlots.getSelectedItem().equals("All")){
			withSlots = Integer.parseInt(cbSlots.getSelectedItem().toString());
		}
		else{
			withSlots = 4;
		}

		panBot.removeAll();
		int value = Integer.parseInt(tfSaisie.getText());
		Vector<Skill> skill = skillManager.searchByValue(value, cbFav.isSelected(), withSlots);
		int i = 0;
		int page = 0;
		for(Skill skl : skill){
			i++;
			Line line = new Line(skl.getID(), skl.getSkill1(), skl.getValue1(), skl.getSkill2(), skl.getValue2(), skl.getSlots(), skl.getRarity(), skl.isFav(), skl.getPosition());
			panBot.add(line);
		}
		panBot.repaint();
		panBot.revalidate();
		currentNumber = i;
		updateTotal();
	}
	
	public static void displayList(){
		int withSlots;
		if(!cbSlots.getSelectedItem().equals("All")){
			withSlots = Integer.parseInt(cbSlots.getSelectedItem().toString());
		}
		else{
			withSlots = 4;
		}

		panBot.removeAll();
		Vector<Skill> skill = skillManager.getAllCharms(cbFav.isSelected(), withSlots);
		int i = 0;
		int page = 0;
		for(Skill skl : skill){
			i++;
			Line line = new Line(skl.getID(), skl.getSkill1(), skl.getValue1(), skl.getSkill2(), skl.getValue2(), skl.getSlots(), skl.getRarity(), skl.isFav(), skl.getPosition());
			panBot.add(line);
		}
		panBot.repaint();
		panBot.revalidate();
		currentNumber = i;
		updateTotal();
	}

	public static void displaySearch(){
		panBot.removeAll();
		Vector<Skill> skill = skillManager.searchCharm("%" + tfSaisie.getText() + "%");
		int i = 0;
		for(Skill skl : skill){
			i++;
			Line line = new Line(skl.getID(), skl.getSkill1(), skl.getValue1(), skl.getSkill2(), skl.getValue2(), skl.getSlots(), skl.getRarity(), skl.isFav(), skl.getPosition());
			panBot.add(line);
		}
		panBot.repaint();
		panBot.revalidate();
		currentNumber = i;
		updateTotal();
	}

	public static void updateTotal(){
		int total = skillManager.countCharms();
		labCharms.setText("Total: " + currentNumber + "/" + total);
		labCharms.repaint();
		labCharms.revalidate();
	}

	public static void checkDuplicate(){
		if((cbSkill1.getSelectedItem() != null && cbSkill2.getSelectedItem() != null)){
			String skill1 = cbSkill1.getSelectedItem().toString();
			String skill2 = cbSkill2.getSelectedItem().toString();
			int value1 = Integer.parseInt(cbNbr1.getSelectedItem().toString());
			int value2 = Integer.parseInt(cbNbr2.getSelectedItem().toString());
			int slots = Integer.parseInt(cbSlots2.getSelectedItem().toString());

			System.out.println("Dup: " + skill1 + ", " + value1 + " | " + skill2 + ", " + value2 + " | " + slots + " :: " + skillManager.exists(skill1, value1, skill2, value2, slots));

			if(skillManager.exists(skill1, value1, skill2, value2, slots)){
				btAdd.setEnabled(false);
			}
			else{
				btAdd.setEnabled(true);
			}
		}
	}

	public void feedSkills(){

		cbSkill1.removeAllItems();
		cbSkill2.removeAllItems();

		Vector<String> vListeSkills = skillManager.getSkills();

		for(String str : vListeSkills){

			if(str == null){
				cbSkill1.addItem("");
				cbSkill2.addItem("");
			}
			else{
				cbSkill1.addItem(str);
				cbSkill2.addItem(str);
			}


		}

	}

}
