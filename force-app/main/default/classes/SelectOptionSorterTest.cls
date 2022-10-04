@isTest
public with sharing class SelectOptionSorterTest 
{
    @isTest
    public static void sortSelectOptionList_whenSelectOptionListIsNull_throwsException() //NOPMD - unit test naming convention followed
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                SelectOptionSorter.sortSelectOptionList( null );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'sortSelectOptionList - when passed a null selectOptionList, throws a Contract.Requires Exception' );
    } 
    
    @isTest
    public static void sortSelectOptionList_whenPassedNumberedLabels_sortsAccordingToLabelNumbers() //NOPMD - unit test naming convention followed
    {
        List<SelectOption> options1 = new List<SelectOption>(); 

        List<SelectOption> options2 = new List<SelectOption>(); 

        options1.add( new SelectOption( 'A', '3' ) );  

        options1.add( new SelectOption( 'C', '1' ) ); 

        options1.add( new SelectOption( 'A', '2' ) );

        options2.add( new SelectOption( 'C', '1' ) );  

        options2.add( new SelectOption( 'A', '2' ) ); 

        options2.add( new SelectOption( 'A', '3' ) );

        Test.startTest();
        SelectOptionSorter.sortSelectOptionList( options1 );
        Test.stopTest();

        System.assertEquals ( options2, options1, 'sortSelectOptionList - when passed a selectOptionList with numberic labels, sorts list in ascending order w.r.t label numbers' );
    } 

    @isTest
    public static void sortSelectOptionList_whenPassedAphabeticLabels_sortsAccordingToLabelAlphabets() //NOPMD - unit test naming convention followed
    {
        List<SelectOption> options1 = new List<SelectOption>(); 

        List<SelectOption> options2 = new List<SelectOption>();

        options1.add( new SelectOption( 'A', 'USA' ) );  

        options1.add( new SelectOption( 'C', 'Mexico' ) ); 

        options1.add( new SelectOption( 'A', 'Canada' ) ); 

        options2.add( new SelectOption( 'A', 'Canada' ) );  

        options2.add( new SelectOption( 'C', 'Mexico' ) ); 

        options2.add( new SelectOption( 'A', 'USA' ) );

        Test.startTest();
        SelectOptionSorter.sortSelectOptionList( options1 );
        Test.stopTest();

        System.assertEquals ( options2, options1, 'sortSelectOptionList - when passed a selectOptionList with alphabetic labels, sorts list in ascending order w.r.t label alphabets' );
    }

    @isTest
    public static void sortSelectOptionList_whenPassedAphaNumericLabels_givesPrecedenceToNumbersWhileSorting() //NOPMD - unit test naming convention followed
    {
        List<SelectOption> options1 = new List<SelectOption>(); 

        List<SelectOption> options2 = new List<SelectOption>(); 

        options1.add( new SelectOption( 'A', 'America' ) );  

        options1.add( new SelectOption( 'C', 'Mexico' ) ); 

        options1.add( new SelectOption( 'B', '2Pakistan' ) );

        options1.add( new SelectOption( 'A', '1Canada' ) );

        options2.add( new SelectOption( 'A', '1Canada' ) );
        
        options2.add( new SelectOption( 'B', '2Pakistan' ) );

        options2.add( new SelectOption( 'A', 'America' ) );
        
        options2.add( new SelectOption( 'C', 'Mexico' ) ); 

        Test.startTest();
        SelectOptionSorter.sortSelectOptionList( options1 );
        Test.stopTest();

        System.assertEquals ( options2, options1, 'sortSelectOptionList - when passed a selectOptionList with alpha-numeric labels, gives precedence to numbers over alphabets when sorting in ascending order' );
    }
}


