public with sharing class StringGenerator {

    private List<String> my_list = new List<String>();

    public StringGenerator( List<String> my_list_by_user )
    {
        my_list = my_list_by_user;
    }
    
    public List<String> returnRandomString()
    {
        List<Integer> randomIndexList = new List<integer>();
        
        List<String> randomStringList = new List<String>();
        
        Integer randomIndex;
        
        while( randomIndexList.Size() < my_list.Size() )
        {
            randomIndex = integer.valueof((Math.random() * my_list.Size() ));
            
            if( !( randomIndexList.contains(randomIndex) ) )
            {
                randomIndexList.add( randomIndex );
                randomStringList.add( my_list[randomIndex] );
            }
        }
        return randomStringList;
    }
}
