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
