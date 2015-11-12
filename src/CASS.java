/* 
 * CASS.java
 */
import java.util.*;

public class CASS {
	public static void main ( String args[] ) {
		HighestCredit();
	}

	public static String[] HighestCredit(){
		//Scanner for user input
		Scanner sc = new Scanner( System.in );
		
		//check if user is finished inputting
		Boolean not_finish = true;
		
		//String array that contains the passed and failed subjects
		ArrayList<String> passed = new ArrayList<String>();
		
		//Ask for Prev Course and store it in a variable
		System.out.println("Enter Prev Course: ");
		String prev_course = sc.nextLine();
		
		//Ask for courses passed
		System.out.println("Enter Courses Passed: \nNote: Enter \"Done\" when you're done.");

		while( not_finish ) {
			String pass = sc.nextLine();
			if( pass.equalsIgnoreCase("Done")) {
				not_finish = false;
			} else {
				passed.add( pass );
			}
		}
		
		//Array for the list of all subjects
		ArrayList<String> polsci_subjects = new ArrayList<String>( Arrays.asList( "ENG1", "HUM1", "FIL1", "POLSCI4", "PSYCH1", "HIST1", "MATH1", "PE1", "NSTP1", "ENG2", "MATH31", "POLSCI4", "ECON1", "LIT1", "PSYCH1", "PE2", "NSTP2", "LIT1N", "HIST2", "SOCIO1", "HIST5", "BIO1", "PHILO2", "PE3", "POLSCI100", "NATSCI1", "FIL3", "IT100", "ENG5", "HUM1", "PE4", "POLSCI110", "POLSCI120", "POLSCI130", "POLSCI140", "POLSCI150", "FOREIGNLANG1", "POLSCI111", "POLSCI121", "POLSCI198",  "POLSCIELECT1", "POLSCIELECT2", "POLSCIELECT3", "POLSCIELECT4", "POLSCIELECT5" ) );
		ArrayList<String> eng_subjects    = new ArrayList<String>( Arrays.asList( "ENG1", "HUM1", "FIL1", "POLSCI4", "PSYCH1", "HIST1", "MATH1", "PE1", "NSTP1", "ENG2", "ENG3", "ENG4", "FIL3", "HIST3", "PHILIO1", "SOCIO1", "MATH31", "PE2", "NSTP2", "LIT1", "ENG5", "ENG7", "ENG25", "HIST5", "BIO1", "ECON1", "PE3", "LIT2", "ENG8", "ENG30", "IT100", "NATSCI1", "COGNATE1", "PE4", "ENG40", "ENG50", "ENG55", "ENG60", "ENG80", "ENG85", "ENGELECT1", "ENG35", "ENG45", "ENG65", "ENG70", "ENG90", "COGNATE2", "ENGELECT2", "ENG198") );
		ArrayList<String> fil_subjects    = new ArrayList<String>( Arrays.asList( "LIT1", "FIL1", "ENG1", "ENG3", "HIST1", "MATH1", "PE1", "NSTP1", "FIL2", "LIT2", "ENG2", "HUM1", "HIST3", "MATH31", "PE2", "NSTP2", "FIL3", "HIST5", "SOCIO1", "POLSCI2", "PHILO2", "BIO1", "PE3", "FIL51", "FIL52", "FIL53", "NATSCI1", "CSC1", "PSYCH1", "PE4", "FIL54", "MAJ1", "MAJ2", "MAJ3", "MAJ4", "COGNATE1", "MAJ5", "MAJ6", "MAJ7", "MAJ8", "COGNATE2", "COGNATE3", "FILELECT1", "MAJ9", "MAJ10", "MAJ11", "COGNATE5", "COGNATE4", "FILELECT2", "FILELECT3"  ) );
		ArrayList<String> socio_subjects  = new ArrayList<String>( Arrays.asList( "ENG1", "ENG3", "MATH1", "HIST1", "SOCIO1", "FIL1", "PE1", "NSTP1", "ENG2", "PSYCH1", "ANTHRO1", "HIST3", "MATH14", "LIT1", "PE2", "NSTP2", "NATSCI1", "SOCIO2", "SOCIO3", "IT100", "LIT2", "MATH31", "HUM1", "PE3", "BIO1", "ECON1", "PHILO1", "ENG8", "HIST5", "POLSCI4", "SOCIO116", "PE4", "SOCIO110", "SOCIO112", "SOCIO118", "SOCIO196", "ECON2", "SOCIO106", "SOCIO120", "SOCIO128", "SOCIO131", "SOCIO198", "SOCIOFORLANG", "SOCIO100", "SOCIO124", "SOCIO126", "SOCIO148", "SOCIOELEC1", "SOCIOELEC2", "SOCIO199", "SOCIOELEC3"  ) );
		ArrayList<String> hist_subjects   = new ArrayList<String>( Arrays.asList( "ENG1", "ENG3", "FIL1", "POLSCI2", "HIST1", "MATH1",  "PE1", "NSTP1", "ENG2", "FIL5", "HIST3", "HIST5", "HUM1", "MATH31", "PE2", "NSTP2", "ENG4", "NATSCI1", "HIST60", "HIST50", "SPAN1", "PE3", "ENG8", "BIO1", "HIST70", "HIST80", "SPAN2", "PSYCH1", "PE4", "HIST106", "HIST120", "HIST121", "HIST122", "HIST125", "HIST128", "HIST141", "HIST142", "HIST144", "PHILO2", "HISTELECT2", "HIST145", "HIST146", "HIST160", "HIST161", "HIST198", "HISTELECT3", "HIST162", "HIST199", "HISTELECT4" ) );
		ArrayList<String> psych_subjects  = new ArrayList<String>( Arrays.asList( "ENG1", "HUM1", "FIL1", "POLSCI4", "PSYCH1", "HIST2", "SOCIO1", "HIST5", "BIO1", "PHILO2", "PE3", "POLSCI100", "NATSCI1", "FIL3", "IT100", "ENG5", "HUM1", "PE4", "POLSCI110", "POLSCI120", "POLSCI130", "POLSCI140", "POLSCI150", "FOREIGNLANG1", "POLSCI111", "POLSCI121", "POLSCI131", "POLSCI141", "POLSCI151", "POLSCIELECT1", "POLSCIELECT2", "POLSCIELECT3", "POLSCIELECT4" ) );
		
		//Get the matching scores of each departments
		/*
		double eng    = courses_taken( passed, eng_subjects ) ;
		double fil    = courses_taken( passed, fil_subjects );
		double socio  = courses_taken( passed, socio_subjects );
		double hist   = courses_taken( passed, hist_subjects ) ;
		double polsci = courses_taken( passed, polsci_subjects ) ;
		double psych  = courses_taken( passed, psych_subjects ) ;
		*/
		int eng_match    = count_match( passed, eng_subjects ) * 3;
		int fil_match    = count_match( passed, fil_subjects ) * 3;
		int socio_match  = count_match( passed, socio_subjects ) * 3;
		int hist_match   = count_match( passed, hist_subjects ) * 3;
		int polsci_match = count_match( passed, polsci_subjects ) * 3;
		int psych_match  = count_match( passed, psych_subjects ) * 3;
		
		/*
		System.out.println( eng_match );
		System.out.println( fil_match );
		System.out.println( socio_match );
		System.out.println( hist_match );
		System.out.println( polsci_match );
		System.out.println( psych_match );
		*/
		
		ArrayList<Integer> units = new ArrayList<Integer>();
		units.add( eng_match );
		units.add( hist_match );
		units.add( socio_match );
		units.add( polsci_match );
		units.add( fil_match );
		units.add( psych_match );
		
		/* Sort units from lowest to greatest */
		Collections.sort( units );
		
		/* Get the last element of the list == highest */
		int highest = units.get(5);
		
		/* Make two ArrayList to store course and units */
		ArrayList<String> highest_course = new ArrayList<String>();
		
		if( highest != 0 ) {
			if( highest == eng_match && !prev_course.equalsIgnoreCase("AB ENGLISH") ) {
				highest_course.add( "AB ENGLISH" );
			}
			if( highest == fil_match && !prev_course.equalsIgnoreCase("AB FILIPINO") ) {
				highest_course.add( "AB FILIPINO" );
			}
			if( highest == hist_match && !prev_course.equalsIgnoreCase("AB HISTORY") ) {
				highest_course.add( "AB HISTORY" );
			}
			if( highest == socio_match && !prev_course.equalsIgnoreCase("AB SOCIOLOGY") ){
				highest_course.add( "AB SOCIOLOGY" );
			}
			if( highest == polsci_match && !prev_course.equalsIgnoreCase("AB POLITICAL SCIENCE") ) {
				highest_course.add( "AB POLITICAL SCIENCE" );
			}
			if( highest == psych_match && !prev_course.equalsIgnoreCase("AB PSYCHOLOGY") ) {
				highest_course.add( "AB PYSCHOLOGY" );
			}
			// insert the highest number of units to the end of the array
			highest_course.add( Integer.toString( highest ) );
		} else {
			HighestCredit();
		}
		
		/* Conver ArrayString -> Array */
		String[] course_arr = highest_course.toArray(new String[highest_course.size()]);
		
		for( String s : course_arr )
			System.out.println( s );
		
		
		
		//PRINT each scores
		/*
		System.out.println( "Eng: " + eng );
		System.out.println( "Fil: " + fil );
		System.out.println( "Socio: " + socio );
		System.out.println( "Hist: " + hist );
		System.out.println( "Polsci: " + polsci );
		System.out.println( "Psych: " + psych );
		*/
		
		//get the probability of each courses
		//ArrayList<String> probability = sort_prob( eng, hist, polsci, psych, socio, fil );
		
		
		//check if probability is empty
		/*
		if( ! probability.isEmpty() ) {
			//check if previous course is has the highest probability
			if( probability.get( 0 ).equalsIgnoreCase(prev_course)) {
				course[0] = probability.get( 1 );
			} else if( probability.get( 0 ).equals( probability.get( 1 ) ) ) {
				course[0] = probability.get( 0 );
				course[1] = probability.get( 1 );
			} else {
				course[0] = probability.get( 0 );
			}
		}
		*/
		//System.out.println("\n\nTake: " + course );
		
		
		return course_arr;
	}
	
	
	/**
	 * @param input
	 * @param subject_list
	 * @return intersection
	 */
	public static ArrayList<String> get_match( ArrayList<String> input, ArrayList<String> subject_list ) {
		ArrayList<String> match = new ArrayList<String>( input );
		match.retainAll(subject_list);
		return match;
	}
	
	public static int count_match( ArrayList<String> input, ArrayList<String> subject_list ) {
		//compare input and subject_list
		ArrayList<String> match = get_match( input, subject_list );
		
		//count all the elements from match_list
		int count_match = match.size();
		
		return count_match;
	}
	
	/**		
	 * @param input
	 * @param subject_list
	 * @return courses taken percentage
	 */
	/*
	public static double courses_taken( ArrayList<String> input, ArrayList<String> subject_list ) {
		//compare input and subject_list
		ArrayList<String> match = get_match( input, subject_list );
		
		//count all the elements from match_list
		double count_match = match.size();
		
		//count all the elements from subject_list
		double count_subject = subject_list.size();
		
		double temp = count_match / count_subject;
		double taken = 1 - temp;
		
		return taken * 100;
	}
	*/
	
	
	/**
	 * @param eng
	 * @param hist
	 * @param polsci
	 * @param psych
	 * @param socio
	 * @param fil
	 * @return ArrayList of sorted courses
	 */
	/*
	public static ArrayList<String> sort_prob( double eng, double hist, double polsci, double psych, double socio, double fil ) {
		
		ArrayList<String> courses = new ArrayList<String>();
		
		HashMap<String, Double> course_score = new HashMap<String, Double>();
		course_score.put( "AB ENGLISH", eng );
		course_score.put( "AB HISTORY", hist );
		course_score.put( "AB POLITICAL SCIENCE", polsci );
		course_score.put( "AB PSYCHOLOGY", psych );
		course_score.put( "AB SOCIOLOGY", socio );
		course_score.put( "AB FILIPINO", fil );
		
		TreeMap<String, Double> sortedMap = SortByValue( course_score );
		Set<String> keys = sortedMap.keySet();
		for(String key: keys){
			courses.add(key);
		}
        
		//System.out.println("\n\nsortedMap: " + sortedMap );
		//System.out.println("ArrayList: " + courses );

		return courses;
	}
	*/
	
	/**
	 * @param map
	 * @return sortedMap
	 */
	/*
	public static TreeMap<String, Double> SortByValue ( HashMap<String, Double> map ) {
		ValueComparator vc =  new ValueComparator( map );
		TreeMap<String, Double> sortedMap = new TreeMap<String, Double>( vc );
		sortedMap.putAll( map );
		return sortedMap;
	}
	*/
}

/**
 * 
 * Compares the value of the HashMap
 *
 */
/*
class ValueComparator implements Comparator<String> {
	 
    Map<String, Double> map;
 
    public ValueComparator( Map<String, Double> base ) {
        this.map = base;
    }
 
    public int compare( String a, String b ) {
        if ( map.get( a ) <= map.get( b ) ) {
            return -1;
        } else {
            return 1;
        } // returning 0 would merge keys 
    }
}
*/