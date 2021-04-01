//
//  Interactions.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsInteractions.h"
#import "VNDDetailsHeaderDisplayProperties.h"
#import "VNDDetailsReplies.h"


NSString *const kInteractionsFlavorLineTwo = @"flavorLineTwo";
NSString *const kInteractionsHeaderDisplayProperties = @"headerDisplayProperties";
NSString *const kInteractionsInteractionType = @"interactionType";
NSString *const kInteractionsQuestlineItemHash = @"questlineItemHash";
NSString *const kInteractionsVendorCategoryIndex = @"vendorCategoryIndex";
NSString *const kInteractionsInteractionIndex = @"interactionIndex";
NSString *const kInteractionsRewardBlockLabel = @"rewardBlockLabel";
NSString *const kInteractionsRewardVendorCategoryIndex = @"rewardVendorCategoryIndex";
NSString *const kInteractionsReplies = @"replies";
NSString *const kInteractionsFlavorLineOne = @"flavorLineOne";
NSString *const kInteractionsSackInteractionList = @"sackInteractionList";
NSString *const kInteractionsUiInteractionType = @"uiInteractionType";
NSString *const kInteractionsInstructions = @"instructions";


@interface VNDDetailsInteractions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsInteractions

@synthesize flavorLineTwo = _flavorLineTwo;
@synthesize headerDisplayProperties = _headerDisplayProperties;
@synthesize interactionType = _interactionType;
@synthesize questlineItemHash = _questlineItemHash;
@synthesize vendorCategoryIndex = _vendorCategoryIndex;
@synthesize interactionIndex = _interactionIndex;
@synthesize rewardBlockLabel = _rewardBlockLabel;
@synthesize rewardVendorCategoryIndex = _rewardVendorCategoryIndex;
@synthesize replies = _replies;
@synthesize flavorLineOne = _flavorLineOne;
@synthesize sackInteractionList = _sackInteractionList;
@synthesize uiInteractionType = _uiInteractionType;
@synthesize instructions = _instructions;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kInteractionsInteractionIndex,@"interactionIndex",
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
            self.flavorLineTwo = [self objectOrNilForKey:kInteractionsFlavorLineTwo fromDictionary:dict];
            self.headerDisplayProperties = [VNDDetailsHeaderDisplayProperties modelObjectWithDictionary:[dict objectForKey:kInteractionsHeaderDisplayProperties]];
            self.interactionType = [[self objectOrNilForKey:kInteractionsInteractionType fromDictionary:dict] doubleValue];
            self.questlineItemHash = [[self objectOrNilForKey:kInteractionsQuestlineItemHash fromDictionary:dict] doubleValue];
            self.vendorCategoryIndex = [[self objectOrNilForKey:kInteractionsVendorCategoryIndex fromDictionary:dict] doubleValue];
            self.interactionIndex = [[self objectOrNilForKey:kInteractionsInteractionIndex fromDictionary:dict] doubleValue];
            self.rewardBlockLabel = [self objectOrNilForKey:kInteractionsRewardBlockLabel fromDictionary:dict];
            self.rewardVendorCategoryIndex = [[self objectOrNilForKey:kInteractionsRewardVendorCategoryIndex fromDictionary:dict] doubleValue];
    NSObject *receivedReplies = [dict objectForKey:kInteractionsReplies];
    NSMutableArray *parsedReplies = [NSMutableArray array];
    if ([receivedReplies isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReplies) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReplies addObject:[VNDDetailsReplies modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReplies isKindOfClass:[NSDictionary class]]) {
       [parsedReplies addObject:[VNDDetailsReplies modelObjectWithDictionary:(NSDictionary *)receivedReplies]];
    }

    self.replies = [NSArray arrayWithArray:parsedReplies];
            self.flavorLineOne = [self objectOrNilForKey:kInteractionsFlavorLineOne fromDictionary:dict];
            self.sackInteractionList = [self objectOrNilForKey:kInteractionsSackInteractionList fromDictionary:dict];
            self.uiInteractionType = [[self objectOrNilForKey:kInteractionsUiInteractionType fromDictionary:dict] doubleValue];
            self.instructions = [self objectOrNilForKey:kInteractionsInstructions fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.flavorLineTwo forKey:kInteractionsFlavorLineTwo];
    [mutableDict setValue:[self.headerDisplayProperties dictionaryRepresentation] forKey:kInteractionsHeaderDisplayProperties];
    [mutableDict setValue:[NSNumber numberWithDouble:self.interactionType] forKey:kInteractionsInteractionType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.questlineItemHash] forKey:kInteractionsQuestlineItemHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vendorCategoryIndex] forKey:kInteractionsVendorCategoryIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.interactionIndex] forKey:kInteractionsInteractionIndex];
    [mutableDict setValue:self.rewardBlockLabel forKey:kInteractionsRewardBlockLabel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rewardVendorCategoryIndex] forKey:kInteractionsRewardVendorCategoryIndex];
    NSMutableArray *tempArrayForReplies = [NSMutableArray array];
    for (NSObject *subArrayObject in self.replies) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForReplies addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForReplies addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReplies] forKey:kInteractionsReplies];
    [mutableDict setValue:self.flavorLineOne forKey:kInteractionsFlavorLineOne];
    NSMutableArray *tempArrayForSackInteractionList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.sackInteractionList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSackInteractionList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSackInteractionList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSackInteractionList] forKey:kInteractionsSackInteractionList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uiInteractionType] forKey:kInteractionsUiInteractionType];
    [mutableDict setValue:self.instructions forKey:kInteractionsInstructions];

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

    self.flavorLineTwo = [aDecoder decodeObjectForKey:kInteractionsFlavorLineTwo];
    self.headerDisplayProperties = [aDecoder decodeObjectForKey:kInteractionsHeaderDisplayProperties];
    self.interactionType = [aDecoder decodeDoubleForKey:kInteractionsInteractionType];
    self.questlineItemHash = [aDecoder decodeDoubleForKey:kInteractionsQuestlineItemHash];
    self.vendorCategoryIndex = [aDecoder decodeDoubleForKey:kInteractionsVendorCategoryIndex];
    self.interactionIndex = [aDecoder decodeDoubleForKey:kInteractionsInteractionIndex];
    self.rewardBlockLabel = [aDecoder decodeObjectForKey:kInteractionsRewardBlockLabel];
    self.rewardVendorCategoryIndex = [aDecoder decodeDoubleForKey:kInteractionsRewardVendorCategoryIndex];
    self.replies = [aDecoder decodeObjectForKey:kInteractionsReplies];
    self.flavorLineOne = [aDecoder decodeObjectForKey:kInteractionsFlavorLineOne];
    self.sackInteractionList = [aDecoder decodeObjectForKey:kInteractionsSackInteractionList];
    self.uiInteractionType = [aDecoder decodeDoubleForKey:kInteractionsUiInteractionType];
    self.instructions = [aDecoder decodeObjectForKey:kInteractionsInstructions];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_flavorLineTwo forKey:kInteractionsFlavorLineTwo];
    [aCoder encodeObject:_headerDisplayProperties forKey:kInteractionsHeaderDisplayProperties];
    [aCoder encodeDouble:_interactionType forKey:kInteractionsInteractionType];
    [aCoder encodeDouble:_questlineItemHash forKey:kInteractionsQuestlineItemHash];
    [aCoder encodeDouble:_vendorCategoryIndex forKey:kInteractionsVendorCategoryIndex];
    [aCoder encodeDouble:_interactionIndex forKey:kInteractionsInteractionIndex];
    [aCoder encodeObject:_rewardBlockLabel forKey:kInteractionsRewardBlockLabel];
    [aCoder encodeDouble:_rewardVendorCategoryIndex forKey:kInteractionsRewardVendorCategoryIndex];
    [aCoder encodeObject:_replies forKey:kInteractionsReplies];
    [aCoder encodeObject:_flavorLineOne forKey:kInteractionsFlavorLineOne];
    [aCoder encodeObject:_sackInteractionList forKey:kInteractionsSackInteractionList];
    [aCoder encodeDouble:_uiInteractionType forKey:kInteractionsUiInteractionType];
    [aCoder encodeObject:_instructions forKey:kInteractionsInstructions];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsInteractions *copy = [[VNDDetailsInteractions alloc] init];
    
    if (copy) {

        copy.flavorLineTwo = [self.flavorLineTwo copyWithZone:zone];
        copy.headerDisplayProperties = [self.headerDisplayProperties copyWithZone:zone];
        copy.interactionType = self.interactionType;
        copy.questlineItemHash = self.questlineItemHash;
        copy.vendorCategoryIndex = self.vendorCategoryIndex;
        copy.interactionIndex = self.interactionIndex;
        copy.rewardBlockLabel = [self.rewardBlockLabel copyWithZone:zone];
        copy.rewardVendorCategoryIndex = self.rewardVendorCategoryIndex;
        copy.replies = [self.replies copyWithZone:zone];
        copy.flavorLineOne = [self.flavorLineOne copyWithZone:zone];
        copy.sackInteractionList = [self.sackInteractionList copyWithZone:zone];
        copy.uiInteractionType = self.uiInteractionType;
        copy.instructions = [self.instructions copyWithZone:zone];
    }
    
    return copy;
}


@end
