package scheduler;

public class OneDayEvent extends Event {

	public MyDate date;
	
	public OneDayEvent(String title, MyDate date) {
		super(title);
		this.date = date;
	}
	public String toString() {
		return title + ", " + date.toString();
	}
	
	@Override
	public boolean isRelevant(MyDate theDate) {
		return date.compareTo(theDate) == 0;
	}
	
	
	
}
