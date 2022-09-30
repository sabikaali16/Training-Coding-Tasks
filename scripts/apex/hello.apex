// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

system.debug( StringGenerator.randomString( new List<String>{'aa','bb','cc','dd'} ) );

system.debug( StringGenerator.uniquelyRandomString( new List<String>{'aa','bb','cc','dd'} ) );
