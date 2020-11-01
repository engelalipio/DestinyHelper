//
//  GRDSTATDEFENSE.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GRDSTATDEFENSE : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double value;
@property (nonatomic, assign) double statHash;
@property (nonatomic, assign) double maximumValue;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
