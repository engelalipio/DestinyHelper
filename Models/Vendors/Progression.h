//
//  Progression.h
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Progression : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double progressToNextLevel;
@property (nonatomic, assign) double dailyProgress;
@property (nonatomic, assign) double nextLevelAt;
@property (nonatomic, assign) double stepIndex;
@property (nonatomic, assign) double currentResetCount;
@property (nonatomic, assign) double level;
@property (nonatomic, assign) double progressionHash;
@property (nonatomic, assign) double currentProgress;
@property (nonatomic, assign) double levelCap;
@property (nonatomic, assign) double dailyLimit;
@property (nonatomic, assign) double weeklyLimit;
@property (nonatomic, assign) double weeklyProgress;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
