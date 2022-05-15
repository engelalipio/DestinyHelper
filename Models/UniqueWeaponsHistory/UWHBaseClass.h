//
//  UWHBaseClass.h
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UWHResponse;

@interface UWHBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) UWHResponse *response;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
