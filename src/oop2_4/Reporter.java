package oop2_4;

public class Reporter {
	
	String[] data;
	DataOutput outputer;
	
	// DataOutput류 객체를 전달받아서 멤버변수 outputer에 담은 메서드
	void setOutputer(DataOutput dataOutput) {
		this.outputer = dataOutput;
	}
	
	void setData(String[] data) {
		this.data = data;
	}
	
	void reporting() {
		outputer.output(data);
	}
}
