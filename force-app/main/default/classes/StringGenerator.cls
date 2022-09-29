//Create a class that takes a set of strings as input and allows the caller to obtain: 

//1) a random string (completely randomly chosen from the list passed as input to the class) 

//2) a uniquely random string (one string should not repeat until the cycle is complete). 


//Unique randomness means that once you serve a string, that string should not again be served until a all strings have been requested.  

//Throwing a dice is example of completely random. 

//Distributing cards is example of unique random i.e. once a card is served, it doesn't come again until full cycle. 

public with sharing class StringGenerator {

    private List<String> stringList = new List<String>();

    public StringGenerator( List<String> stringListByUser )
    {
        stringList = stringListByUser;
    }
    
    public List<String> returnRandomString()
    {
        List<Integer> randomIndexList = new List<Integer>();
        
        List<String> randomStringList = new List<String>();
        
        while( randomIndexList.size() < stringList.size() )
        {
            Integer randomIndex;

            randomIndex = Integer.valueof( ( Math.random() * stringList.size() ) );
            
            if( !( randomIndexList.contains( randomIndex ) ) )
            {
                randomIndexList.add( randomIndex );
                randomStringList.add( stringList[randomIndex] );
            }
        }
        return randomStringList;
    }
}
