public class Main
{
	public static void main(String[] args) {
		
		int[]  a = {5,7,8,-2,3,12,7,18,20};
		int k = 7;
		int first = -1;
		int last = 0;
		for (int i = 0; i < a.length; i++) {
		    if (a[i] ==  k && first == -1) {
		        first = i;
		    }
		    else if (a[i] == k) {
		        last = i;
		    }
		}
		System.out.println(first + " " + last);
	}
}
