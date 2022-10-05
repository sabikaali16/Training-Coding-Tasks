public with sharing class SelectOptionSorter 
{
    public static void sortSelectOptionList( List<SelectOption> selectOptionList )
    {
        Contract.requires( selectOptionList != null, 'sortSelectOptionList called with null selectOptionList' );

        Map<String, String> optionListMap = new Map<String, String>(); 

        for( SelectOption so : selectOptionList )  
        {
            String labelKey = so.getLabel(),

                      value = so.getValue();

            if( optionListMap.containsKey( labelKey ) )
            {
                optionListMap.put( labelKey+'@'+getUUID(), value ); //concatenate a unique string with the repeating label
            }
            else
            {
                optionListMap.put( labelKey, value );
            }
        }

        List<String> sortedLabels = new List<String>(); // list that will contain selectOptionList's labels in sorted form

        sortedLabels.addAll( optionListMap.keySet() ); 

        sortedLabels.sort();

        selectOptionList.clear();

        for( String key : sortedLabels )
        {
            selectOptionList.add( new SelectOption( optionListMap.get( key ), key ) );
        }

        removeTemporaySubstring( selectOptionList ); //remove the concatenated subtring from the repeating labels
   
    }    

    public static void removeTemporaySubstring( List<SelectOption> selectOptionList )
    {
        Contract.requires( selectOptionList != null, 'sortSelectOptionList called with null selectOptionList' );
        
        for( Integer i = 0; i < selectOptionList.size(); i++ )
        {
            String label = selectOptionList[i].getLabel();

            if( label.contains('@') )
            {
                String temporarySubString = label.substringAfter('@');

                selectOptionList[i].setLabel( label.remove( '@'+temporarySubString ) );
            }
        }
    }

    public static String getUUID() // method returns a unique ID 
    {
        Blob b = Crypto.GenerateAESKey( 128 );
        String h = EncodingUtil.ConvertTohex( b );
        String guid = h.SubString( 0, 8 ) + '-' + h.SubString( 8, 12 ) + '-' + h.SubString( 12, 16 ) + '-' + h.SubString( 16, 20 ) + '-' + h.substring( 20 );
        return guid;
    }
}