//
//  GRDResponse.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GRDData,GRDInventory;

@interface GRDResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) GRDData *data;
@property (nonatomic, strong) GRDInventory *inventory;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
