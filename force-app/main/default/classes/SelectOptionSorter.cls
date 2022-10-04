public with sharing class SelectOptionSorter 
{
    public static void sortSelectOptionList( List<SelectOption> selectOptionList )
    {
        Contract.requires( selectOptionList != null, 'sortSelectOptionList called with null selectOptionList' );

        Map<String, String> optionListMap = new Map<String, String>(); 

        for( SelectOption so : selectOptionList )  
        {
            optionListMap.put( so.getLabel(), so.getValue() );
        }

        List<String> sortedLabels = new List<String>(); // list that will contain selectOptionList's labels in sorted form

        sortedLabels.addAll( optionListMap.keySet() ); 

        sortedLabels.sort();

        selectOptionList.clear();

        for( String key : sortedLabels )
        {
            selectOptionList.add( new SelectOption( optionListMap.get( key ), key ) );
        }

    } 
}
