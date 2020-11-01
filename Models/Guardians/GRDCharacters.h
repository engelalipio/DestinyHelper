//
//  GRDCharacters.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GRDCharacterBase, GRDLevelProgression;

@interface GRDCharacters : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) GRDCharacterBase *characterBase;
@property (nonatomic, strong) GRDLevelProgression *levelProgression;
@property (nonatomic, strong) NSString *emblemPath;
@property (nonatomic, assign) double emblemHash;
@property (nonatomic, strong) NSString *backgroundPath;
@property (nonatomic, assign) double characterLevel;
@property (nonatomic, assign) double baseCharacterLevel;
@property (nonatomic, assign) BOOL isPrestigeLevel;
@property (nonatomic, assign) double percentToNextLevel;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
