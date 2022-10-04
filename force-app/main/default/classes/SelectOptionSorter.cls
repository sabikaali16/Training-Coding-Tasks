public with sharing class SelectOptionSorter {
    
    public static List<SelectOption> sortSelectOptionList( List<SelectOption> selectOptionList )
    {
        Map<String, String> optionMap = new Map<String, String>(); 

        for( SelectOption so : selectOptionList )  
        {
            optionMap.put( so.getLabel(), so.getValue() );
        }

        List<String> sortedLabels = new List<String>(); // list that will contain selectOptionList's labels in sorted form

        sortedLabels.addAll( optionMap.keySet() ); 

        sortedLabels.sort();

        selectOptionList.clear();

        for( String key : sortedLabels )
        {
            selectOptionList.add( new SelectOption( optionMap.get( key ), key ) );
        }
         
        return selectOptionList;
    } 
}
