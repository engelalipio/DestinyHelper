//
//  GRDCustomization.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GRDCustomization : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double skinColor;
@property (nonatomic, assign) double hairIndex;
@property (nonatomic, assign) double featureColor;
@property (nonatomic, assign) BOOL wearHelmet;
@property (nonatomic, assign) double eyeColor;
@property (nonatomic, assign) double decalColor;
@property (nonatomic, assign) double hairColor;
@property (nonatomic, assign) double personality;
@property (nonatomic, assign) double decalIndex;
@property (nonatomic, assign) double featureIndex;
@property (nonatomic, assign) double lipColor;
@property (nonatomic, assign) double face;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
