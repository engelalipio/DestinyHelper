//
//  StatGroupDefinition.h
//
//  Created by Engel Alipio on 6/5/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface StatGroupDefinition : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) StatGroupDefinition *statGroupDefinition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

