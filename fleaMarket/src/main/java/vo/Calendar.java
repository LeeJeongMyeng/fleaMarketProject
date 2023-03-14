package vo;
//springweb.z01_vo.Calendar
public class Calendar {

	   private String     id;
	   private String  title;
	   private String  start;
       private String  end;	      
       private String  writer;
	   private String  content; 
	   private String  backgroundColor;
	   private String  textColor;
	   private boolean allDay; 
	   private String  urllink;
       private String address;
       
       
	   
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public String getStart() {
		return start;
	}
	public String getEnd() {
		return end;
	}
	public String getWriter() {
		return writer;
	}
	public String getContent() {
		return content;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public boolean isAllDay() {
		return allDay;
	}



	public void setTitle(String title) {
		this.title = title;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	public String getUrllink() {
		return urllink;
	}
	public void setUrllink(String urllink) {
		this.urllink = urllink;
	}


}
