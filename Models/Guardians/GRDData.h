//
//  GRDData.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GRDInventory;

@interface GRDData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *membershipId;
@property (nonatomic, assign) double versions;
@property (nonatomic, strong) NSArray *characters;
@property (nonatomic, assign) double grimoireScore;
@property (nonatomic, strong) GRDInventory *inventory;
@property (nonatomic, assign) double membershipType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
