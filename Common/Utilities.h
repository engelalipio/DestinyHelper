//
//  Utilities.h
//  DestinyHelper
//
//  Created by Bertle on 10/11/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
 
@interface Utilities : NSObject


+(NSDictionary *) retrieveDataFromJSONFile : (NSString *) fileName andExtension: (NSString *) fileExtension;

+(UIImage *) imageResize :(UIImage*)img andResizeTo:(CGSize)newSize;

+(NSString *) decodeGenderHash: (NSString*) anyHash;

+(NSString *) decodeClassHash: (NSString*) anyHash;

+(NSString *) decodeRaceHash: (NSString*) anyHash;

+(NSString *) decodeDamageType: (int) anyDamage;

@end

 
