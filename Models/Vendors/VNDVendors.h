//
//  Vendors.h
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VNDData;

@interface VNDVendors : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double privacy;
@property (nonatomic, strong) VNDData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
