//
//  VGDBaseClass.h
//
//  Created by Engel Alipio on 3/2/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VendorGroupDefinition;

@interface VGDBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) VendorGroupDefinition *vendorGroupDefinition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
