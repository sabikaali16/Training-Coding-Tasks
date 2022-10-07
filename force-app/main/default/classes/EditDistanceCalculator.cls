public with sharing class EditDistanceCalculator 
{
    public static Integer calculateEditDistance( String str1, String str2, Integer m, Integer n ) //NOPMD -  Have to use long parameter here
    {
		
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

        return Math.min( Math.min( calculateEditDistance( str1, str2, m, n - 1 ), // Insert
                                   calculateEditDistance( str1, str2, m - 1, n ) ), // Remove
                                   calculateEditDistance( str1, str2, m - 1, n - 1 ) // Replace
                                 ) + 1;
    }
}