package scheduler;

public class DeadlinedEvent extends Event{

	public MyDate deadline;
	
	public DeadlinedEvent(String title, MyDate deadline) {
	
		super(title);
		this.deadline = deadline;
	}

	@Override
	public String toString() {
		return title + ", ~ " + deadline.toString();
	}

	@Override
	public boolean isRelevant(MyDate theDate) {
		if(deadline.compareTo(theDate)>=0)
			return true;
		return false;
	}
	
	
	
	
	
}
