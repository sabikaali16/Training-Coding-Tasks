//Create a class that takes a set of strings as input and allows the caller to obtain: 

//1) a random string (completely randomly chosen from the list passed as input to the class) 

//2) a uniquely random string (one string should not repeat until the cycle is complete). 

//Unique randomness means that once you serve a string, that string should not again be served until a all strings have been requested.  


public with sharing class StringGenerator {

    private List<String> stringList = new List<String>();

    public StringGenerator( List<String> stringListGivenByUser )
    {
        stringList = stringListGivenByUser;
    }
    
    public List<String> returnRandomString()
    {
        List<Integer> randomIndexList = new List<Integer>();
        
        List<String> randomStringList = new List<String>();
        
        while( randomIndexList.Size() < stringList.Size() )
        {
            Integer randomIndex;

            randomIndex = Integer.valueof((Math.random() * stringList.Size() ));
            
            if( !( randomIndexList.contains(randomIndex) ) )
            {
                randomIndexList.add( randomIndex );
                randomStringList.add( stringList[randomIndex] );
            }
        }
        return randomStringList;
    }
}
