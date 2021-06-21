package sample09;

import java.io.FileWriter;
import java.io.IOException;


public class FileOutputer implements Outputer {
	private String fileName;

	public void setFileName(String fileName) {
		this.fileName = fileName;	// fileName="test.txt"
	}

	public void output(String msg) {
		try {
			FileWriter fw = new FileWriter(fileName);
			fw.write(msg);
			fw.close();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
}