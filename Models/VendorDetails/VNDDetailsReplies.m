//
//  Replies.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsReplies.h"


NSString *const kRepliesRewardSiteHash = @"rewardSiteHash";
NSString *const kRepliesReply = @"reply";
NSString *const kRepliesReplyType = @"replyType";
NSString *const kRepliesItemRewardsSelection = @"itemRewardsSelection";


@interface VNDDetailsReplies ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsReplies

@synthesize rewardSiteHash = _rewardSiteHash;
@synthesize reply = _reply;
@synthesize replyType = _replyType;
@synthesize itemRewardsSelection = _itemRewardsSelection;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kRepliesReply,@"reply",
                         nil];
    
    return map;
}

+ (NSString *)key{
    return nil;
}


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.rewardSiteHash = [[self objectOrNilForKey:kRepliesRewardSiteHash fromDictionary:dict] doubleValue];
            self.reply = [self objectOrNilForKey:kRepliesReply fromDictionary:dict];
            self.replyType = [[self objectOrNilForKey:kRepliesReplyType fromDictionary:dict] doubleValue];
            self.itemRewardsSelection = [[self objectOrNilForKey:kRepliesItemRewardsSelection fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rewardSiteHash] forKey:kRepliesRewardSiteHash];
    [mutableDict setValue:self.reply forKey:kRepliesReply];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyType] forKey:kRepliesReplyType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemRewardsSelection] forKey:kRepliesItemRewardsSelection];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.rewardSiteHash = [aDecoder decodeDoubleForKey:kRepliesRewardSiteHash];
    self.reply = [aDecoder decodeObjectForKey:kRepliesReply];
    self.replyType = [aDecoder decodeDoubleForKey:kRepliesReplyType];
    self.itemRewardsSelection = [aDecoder decodeDoubleForKey:kRepliesItemRewardsSelection];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_rewardSiteHash forKey:kRepliesRewardSiteHash];
    [aCoder encodeObject:_reply forKey:kRepliesReply];
    [aCoder encodeDouble:_replyType forKey:kRepliesReplyType];
    [aCoder encodeDouble:_itemRewardsSelection forKey:kRepliesItemRewardsSelection];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsReplies *copy = [[VNDDetailsReplies alloc] init];
    
    if (copy) {

        copy.rewardSiteHash = self.rewardSiteHash;
        copy.reply = [self.reply copyWithZone:zone];
        copy.replyType = self.replyType;
        copy.itemRewardsSelection = self.itemRewardsSelection;
    }
    
    return copy;
}


@end
