package control;

public class StarDemo5 {

	public static void main(String[] args) {
		/*
		 				**			i=1 공백4 별2
		 			   ****			i=2 공백3 별4
		 			  ******		i=3 공백2 별6
		 			 ********		i=4 공백1 별8
		 			**********		i=5 공백0 별10
		 		   	 ********		i=6 공백1 별8
		 		   	  ******		i=7 공백2 별6
		 		   	   ****			i=8 공백3 별4
		 		   	    **			i=9 공백4 별2
		 */
		
		for (int i = 1; i <= 9; i++) {
			int space = Math.abs(5-i);		//Math.abs()는 절대 값으 구하는거다.
			int star = 10 - space * 2;		//이와 같이 int space = (i <= 5) ? 5-i : i-5; 와 같다.
			
			for (int j = 0; j <= space; j++) {
				System.out.print(" ");
			}
			for (int k = 1; k <= star; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
}
