//
//  INSTInstance.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class INSTData;

@interface INSTInstance : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double privacy;
@property (nonatomic, strong) INSTData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
