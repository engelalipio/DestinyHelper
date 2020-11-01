//
//  GRDEquipment.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GRDEquipment : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *dyes;
@property (nonatomic, assign) double itemHash;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
