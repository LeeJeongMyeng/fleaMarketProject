package vo;

public class FFile {

	private String filename;
	private String filePath;
	
	public FFile() {
		// TODO Auto-generated constructor stub
	}
	
	public FFile(String filename, String filePath) {
		this.filename = filename;
		this.filePath = filePath;
	}

	public String getFilename() {
		return filename;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
}
