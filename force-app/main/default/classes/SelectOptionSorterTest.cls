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
}
