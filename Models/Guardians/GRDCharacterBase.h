//
//  GRDCharacterBase.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GRDStats, GRDCustomization, GRDPeerView;

@interface GRDCharacterBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double genderHash;
@property (nonatomic, strong) NSString *minutesPlayedTotal;
@property (nonatomic, assign) double buildStatGroupHash;
@property (nonatomic, strong) GRDStats *stats;
@property (nonatomic, assign) double currentActivityHash;
@property (nonatomic, strong) NSString *minutesPlayedThisSession;
@property (nonatomic, assign) double grimoireScore;
@property (nonatomic, strong) GRDCustomization *customization;
@property (nonatomic, assign) double genderType;
@property (nonatomic, assign) double membershipType;
@property (nonatomic, assign) double classHash;
@property (nonatomic, assign) double classType;
@property (nonatomic, assign) double raceType;
@property (nonatomic, strong) NSString *dateLastPlayed;
@property (nonatomic, assign) double powerLevel;
@property (nonatomic, assign) double raceHash;
@property (nonatomic, strong) NSString *characterId;
@property (nonatomic, strong) NSString *membershipId;
@property (nonatomic, strong) GRDPeerView *peerView;
@property (nonatomic, assign) double lastCompletedStoryHash;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
