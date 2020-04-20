package myarraylist_;

import java.util.Arrays;

public class MyArrayList <T>{
	
	private static final int INIT_CAPACITY = 10;
	private T [] theData;
	private int n = 0;
	private int capacity = 0;
	
	public MyArrayList() {
		theData = (T []) new Object [INIT_CAPACITY];
		// theData = new T [INIT_CAPACITY];
		// 위의 코드는 그럴듯해보이지만 불가능하다.
		// new 명령어로 객체를 생성할 때 실존하지 않는 타입명이 타입자리에 들어가서는 안된다.
		// 따라서 오브젝트타입의 배열을 생성한 뒤에 T타입으로 변환해 주어야 한다.
	}
	
	public void add( int index , T anEntry ) {
		
		if(index<0||index>n) {
			throw new ArrayIndexOutOfBoundsException(index);
		}
		
		if(n >= capacity) {
			reallocate();
		}
		
		for(int i = n-1; i>=index; i--) 
			theData[i+1] = theData[i];
		theData[index] = anEntry;
		n++;
	}

	public void add( T anEntry ) {
		//		theData[n] = anEntry;
		//		n++;
		add(n,anEntry);
	}
	
	public int size() { //현재 MyArrayList에 저장되어 있는 데이터의 갯수를 리턴해주는 메서드
		return n;
	}
	
	public int indexOf( T anEntry ) {
		for( int i = 0; i < n; i++) {
			if (theData[i].equals(anEntry)) {
				return i;
			}
		}
		return -1;
	}
	
	public T get(int index) {
		
		if(index<0||index>=n) {
			throw new ArrayIndexOutOfBoundsException(index);
		}
		return theData[index];
	}
	
	public T set(int index, T newValue) {
		
		if(index<0||index>=n) {
			throw new ArrayIndexOutOfBoundsException(index);
		}
		T oldValue = theData[index];
		theData[index] = newValue;
		return oldValue;
	}
	
	//Mark! Study perfectly
	public T remove(int index) {
		if(index<0||index>=n) {
			throw new ArrayIndexOutOfBoundsException(index);
		}
		T returnValue = theData[index];
		for(int i = index + 1; i < n; i-- )
			theData[i-1] = theData[i];
		n--;
		return returnValue;
	}
	
	private void reallocate() {
		
		capacity *= 2;
		//		T[] tmp = (T[]) new Object [capacity];
		//		for(int i = 0; i < n; i++) {
		//			tmp[i] = theData[i];
		//		}
		//		theData = tmp;
		
		theData = Arrays.copyOf(theData,capacity);
	
	}
	
}
