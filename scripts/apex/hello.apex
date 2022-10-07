String str1 = 'evrbp';

String str2 = 'eerhpp';  //2 replacements and 1 insert needed, total operations = 3

Integer d = EditDistanceCalculator.calculateEditDistance( str1, str2, str1.length(), str2.length() );

System.debug( 'Number of operations needed: '+d );