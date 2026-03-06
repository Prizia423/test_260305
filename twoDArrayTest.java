package HomeWork_0305;

import java.util.Random;

public class twoDArrayTest {
	public static void main(String[] args) {
		int n[][] = new int[3][4];
		Random generator = new Random();
		int sum = 0;
		for (int i = 0; i < n.length; i++) {
			for (int j = 0; j < n[i].length; j++) {
				n[i][j] = generator.nextInt(10);
				System.out.print(n[i][j] + "\t");
				sum += n[i][j]; 
			}
			
			System.out.println();
		}
		System.out.println("합은 " + sum);
	}
}
