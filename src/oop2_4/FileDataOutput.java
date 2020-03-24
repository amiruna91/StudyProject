package oop2_4;

import java.io.File;
import java.io.PrintWriter;

public class FileDataOutput extends DataOutput{

	String directory;
	String filename;
	
	FileDataOutput(String directory, String filename) {
		this.directory = directory;
		this.filename = filename;
	}
	
	@Override
	void output(String[] data) {
		try {
			File file = new File(directory, filename);
			PrintWriter writer = new PrintWriter(file);
			
			writer.println("------ 데이터 리스트 ------");
			
			for (int i = 0; i < data.length; i++) {
				writer.println("[" + (i + i)+ "]" + data[i]);
			}
			writer.println("------ 데이터 리스트 ------");
			
			writer.flush();
			writer.close();
		} catch (Exception e) {
			
		}
	}
}
