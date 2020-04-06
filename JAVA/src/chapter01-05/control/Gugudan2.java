package control;

public class Gugudan2 {

	public static void main(String[] args) {
		
		for (int i = 1; i <= 9; i++) {
			for(int j = 2; j <= 8; j++) {
				System.out.print(j + " * " + i + " = " + j * i);
				System.out.print("\t");
			}
			System.out.println();
		}
	}
}
