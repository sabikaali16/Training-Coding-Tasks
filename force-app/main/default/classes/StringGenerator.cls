//Create a class that takes a set of strings as input and allows the caller to obtain: 

//1) a random string (completely randomly chosen from the list passed as input to the class) 

//2) a uniquely random string (one string should not repeat until the cycle is complete). 

//Unique randomness means that once you serve a string, that string should not again be served until a all strings have been requested.  


public with sharing class StringGenerator {

    private List<String> myList = new List<String>();

    public StringGenerator( List<String> myListByUser )
    {
        myList = myListByUser;
    }
    
    public List<String> returnRandomString()
    {
        List<Integer> randomIndexList = new List<integer>();
        
        List<String> randomStringList = new List<String>();
        
        Integer randomIndex;
        
        while( randomIndexList.Size() < myList.Size() )
        {
            randomIndex = integer.valueof((Math.random() * myList.Size() ));
            
            if( !( randomIndexList.contains(randomIndex) ) )
            {
                randomIndexList.add( randomIndex );
                randomStringList.add( myList[randomIndex] );
            }
        }
        return randomStringList;
    }
}
