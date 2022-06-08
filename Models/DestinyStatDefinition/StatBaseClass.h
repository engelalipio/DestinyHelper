//
//  StatBaseClass.h
//
//  Created by Engel Alipio on 6/6/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DestinyStatDefinition;

@interface StatBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) DestinyStatDefinition *destinyStatDefinition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
