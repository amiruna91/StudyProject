package kr.co.jhta.di.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

public class FileOutput implements Output {

	private PrintWriter writer;
	private String directory;
	private String filename;

	public void setDirectory(String directory) {
		this.directory = directory;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public FileOutput() {}
	
	public FileOutput(String directory, String filename) {
		this.directory = directory;
		this.filename = filename;
	}
	
	private void createWriter() {
		try {
			File file = new File(directory, filename);
			writer = new PrintWriter(file, "utf-8");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}		
	}
	
	@Override
	public void write(String text) {
		if (writer == null) {
			createWriter();
		}		
		writer.println(text);
		writer.flush();
	}
}
