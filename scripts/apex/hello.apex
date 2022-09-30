// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

StringGenerator obj1 = new StringGenerator( new List<String>{'aa','bb','cc','dd'} );

system.debug( obj1.randomString() );

system.debug( obj1.uniquelyRandomString() );
