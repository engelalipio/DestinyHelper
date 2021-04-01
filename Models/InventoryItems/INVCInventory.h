//
//  INVCInventory.h
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class INVCData;

@interface INVCInventory : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double privacy;
@property (nonatomic, strong) INVCData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
