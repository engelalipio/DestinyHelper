//
//  GRDLevelProgression.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GRDLevelProgression : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double nextLevelAt;
@property (nonatomic, assign) double progressToNextLevel;
@property (nonatomic, assign) double progressionHash;
@property (nonatomic, assign) double weeklyProgress;
@property (nonatomic, assign) double level;
@property (nonatomic, assign) double currentProgress;
@property (nonatomic, assign) double step;
@property (nonatomic, assign) double dailyProgress;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
