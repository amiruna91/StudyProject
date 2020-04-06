package oop2_12;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Note extends JFrame{
	
	JMenuBar menuBar = new JMenuBar();
	JMenu fileMenu = new JMenu("파일");
	JMenu editMenu = new JMenu("편집");
	JMenu helpMenu = new JMenu("도움말");
	JTextArea textArea = new JTextArea();
	
	JMenuItem newMenuItem = new JMenuItem("새 파일");
	JMenuItem openMenuItem = new JMenuItem("열기");
	JMenuItem saveMenuItem = new JMenuItem("저장하기");
	JMenuItem exitMenuItem = new JMenuItem("끝내기");
	
	// 새파일 메뉴 클릭시 실행될 익명객체
	public Note() {
		setLayout(new BorderLayout());
		
		ActionListener al1 = new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JOptionPane.showMessageDialog(null, "새파일을 엽니다.");
			}
		};
		
		JFileChooser chooser = new JFileChooser();
		
		// 열기 메뉴 클릭시 실행될 익명객체
		ActionListener al2 = new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				chooser.showOpenDialog(null);
			}
		};
		
		// 저장하기 클릭시 실행될 익명객체
		ActionListener al3 = (e) -> {
			chooser.showSaveDialog(null);
		};
		
		// 끝내기 클릭시 실행될 익명객체
		ActionListener al4 = (e) -> {
			System.exit(0);
		};
		
		// 각 메뉴아이템에 클릭시 실행될 메서드를 가지고 있는 익명객체 등록시키기
		newMenuItem.addActionListener(al1);
		openMenuItem.addActionListener(al2);
		saveMenuItem.addActionListener(al3);
		exitMenuItem.addActionListener(al4);
		
		
		fileMenu.add(newMenuItem);
		fileMenu.add(openMenuItem);
		fileMenu.add(saveMenuItem);
		fileMenu.addSeparator();
		fileMenu.add(exitMenuItem);
		
		menuBar.add(fileMenu);
		menuBar.add(editMenu);
		menuBar.add(helpMenu);
		
		setJMenuBar(menuBar);
		
		add(new JScrollPane(textArea), BorderLayout.CENTER);
		
		setBounds(100, 100, 600, 400);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	public static void main(String[] args) {
		new Note();
	}
}
