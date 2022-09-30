//Create a class that takes a set of strings as input and allows the caller to obtain: 

//1) a random string (completely randomly chosen from the list passed as input to the class) 

//2) a uniquely random string (one string should not repeat until the cycle is complete). 

//Unique randomness means that once you serve a string, that string should not again be served until a all strings have been requested.  

public with sharing class StringGenerator 
{
    public static List<Integer> listOfServedIndexes = new List<Integer>();

    public static String randomString( List<String> stringList )
    {
        Contract.requires( stringList != null, 'randomString called with null stringList' );

        Integer randomIndex;
        
        if( stringList.size() != 0 )
        {
            randomIndex = Integer.valueof( ( Math.random() * stringList.size() ) );

            return stringList[randomIndex];
        }
        else
        {
            return '';
        }
    }

    public static String uniquelyRandomString( List<String> stringList )
    {
        Contract.requires( stringList != null, 'randomString called with null stringList' );

        Integer randomIndex;

        if( stringList.size() != 0 )
        {
            randomIndex = Integer.valueof( ( Math.random() * stringList.size() ) );

            if( listOfServedIndexes.size() == stringList.size() ) //clear the list once all values have been served to restart
            {
                listOfServedIndexes = new list<Integer>();
            }

            while( ( listOfServedIndexes.contains( randomIndex ) ) ) //while this condition is true, keep generating random
            {
                randomIndex = Integer.valueof( ( Math.random() * stringList.size() ) );
            }

            listOfServedIndexes.add( randomIndex );
        
            return stringList[randomIndex];
        }
        else
        {
            return '';
        }
    }
}
