//
//  Utilities.m
//  DestinyHelper
//
//  Created by Bertle on 10/11/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+(NSDictionary *) retrieveDataFromJSONFile : (NSString *) fileName andExtension: (NSString *) fileExtension{
    
    NSDictionary *fileData = nil;
    
    NSString *message = nil,
            *filePath = nil,
            *fileContents = nil;
    
    NSError * error;
    @try {
        
        filePath =[[NSBundle mainBundle] pathForResource:fileName ofType:fileExtension];
        
        fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
        if(error){
            NSLog(@"Error reading file: %@",error.localizedDescription);
        }
        
        fileData = (NSDictionary *)[NSJSONSerialization
                                   JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                  options:0 error:NULL];
        
        
    } @catch (NSException *exception) {
        message = exception.description;
    } @finally {
        if (message.length > 0){
            NSLog(@"Utilities:retrieveDataFromJSONFile:Error->%@",message);
        }
        message = nil;
        filePath = nil;
        fileContents =nil;
    }
    return fileData;
}

@end
