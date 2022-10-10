@isTest
public with sharing class EditDistanceCalculatorTest 
{
    @isTest
    public static void getMinEditDistance_whenPassedAllNullParameters_throwsException() //NOPMD - unit test naming convention followed
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                EditDistanceCalculator.getMinEditDistance( null, null );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'getMinEditDistance - when passed null parameters, throws a Contract.Requires Exception' );
    }

    @isTest
    public static void getMinEditDistance_whenlNullStr1_throwsException() //NOPMD - unit test naming convention followed
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                EditDistanceCalculator.getMinEditDistance( null, 'b' );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'getMinEditDistance - when passed null string 1, throws a Contract.Requires Exception' );
    }

    @isTest
    public static void getMinEditDistance_whenlNullStr2_throwsException() //NOPMD - unit test naming convention followed
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                EditDistanceCalculator.getMinEditDistance( 'b', null );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'getMinEditDistance - when passed null string 1, throws a Contract.Requires Exception' );
    }

    @isTest
    public static void getMinEditDistance_whenPassedSameStrings_returnsZeroEditDistance() //NOPMD - unit test naming convention followed
    {
        String str1 = 'abc';

        String str2 = 'abc';

        Integer editDistance;

        Test.startTest();
        editDistance = EditDistanceCalculator.getMinEditDistance( str1, str2 );
        Test.stopTest();

        System.assertEquals ( 0, editDistance, 'getMinEditDistance - when passed same strings returns 0 edit Distance' );
    }

    @isTest
    public static void getMinEditDistance_whenPassedDifferentStringsWithEqualSize_returnsCorrectMinimumEditDistance() //NOPMD - unit test naming convention followed
    {
        String str1 = 'abcde';

        String str2 = 'bgcdr';

        Integer editDistance;

        Test.startTest();
        editDistance = EditDistanceCalculator.getMinEditDistance( str1, str2 );
        Test.stopTest();

        System.assertEquals ( 3, editDistance, 'getMinEditDistance -  when passed different strings of equal size returns correct edit Distance' );
    }

    @isTest
    public static void getMinEditDistance_whenPassedDifferentStringsWithUnEqualSize_returnsCorrectMinimumEditDistance() //NOPMD - unit test naming convention followed
    {
        String str1 = 'cut';

        String str2 = 'mutter';   //1 replacements and 3 insertions needed, total operations = 4

        Integer editDistance;

        Test.startTest();
        editDistance = EditDistanceCalculator.getMinEditDistance( str1, str2 );
        Test.stopTest();

        System.assertEquals ( 4, editDistance, 'getMinEditDistance - when passed different strings of un-equal size returns correct edit Distance' );
    }

    @isTest
    public static void getMinEditDistance_whenPassedEmptyStrings_returnsCorrectMinimumEditDistance() //NOPMD - unit test naming convention followed
    {
        String str1 = '';

        String str2 = ''; 

        Integer editDistance;

        Test.startTest();
        editDistance = EditDistanceCalculator.getMinEditDistance( str1, str2 );
        Test.stopTest();

        System.assertEquals ( 0, editDistance, 'getMinEditDistance - when passed different strings of un-equal size returns correct edit Distance' );
    }

    @isTest
    public static void calculateEditDistance_whenPassedNullStr1_throwsException() //NOPMD - unit test naming convention followed
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                EditDistanceCalculator.calculateEditDistance( null,'b',1 ,1 );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'calculateEditDistance - when passed a null str1, throws a Contract.Requires Exception' );
    }

    @isTest
    public static void calculateEditDistance_whenPassedNullStr2_throwsException() //NOPMD - unit test naming convention followed
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                EditDistanceCalculator.calculateEditDistance( 'a',null,1 ,1 );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'calculateEditDistance - when passed a null str2, throws a Contract.Requires Exception' );
    }

    @isTest
    public static void calculateEditDistance_whenPassedNullLengthOfStr1_throwsException() //NOPMD - unit test naming convention followed
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                EditDistanceCalculator.calculateEditDistance( 'a','b',null ,1 );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'calculateEditDistance - when passed a null length of string 1, throws a Contract.Requires Exception' );
    }

    @isTest
    public static void calculateEditDistance_whenPassedNullLengthOfStr2_throwsException() //NOPMD - unit test naming convention followed
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                EditDistanceCalculator.calculateEditDistance( 'a','b',1 ,null );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'calculateEditDistance - when passed a null length of string 2, throws a Contract.Requires Exception' );
    }

    @isTest
    public static void calculateEditDistance_whenPassedAllNullParameters_throwsException() //NOPMD - unit test naming convention followed
    {
        Exception expectedError;

        Test.startTest();
            try 
            {
                EditDistanceCalculator.calculateEditDistance( null, null, null , null );    
            } 
            catch ( Contract.RequiresException error ) 
            {
                expectedError = error;
            }
        Test.stopTest();

        System.assertNotEquals ( null, expectedError, 'calculateEditDistance - when passed a null all null parameters, throws a Contract.Requires Exception' );
    }

}
