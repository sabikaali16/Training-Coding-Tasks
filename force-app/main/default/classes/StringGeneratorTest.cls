@isTest
public with sharing class StringGeneratorTest// ClassNameTest
{ 
    @isTest static void randomString_whenStringListIsNull_throwsException() //NOPMD - unit test naming convention followed 
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                StringGenerator.randomString( null );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'randomString - when passed a null stringList, throws a Contract.Requires Exception' ); 
    }
    @isTest static void randomString_whenStringListIsEmpty_returnsEmptyList() //NOPMD - unit test naming conventiopn followed 
    {
        List<String> inputList = new List<String>(); 

        String outputString;

        Test.startTest();
            outputString = StringGenerator.randomString( inputList );    
        Test.stopTest();

        System.assertEquals( '', outputString, ' randomString - when passed an empty stringList, returns an empty string' );
    }

    @isTest static void randomString_whenGivenStringListWithValues_returnsRandomStringFromGivenStringList() //NOPMD - unit test naming convention followed 
    {
        List<String> inputList = new List<String>{ 'Value1', 'Value2' }; 

        String outputString;

        Test.startTest();
            outputString = StringGenerator.randomString( inputList );    
        Test.stopTest();

        System.assert( inputList.contains( outputString ), ' randomString - when passed a stringList, returns a value from the given stringList');
    }

    @isTest static void uniquelyRandomString_whenStringListIsNull_throwsException() //NOPMD - unit test naming convention followed 
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                StringGenerator.uniquelyRandomString( null );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'uniquelyRandomString - when passed a null stringList, throws a Contract.Requires Exception' ); 
    }

    @isTest static void uniquelyRandomString_whenStringListIsEmpty_returnsEmptyList() //NOPMD - unit test naming convention followed
    {
        List<String> inputList = new List<String>(); 

        String outputString;

        Test.startTest();
            outputString = StringGenerator.uniquelyRandomString( inputList );    
        Test.stopTest();

        System.assertEquals( '', outputString, ' uniquelyRandomString - when passed an empty stringList, returns an empty string' );
    }

    @isTest static void uniquelyRandomString_whenGivenStringListWithValues_returnsRandomStringFromGivenStringList() //NOPMD - unit test naming convention followed 
    {
        List<String> inputList = new List<String>{ 'Value1', 'Value2' }; 

        String outputString;

        Test.startTest();
            outputString = StringGenerator.uniquelyRandomString( inputList );    
        Test.stopTest();

        System.assert( inputList.contains( outputString ), ' uniquelyRandomString - when passed a stringList, returns a value from the given stringList');
    }

    @isTest static void uniquelyRandomString_whenAllStringsFromStringListAreServed_emptiesServedListToRestart() // NOPMD - unit test naming convention followed
    {
        List<String> inputList = new List<String>{ 'Value1', 'Value2' };

        String outputString1,

               outputString2,

               outputString3;
        
        Test.startTest();
            outputString1 = StringGenerator.uniquelyRandomString( inputList );

            outputString2 = StringGenerator.uniquelyRandomString( inputList );
            
            outputString3 = StringGenerator.uniquelyRandomString( inputList );
        Test.stopTest();

        System.assert( ( inputList.contains( outputString1 ) ) && ( inputList.contains( outputString2 ) ) && ( inputList.contains( outputString3 ) ) , ' uniquelyRandomString - when all strings are served, restarts from beginning');

    }

    @isTest static void uniquelyRandomString_whenPassedAStringList_returnsAUniqueStringEachTime() // NOPMD - unit test naming convention followed
    {
        List<String> inputList = new List<String>{ 'Value1', 'Value2' };

        String outputString1,

               outputString2;
        
        Test.startTest();
            outputString1 = StringGenerator.uniquelyRandomString( inputList );

            outputString2 = StringGenerator.uniquelyRandomString( inputList );
        Test.stopTest();

        System.assert( ( outputString1 ) != ( outputString2 ) , ' uniquelyRandomString - when passed a stringList , returns a unique string in each cycle');

    }
}
