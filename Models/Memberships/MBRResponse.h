//
//  MBRResponse.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBRBungieNetUser;

@interface MBRResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *destinyMemberships;
@property (nonatomic, strong) MBRBungieNetUser *bungieNetUser;
@property (nonatomic, strong) NSString* primaryMembershipId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
