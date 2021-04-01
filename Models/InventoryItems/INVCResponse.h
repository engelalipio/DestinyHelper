//
//  INVCResponse.h
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class INVCInventory;

@interface INVCResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) INVCInventory *inventory;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
