package genericScheduler;

public class MyDate {

	int year;
	int month;
	int day;
	
	public MyDate(int year, int month, int day) {
		
		this.year = year;
		this.month = month;
		this.day = day;
	}
	
	public int compareTo(MyDate d) {
		if( (year < d.year) || (year == d.year && month < d.month) || (year == d.year && month == d.month && day < d.day) )
			return -1;
					
		else if(year == d.year && month == d.month && day == d.day)
			return 0;
		else
			return 1;
					
	}

	@Override
	public String toString() {
		return year + "/" + month + "/" + day ;
	}
	
	
	
	
}
