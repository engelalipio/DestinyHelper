//
//  DCDBaseClass.h
//
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Hunter, Warlock, Titan;

@interface DCDBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Hunter *Hunter;
@property (nonatomic, strong) Warlock *Warlock;
@property (nonatomic, strong) Titan *Titan;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
