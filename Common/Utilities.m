//
//  Utilities.m
//  DestinyHelper
//
//  Created by Bertle on 10/11/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import "Utilities.h"
#import "AppDelegate.h"

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
                                  options:kNilOptions error:NULL];
        
        
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

+(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize{
    
    UIImage* newImage = nil;
    CGFloat scale = 0;
    NSString *message  = @"";
    @try {
        
        scale = [[UIScreen mainScreen]scale];
        /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
        //UIGraphicsBeginImageContext(newSize);
        UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
        [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    @catch (NSException *exception) {
        message = exception.description;
    }
    @finally {
        message = @"";
    }
    
    return newImage;
}

+(NSString *) decodeRaceHash: (NSString*) anyHash{
    
    NSString *raceDesc = nil;
    
    enum Destiny2RaceType rType = Awoken;
    
    BOOL spewDebug = NO,
         spewException = YES;
    
    @try {
         
        rType = (int)  [anyHash integerValue];
        
        switch (rType) {
            case Awoken:
                raceDesc =  @"Awoken";
                break;
            case Exo:
                raceDesc =  @"Exo";
                break;
            case Human:
                raceDesc =  @"Human";
                break;

            default:
                raceDesc = @"Unknown";
                break;
        }
        if (spewDebug){
            NSLog(@"Utilities:decodeRaceHash:Result->[%@]=[%@]",anyHash,raceDesc);
        }
        
    }
    @catch (NSException *exception) {
        if (spewException){
            NSLog(@"Utilities:decodeRaceHash:Exception->%@",exception.description);
        }
    }
    @finally{
        spewDebug = NO;
        spewException = NO;
    }
    
    return raceDesc;
}

+(NSString *) decodeClassHash:(NSString *)anyHash{
    
    AppDelegate *appDelegate = nil;
    
    NSDictionary *classDefinitions = nil;
    
    NSString *strClassHash = nil,
             *strHKey = nil,
             *strTKey = nil,
             *strWKey = nil,
             *strText = nil;
    
    BOOL spewDebug = NO,
         spewException = YES;
    @try {
        
        appDelegate = [AppDelegate currentDelegate];
        
        if (appDelegate.destinyClassDefinitions){
            classDefinitions = appDelegate.destinyClassDefinitions;
            
            strClassHash = [NSString stringWithFormat:@"%@",anyHash];
            
            strHKey = [[Hunter class] key];
            
            strTKey = [[Titan class] key];
            
            strWKey = [[Warlock class] key];
           
        
            if ([strClassHash isEqualToString:strHKey]){
                Hunter *hunter = (Hunter*) [classDefinitions objectForKey:strClassHash];
                
                if (hunter){
                    strText  = [NSString stringWithFormat:@"%@", hunter.className];
                   }
            }
            
            if ([strClassHash isEqualToString:strTKey]){
                Titan *titan = (Titan*) [classDefinitions objectForKey:strClassHash];
                
                if (titan){
                    strText  = [NSString stringWithFormat:@"%@", titan.className];
                }
            }
            
            if ([strClassHash isEqualToString:strWKey]){
                Warlock *warlock = (Warlock*) [classDefinitions objectForKey:strClassHash];
                
                if (warlock){
                    strText  = [NSString stringWithFormat:@"%@", warlock.className];
                }
            }
            if (spewDebug){
            NSLog(@"Utilities:decodeClassHash:Result->[%@]=[%@]",anyHash,strText);
            }
        }
        
    }
    @catch (NSException *exception) {
        if (spewException){
            NSLog(@"Utilities:decodeClassHash:Exception->%@",exception.description);
        }
    }
    @finally {
        
        appDelegate = nil;
        
        classDefinitions = nil;
        
        strClassHash = nil;
        strHKey = nil;
        strTKey = nil;
        strWKey = nil;
 
    }
    
    return  strText;
}

+(NSString *) decodeDamageType: (int) anyDamage{
    
    NSString *strDamageTypeDesc = nil;
    
    enum Destiny2DamageType dType = DamageNone;
    
    BOOL spewDebug = NO,
         spewException = YES;
    
    @try {
        
    
        /*
         
         DamageNone= 0,
         Kinetic= 1,
         DamageArc= 2,
         DamageThermal= 3,
         DamageVoid= 4,
         Raid= 5,
         Stasis= 6
         
         */
        
        dType = anyDamage;
        
        switch (dType) {
            case DamageNone:
                strDamageTypeDesc = @"None";
                break;
            case Kinetic:
                strDamageTypeDesc = @"Kinetic";
                break;
            case DamageArc:
                strDamageTypeDesc = @"Arc";
                break;
            case DamageThermal:
                strDamageTypeDesc = @"Solar";
                break;
            case DamageVoid:
                strDamageTypeDesc = @"Void";
                break;
            case Raid:
                strDamageTypeDesc = @"Raid";
                break;
            case Stasis:
                strDamageTypeDesc = @"Stasis";
                break;
        }
        if (spewDebug){
            NSLog(@"Utilities:decodeDamageType:Result->[%ld]=[%@]",(long)anyDamage,strDamageTypeDesc);
        }
        
    } @catch (NSException *exception) {
        if (spewException){
            NSLog(@"Utilities:decodeDamageType:Exception->%@",exception.description);
        }
    } @finally {
        
    }
    
    return strDamageTypeDesc;
}

+(NSString *) decodeGenderHash: (NSString*) anyHash{
   
    NSString *strGenderHash = nil,
             *strMKey       = nil,
             *strFKey       = nil,
             *strGender     = nil;
    
    AppDelegate *appDelegate = nil;
    
    NSDictionary *genderDefinitions = nil,
                 *cGender = nil;
    
    GenderedClassNamesByGenderHash *male   = nil,
                                   *female = nil;
    
    BOOL spewDebug = NO,
         spewException = YES;
    
    @try {
        
        
        appDelegate = [AppDelegate currentDelegate];
        
        if (appDelegate.destinyGenderDefinitions){
            
            genderDefinitions = [appDelegate destinyGenderDefinitions];
            
            male   = [[GenderedClassNamesByGenderHash alloc] init];
            female = [[GenderedClassNamesByGenderHash alloc] init];
            
            strGenderHash = [NSString stringWithFormat:@"%@",anyHash];
            
            strMKey       = [[GenderedClassNamesByGenderHash class] maleHash];
            
            strFKey       = [[GenderedClassNamesByGenderHash class] femaleHash];
            
            cGender = [genderDefinitions objectForKey:strGenderHash];
            
            if ([strGenderHash isEqualToString:strFKey]){
                female = [[GenderedClassNamesByGenderHash alloc] initWithDictionary:cGender];
                
                if (female){
                    strGender = [[GenderedClassNames class] femaleKey];
                }
            }
            
            if ([strGenderHash isEqualToString:strMKey]){
                male = [[GenderedClassNamesByGenderHash alloc] initWithDictionary:cGender];
                
                if (male){
                    strGender =  [[GenderedClassNames class] maleKey];
                }
            }
            if (spewDebug){
                NSLog(@"Utilities:decodeGenderHash:Result->[%@]=[%@]",anyHash,strGender);
            }
            
        }
        
    }
    @catch (NSException *exception) {
        if (spewException){
            NSLog(@"Utilities:decodeGenderHash:Exception->%@",exception.description);
        }
    }
    @finally {
        
        strGenderHash = nil;
        strMKey       = nil;
        strFKey       = nil;
        
        appDelegate = nil;
        
        genderDefinitions = nil;
        cGender = nil;
        
        male   = nil;
        female = nil;
    }
    
    return strGender;
}

@end
