//
//  TimePlayedSeconds.h
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ACTHBasic;

@interface TimePlayedSeconds : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ACTHBasic *basic;
@property (nonatomic, strong) NSString *statId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
