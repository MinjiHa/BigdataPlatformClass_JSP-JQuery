package scheduler;

import java.util.Scanner;

public class Scheduler {
	
	private int capacity = 3;
	Event [] myDays = new Event[capacity];
	public int n = 0;
	Scanner kb;
	
	public void processCommend() {
		kb = new Scanner(System.in);
		
		for(;;) {
		System.out.print("$");
		String cmd = kb.next();
		
		if(cmd.equalsIgnoreCase("add")){
			String cmd2 = kb.next();
			if(cmd2.equalsIgnoreCase("oneday")) {
				addOneday();
			}
			else if(cmd2.equalsIgnoreCase("duration")) {
				addDuration();
			}
			else if(cmd2.equalsIgnoreCase("deadline")){
				addDeadline();
			}
			
		}
		else if(cmd.equalsIgnoreCase("list")) {
			listSchedule();
		}
		else if(cmd.equalsIgnoreCase("show")) {
			showSchedule();
		}
		else if(cmd.equalsIgnoreCase("exit"))
			break;
		
		
		}
		kb.close();
	}
	


	private void showSchedule() {
		String dateString = kb.next();
		MyDate theDate = parsingDate(dateString);
		for(int i = 0; i < n; i++) {
		if(myDays[i].isRelevant(theDate)) {
			System.out.println(myDays[i].toString());
		}
		}
	}

	private void listSchedule() {
		
		for(int i = 0; i < n; i++) {
		System.out.println(myDays[i].toString());
		}
		
	}

	private void addOneday() {
		
		if(n > capacity) {
			rellocate();
		}		
		System.out.print("  When : ");
		String dateString = kb.next();
		System.out.print("  Title : ");
		String title = kb.next();
		
		MyDate date = parsingDate(dateString);
		OneDayEvent ev = new OneDayEvent(title,date);
		myDays[n++] = ev;
	}

	private MyDate parsingDate(String dateString) {
		
		String [] tokens = dateString.split("/");		
		int year = Integer.parseInt(tokens[0]);
		int month = Integer.parseInt(tokens[1]);
		int day = Integer.parseInt(tokens[2]);		
		MyDate d = new MyDate(year,month,day);		
		return d;
	}



	private void addDuration() {
		
		if(n > capacity) {
			rellocate();
		}
		
		System.out.print("  Begin : ");
		String beginString = kb.next();
		System.out.print("  End : ");
		String endString = kb.next();
		System.out.print("  Title : ");
		String title = kb.next();
		
		MyDate begin = parsingDate(beginString);
		MyDate end = parsingDate(endString);
		DurationEvent ev = new DurationEvent(title,begin,end);
		myDays[n++] = ev;
		
	}



	private void addDeadline() {
		
		if(n > capacity) {
			rellocate();
		}
		
		System.out.print("  Deadline Point : ");
		String dateString = kb.next();
		System.out.print("  Title : ");
		String title = kb.next();
		
		MyDate date = parsingDate(dateString);
		DeadlinedEvent ev = new DeadlinedEvent(title,date);
		myDays[n++] = ev;
		
	}
	
	private void rellocate() {
		
		Event [] tmpArray = new Event[capacity*2];
		for(int i = 0; i<n; i++) {
			tmpArray[i] = myDays[i];
		}
		myDays = tmpArray;
		capacity*=2;
		
	}



	public static void main(String[] args) {
		
		Scheduler app = new Scheduler();
		app.processCommend();

	}

}
