public with sharing class EditDistanceCalculator 
{
    @TestVisible
    private static Integer calculateEditDistance( String str1, String str2, Integer m, Integer n ) //NOPMD -  Have to use long parameter here
    {
		Contract.requires( ( str1 != null ), 'calculateEditDistance called with null string 1' );

        Contract.requires( ( str2 != null ), 'calculateEditDistance called with null string 2' );

        Contract.requires( ( m != null ), 'calculateEditDistance called with null length of string 1' );

        Contract.requires( ( n!= null ), 'calculateEditDistance called with null length of string 2' );

        if ( m == 0 )  // if str1 is empty - we will have to insert all values to str2 i.e insert operations = str2.length()
        {
           return n; 
        }

        if ( n == 0 ) // if str2 is empty - we will have to delete all values from str2 i.e delete operations = str1.length()
        {
            return m;
        }

        if ( str1.charAt( m - 1 ) == str2.charAt( n - 1 ) ) //if characters match 
        {
           return calculateEditDistance( str1, str2, m - 1, n - 1 );  // no change to edit distance: edit distance = previous
        }

        //the take the minimum value from these three indexes and add one i.e : minimum operations needed so far + 1 (plus one represents need for another operation detected on this step hence incrementing the editDistance)

        //these indexes reflect x,y coordinates of levenshtein distance table/graph 

        //moving from current x,y position

        return Math.min( Math.min( calculateEditDistance( str1, str2, m, n - 1 ),   // Insert i.e value at x, y-1 represents an Insert operation
                                   calculateEditDistance( str1, str2, m - 1, n ) ), // Remove i.e x-1, y represents an Remove operation
                                   calculateEditDistance( str1, str2, m - 1, n - 1 ) // Replace i.e x-1, y-1 represents an Replace operation
                                 ) + 1;
        
    }
    
    public static Integer getMinEditDistance( String str1, String str2 ) //this method is introduced to avoid wrong length entries
    {
        Contract.requires( ( str1 != null ), 'getMinEditDistance called with null string 1' );

        Contract.requires( ( str2 != null), 'getMinEditDistance called with null string 2' );

        return EditDistanceCalculator.calculateEditDistance( str1, str2, str1.length(), str2.length() );
    }
}