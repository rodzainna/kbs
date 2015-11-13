/* 
 * CASS.java
 */
import java.util.*;

public class scanner {
	public static void main ( String args[] ) {
	
	}

	public String HighestCredit(){
		//Scanner for user input
		Scanner sc = new Scanner( System.in );
		System.out.print("INPUT: ");
		String prev_course = sc.nextLine();
		return prev_course;
    }
	
	public String[] HighestCredits(){
		//Scanner for user input
		String[] copyFrom = { "AB FILIPIN0", "AB ENGLISH", "AB HISTORY" };
		ArrayList<String> polsci_subjects = new ArrayList<String>( Arrays.asList( "ENG1", "HUM1", "FIL1"));
		return copyFrom;
    }
}
