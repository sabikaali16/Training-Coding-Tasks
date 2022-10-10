String str1 = 'cut';

String str2 = 'mutter';  //1 replacements and 3 insertions needed, total operations = 4

Integer d = EditDistanceCalculator.getMinEditDistance( str1, str2 );

System.debug( 'Number of operations needed: '+d );