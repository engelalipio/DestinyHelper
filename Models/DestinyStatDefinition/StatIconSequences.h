//
//  StatIconSequences.h
//
//  Created by Engel Alipio on 6/6/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface StatIconSequences : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *frames;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
