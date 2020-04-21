package ws3.java2.controller;

import java.util.ArrayList;
import java.util.Collections;

import ws3.java2.entity.Airplane;
import ws3.java2.entity.Car;
import ws3.java2.entity.Ship;
import ws3.java2.entity.Vehicle;

public class VehicleManager {
	//�Ʒ� �ڵ�� �迭�� �����ϴ� ������ ������ ���̴�.
	//ArrayList�� �����ϵ��� ���ο� ������ �����Ͻÿ�.(��������  vehicleList)
	ArrayList<Vehicle> vehicleList = new ArrayList<>();
	
	public VehicleManager() {
		//�Ʒ� �ڵ�� �迭�� �̿��ϵ��� �ۼ��Ǿ���.
		//ArrayList�� ����ϵ��� �����Ͻÿ�.
		
		
//		ArrayList<? extends Vehicle> vehicleList1 = new ArrayList<>();
		
//		vehicleArr = new Vehicle[7];
		
		vehicleList.add(new Airplane("����747", 1300, 300, 4));
		vehicleList.add(new Airplane("F-16", 1600, 1, 1));
		vehicleList.add(new Car("�ҳ�Ÿ3", 180, 5, 10));
		vehicleList.add(new Car("Ƽ��", 130, 4, 15));
		vehicleList.add(new Car("��Ÿ����", 150, 10, 11));
		vehicleList.add(new Ship("ũ����2", 30, 400, 35000));
		vehicleList.add(new Ship("��ƿ����", 25, 150, 15000));
	}
	
	public void displayVehicles(String title) {
		//�Ʒ� �ڵ�� �迭�� ����Ű�� ��� ��ü�� ������ ����ϵ��� �ۼ��Ǿ���.
		//ArrayList�� vehicleList�� ��� ��� ��ü�� ����ϵ��� �����Ͻÿ�.
		
		System.out.println(title);
		
		for(Vehicle v : vehicleList) {
			v.displayInfo();
		}
		
//		for (int inx = 0 ; inx < vehicleArr.length ; inx++) {
//			vehicleArr[inx].displayInfo();
//			vehicleArr[inx].setAvailable(true);
//		}

		System.out.println();
	}
	
	public void sortByModelName() {
		//�Ʒ� �ڵ�� �迭�� ���ؼ� ������ �����ϴ� ���̴�.
		//ArrayList�� vehicleList�� ���ؼ� ������ �����ϴ� �ڵ�� ��ȯ�Ͻÿ�.
		Collections.sort(vehicleList);
		
		
	}
}

