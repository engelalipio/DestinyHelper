//
//  VNDDetails.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetails.h"
#import "VNDDetailsDisplayProperties.h"
#import "VNDDetailsGroups.h"
#import "VNDDetailsDisplayCategories.h"
#import "VNDDetailsLocations.h"
#import "VNDDetailsOriginalCategories.h"
#import "VNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties.h"
#import "VNDDetailsInteractions.h"
#import "VNDDetailsCategories.h"
#import "VNDDetailsItemList.h"


NSString *const kVNDDetailsReturnWithVendorRequest = @"returnWithVendorRequest";
NSString *const kVNDDetailsConsolidateCategories = @"consolidateCategories";
NSString *const kVNDDetailsDisplayProperties = @"displayProperties";
NSString *const kVNDDetailsActions = @"actions";
NSString *const kVNDDetailsInventoryFlyouts = @"inventoryFlyouts";
NSString *const kVNDDetailsGroups = @"groups";
NSString *const kVNDDetailsIgnoreSaleItemHashes = @"ignoreSaleItemHashes";
NSString *const kVNDDetailsRedacted = @"redacted";
NSString *const kVNDDetailsFailureStrings = @"failureStrings";
NSString *const kVNDDetailsUnlockRanges = @"unlockRanges";
NSString *const kVNDDetailsVendorProgressionType = @"vendorProgressionType";
NSString *const kVNDDetailsDisplayCategories = @"displayCategories";
NSString *const kVNDDetailsIndex = @"index";
NSString *const kVNDDetailsServices = @"services";
NSString *const kVNDDetailsHash = @"hash";
NSString *const kVNDDetailsResetIntervalMinutes = @"resetIntervalMinutes";
NSString *const kVNDDetailsLocations = @"locations";
NSString *const kVNDDetailsOriginalCategories = @"originalCategories";
NSString *const kVNDDetailsDisplayItemHash = @"displayItemHash";
NSString *const kVNDDetailsFactionHash = @"factionHash";
NSString *const kVNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties = @"BungieNet.Engine.Contract.Destiny.World.Definitions.IDestinyDisplayDefinition.displayProperties";
NSString *const kVNDDetailsResetOffsetMinutes = @"resetOffsetMinutes";
NSString *const kVNDDetailsBlacklisted = @"blacklisted";
NSString *const kVNDDetailsVisible = @"visible";
NSString *const kVNDDetailsUnlockValueHash = @"unlockValueHash";
NSString *const kVNDDetailsInteractions = @"interactions";
NSString *const kVNDDetailsCategories = @"categories";
NSString *const kVNDDetailsInhibitSelling = @"inhibitSelling";
NSString *const kVNDDetailsVendorIdentifier = @"vendorIdentifier";
NSString *const kVNDDetailsItemList = @"itemList";
NSString *const kVNDDetailsInhibitBuying = @"inhibitBuying";
NSString *const kVNDDetailsEnabled = @"enabled";
NSString *const kVNDDetailsAcceptedItems = @"acceptedItems";


@interface VNDDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetails

@synthesize returnWithVendorRequest = _returnWithVendorRequest;
@synthesize consolidateCategories = _consolidateCategories;
@synthesize displayProperties = _displayProperties;
@synthesize actions = _actions;
@synthesize inventoryFlyouts = _inventoryFlyouts;
@synthesize groups = _groups;
@synthesize ignoreSaleItemHashes = _ignoreSaleItemHashes;
@synthesize redacted = _redacted;
@synthesize failureStrings = _failureStrings;
@synthesize unlockRanges = _unlockRanges;
@synthesize vendorProgressionType = _vendorProgressionType;
@synthesize displayCategories = _displayCategories;
@synthesize index = _index;
@synthesize services = _services;
@synthesize hash = _hash;
@synthesize resetIntervalMinutes = _resetIntervalMinutes;
@synthesize locations = _locations;
@synthesize originalCategories = _originalCategories;
@synthesize displayItemHash = _displayItemHash;
@synthesize factionHash = _factionHash;
@synthesize bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties = _bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties;
@synthesize resetOffsetMinutes = _resetOffsetMinutes;
@synthesize blacklisted = _blacklisted;
@synthesize visible = _visible;
@synthesize unlockValueHash = _unlockValueHash;
@synthesize interactions = _interactions;
@synthesize categories = _categories;
@synthesize inhibitSelling = _inhibitSelling;
@synthesize vendorIdentifier = _vendorIdentifier;
@synthesize itemList = _itemList;
@synthesize inhibitBuying = _inhibitBuying;
@synthesize enabled = _enabled;
@synthesize acceptedItems = _acceptedItems;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kVNDDetailsReturnWithVendorRequest,@"returnWithVendorRequest",
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
            self.returnWithVendorRequest = [[self objectOrNilForKey:kVNDDetailsReturnWithVendorRequest fromDictionary:dict] boolValue];
            self.consolidateCategories = [[self objectOrNilForKey:kVNDDetailsConsolidateCategories fromDictionary:dict] boolValue];
            self.displayProperties = [VNDDetailsDisplayProperties modelObjectWithDictionary:[dict objectForKey:kVNDDetailsDisplayProperties]];
            self.actions = [self objectOrNilForKey:kVNDDetailsActions fromDictionary:dict];
            self.inventoryFlyouts = [self objectOrNilForKey:kVNDDetailsInventoryFlyouts fromDictionary:dict];
    NSObject *receivedGroups = [dict objectForKey:kVNDDetailsGroups];
    NSMutableArray *parsedGroups = [NSMutableArray array];
    if ([receivedGroups isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGroups) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGroups addObject:[VNDDetailsGroups modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGroups isKindOfClass:[NSDictionary class]]) {
       [parsedGroups addObject:[VNDDetailsGroups modelObjectWithDictionary:(NSDictionary *)receivedGroups]];
    }

    self.groups = [NSArray arrayWithArray:parsedGroups];
            self.ignoreSaleItemHashes = [self objectOrNilForKey:kVNDDetailsIgnoreSaleItemHashes fromDictionary:dict];
            self.redacted = [[self objectOrNilForKey:kVNDDetailsRedacted fromDictionary:dict] boolValue];
            self.failureStrings = [self objectOrNilForKey:kVNDDetailsFailureStrings fromDictionary:dict];
            self.unlockRanges = [self objectOrNilForKey:kVNDDetailsUnlockRanges fromDictionary:dict];
            self.vendorProgressionType = [[self objectOrNilForKey:kVNDDetailsVendorProgressionType fromDictionary:dict] doubleValue];
    NSObject *receivedDisplayCategories = [dict objectForKey:kVNDDetailsDisplayCategories];
    NSMutableArray *parsedDisplayCategories = [NSMutableArray array];
    if ([receivedDisplayCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDisplayCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDisplayCategories addObject:[VNDDetailsDisplayCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDisplayCategories isKindOfClass:[NSDictionary class]]) {
       [parsedDisplayCategories addObject:[VNDDetailsDisplayCategories modelObjectWithDictionary:(NSDictionary *)receivedDisplayCategories]];
    }

    self.displayCategories = [NSArray arrayWithArray:parsedDisplayCategories];
            self.index = [[self objectOrNilForKey:kVNDDetailsIndex fromDictionary:dict] doubleValue];
            self.services = [self objectOrNilForKey:kVNDDetailsServices fromDictionary:dict];
            self.hash = [[self objectOrNilForKey:kVNDDetailsHash fromDictionary:dict] doubleValue];
            self.resetIntervalMinutes = [[self objectOrNilForKey:kVNDDetailsResetIntervalMinutes fromDictionary:dict] doubleValue];
    NSObject *receivedLocations = [dict objectForKey:kVNDDetailsLocations];
    NSMutableArray *parsedLocations = [NSMutableArray array];
    if ([receivedLocations isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLocations) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLocations addObject:[VNDDetailsLocations modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLocations isKindOfClass:[NSDictionary class]]) {
       [parsedLocations addObject:[VNDDetailsLocations modelObjectWithDictionary:(NSDictionary *)receivedLocations]];
    }

    self.locations = [NSArray arrayWithArray:parsedLocations];
    NSObject *receivedOriginalCategories = [dict objectForKey:kVNDDetailsOriginalCategories];
    NSMutableArray *parsedOriginalCategories = [NSMutableArray array];
    if ([receivedOriginalCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedOriginalCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedOriginalCategories addObject:[VNDDetailsOriginalCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedOriginalCategories isKindOfClass:[NSDictionary class]]) {
       [parsedOriginalCategories addObject:[VNDDetailsOriginalCategories modelObjectWithDictionary:(NSDictionary *)receivedOriginalCategories]];
    }

    self.originalCategories = [NSArray arrayWithArray:parsedOriginalCategories];
            self.displayItemHash = [[self objectOrNilForKey:kVNDDetailsDisplayItemHash fromDictionary:dict] doubleValue];
            self.factionHash = [[self objectOrNilForKey:kVNDDetailsFactionHash fromDictionary:dict] doubleValue];
            self.bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties = [VNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties modelObjectWithDictionary:[dict objectForKey:kVNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties]];
            self.resetOffsetMinutes = [[self objectOrNilForKey:kVNDDetailsResetOffsetMinutes fromDictionary:dict] doubleValue];
            self.blacklisted = [[self objectOrNilForKey:kVNDDetailsBlacklisted fromDictionary:dict] boolValue];
            self.visible = [[self objectOrNilForKey:kVNDDetailsVisible fromDictionary:dict] boolValue];
            self.unlockValueHash = [[self objectOrNilForKey:kVNDDetailsUnlockValueHash fromDictionary:dict] doubleValue];
    NSObject *receivedInteractions = [dict objectForKey:kVNDDetailsInteractions];
    NSMutableArray *parsedInteractions = [NSMutableArray array];
    if ([receivedInteractions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedInteractions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedInteractions addObject:[VNDDetailsInteractions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedInteractions isKindOfClass:[NSDictionary class]]) {
       [parsedInteractions addObject:[VNDDetailsInteractions modelObjectWithDictionary:(NSDictionary *)receivedInteractions]];
    }

    self.interactions = [NSArray arrayWithArray:parsedInteractions];
    NSObject *receivedCategories = [dict objectForKey:kVNDDetailsCategories];
    NSMutableArray *parsedCategories = [NSMutableArray array];
    if ([receivedCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCategories addObject:[VNDDetailsCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCategories isKindOfClass:[NSDictionary class]]) {
       [parsedCategories addObject:[VNDDetailsCategories modelObjectWithDictionary:(NSDictionary *)receivedCategories]];
    }

    self.categories = [NSArray arrayWithArray:parsedCategories];
            self.inhibitSelling = [[self objectOrNilForKey:kVNDDetailsInhibitSelling fromDictionary:dict] boolValue];
            self.vendorIdentifier = [self objectOrNilForKey:kVNDDetailsVendorIdentifier fromDictionary:dict];
    NSObject *receivedItemList = [dict objectForKey:kVNDDetailsItemList];
    NSMutableArray *parsedItemList = [NSMutableArray array];
    if ([receivedItemList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedItemList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedItemList addObject:[VNDDetailsItemList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedItemList isKindOfClass:[NSDictionary class]]) {
       [parsedItemList addObject:[VNDDetailsItemList modelObjectWithDictionary:(NSDictionary *)receivedItemList]];
    }

    self.itemList = [NSArray arrayWithArray:parsedItemList];
            self.inhibitBuying = [[self objectOrNilForKey:kVNDDetailsInhibitBuying fromDictionary:dict] boolValue];
            self.enabled = [[self objectOrNilForKey:kVNDDetailsEnabled fromDictionary:dict] boolValue];
            self.acceptedItems = [self objectOrNilForKey:kVNDDetailsAcceptedItems fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.returnWithVendorRequest] forKey:kVNDDetailsReturnWithVendorRequest];
    [mutableDict setValue:[NSNumber numberWithBool:self.consolidateCategories] forKey:kVNDDetailsConsolidateCategories];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kVNDDetailsDisplayProperties];
    NSMutableArray *tempArrayForActions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.actions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActions] forKey:kVNDDetailsActions];
    NSMutableArray *tempArrayForInventoryFlyouts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.inventoryFlyouts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForInventoryFlyouts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForInventoryFlyouts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForInventoryFlyouts] forKey:kVNDDetailsInventoryFlyouts];
    NSMutableArray *tempArrayForGroups = [NSMutableArray array];
    for (NSObject *subArrayObject in self.groups) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGroups addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGroups addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGroups] forKey:kVNDDetailsGroups];
    NSMutableArray *tempArrayForIgnoreSaleItemHashes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ignoreSaleItemHashes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIgnoreSaleItemHashes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIgnoreSaleItemHashes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIgnoreSaleItemHashes] forKey:kVNDDetailsIgnoreSaleItemHashes];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kVNDDetailsRedacted];
    NSMutableArray *tempArrayForFailureStrings = [NSMutableArray array];
    for (NSObject *subArrayObject in self.failureStrings) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFailureStrings addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFailureStrings addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFailureStrings] forKey:kVNDDetailsFailureStrings];
    NSMutableArray *tempArrayForUnlockRanges = [NSMutableArray array];
    for (NSObject *subArrayObject in self.unlockRanges) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUnlockRanges addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUnlockRanges addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUnlockRanges] forKey:kVNDDetailsUnlockRanges];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vendorProgressionType] forKey:kVNDDetailsVendorProgressionType];
    NSMutableArray *tempArrayForDisplayCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.displayCategories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDisplayCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDisplayCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDisplayCategories] forKey:kVNDDetailsDisplayCategories];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kVNDDetailsIndex];
    NSMutableArray *tempArrayForServices = [NSMutableArray array];
    for (NSObject *subArrayObject in self.services) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForServices addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForServices addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForServices] forKey:kVNDDetailsServices];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kVNDDetailsHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resetIntervalMinutes] forKey:kVNDDetailsResetIntervalMinutes];
    NSMutableArray *tempArrayForLocations = [NSMutableArray array];
    for (NSObject *subArrayObject in self.locations) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLocations addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLocations addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLocations] forKey:kVNDDetailsLocations];
    NSMutableArray *tempArrayForOriginalCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.originalCategories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOriginalCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOriginalCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOriginalCategories] forKey:kVNDDetailsOriginalCategories];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayItemHash] forKey:kVNDDetailsDisplayItemHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.factionHash] forKey:kVNDDetailsFactionHash];
    [mutableDict setValue:[self.bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties dictionaryRepresentation] forKey:kVNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resetOffsetMinutes] forKey:kVNDDetailsResetOffsetMinutes];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kVNDDetailsBlacklisted];
    [mutableDict setValue:[NSNumber numberWithBool:self.visible] forKey:kVNDDetailsVisible];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unlockValueHash] forKey:kVNDDetailsUnlockValueHash];
    NSMutableArray *tempArrayForInteractions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.interactions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForInteractions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForInteractions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForInteractions] forKey:kVNDDetailsInteractions];
    NSMutableArray *tempArrayForCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.categories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCategories] forKey:kVNDDetailsCategories];
    [mutableDict setValue:[NSNumber numberWithBool:self.inhibitSelling] forKey:kVNDDetailsInhibitSelling];
    [mutableDict setValue:self.vendorIdentifier forKey:kVNDDetailsVendorIdentifier];
    NSMutableArray *tempArrayForItemList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.itemList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:kVNDDetailsItemList];
    [mutableDict setValue:[NSNumber numberWithBool:self.inhibitBuying] forKey:kVNDDetailsInhibitBuying];
    [mutableDict setValue:[NSNumber numberWithBool:self.enabled] forKey:kVNDDetailsEnabled];
    NSMutableArray *tempArrayForAcceptedItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.acceptedItems) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAcceptedItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAcceptedItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAcceptedItems] forKey:kVNDDetailsAcceptedItems];

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

    self.returnWithVendorRequest = [aDecoder decodeBoolForKey:kVNDDetailsReturnWithVendorRequest];
    self.consolidateCategories = [aDecoder decodeBoolForKey:kVNDDetailsConsolidateCategories];
    self.displayProperties = [aDecoder decodeObjectForKey:kVNDDetailsDisplayProperties];
    self.actions = [aDecoder decodeObjectForKey:kVNDDetailsActions];
    self.inventoryFlyouts = [aDecoder decodeObjectForKey:kVNDDetailsInventoryFlyouts];
    self.groups = [aDecoder decodeObjectForKey:kVNDDetailsGroups];
    self.ignoreSaleItemHashes = [aDecoder decodeObjectForKey:kVNDDetailsIgnoreSaleItemHashes];
    self.redacted = [aDecoder decodeBoolForKey:kVNDDetailsRedacted];
    self.failureStrings = [aDecoder decodeObjectForKey:kVNDDetailsFailureStrings];
    self.unlockRanges = [aDecoder decodeObjectForKey:kVNDDetailsUnlockRanges];
    self.vendorProgressionType = [aDecoder decodeDoubleForKey:kVNDDetailsVendorProgressionType];
    self.displayCategories = [aDecoder decodeObjectForKey:kVNDDetailsDisplayCategories];
    self.index = [aDecoder decodeDoubleForKey:kVNDDetailsIndex];
    self.services = [aDecoder decodeObjectForKey:kVNDDetailsServices];
    self.hash = [aDecoder decodeDoubleForKey:kVNDDetailsHash];
    self.resetIntervalMinutes = [aDecoder decodeDoubleForKey:kVNDDetailsResetIntervalMinutes];
    self.locations = [aDecoder decodeObjectForKey:kVNDDetailsLocations];
    self.originalCategories = [aDecoder decodeObjectForKey:kVNDDetailsOriginalCategories];
    self.displayItemHash = [aDecoder decodeDoubleForKey:kVNDDetailsDisplayItemHash];
    self.factionHash = [aDecoder decodeDoubleForKey:kVNDDetailsFactionHash];
    self.bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties = [aDecoder decodeObjectForKey:kVNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties];
    self.resetOffsetMinutes = [aDecoder decodeDoubleForKey:kVNDDetailsResetOffsetMinutes];
    self.blacklisted = [aDecoder decodeBoolForKey:kVNDDetailsBlacklisted];
    self.visible = [aDecoder decodeBoolForKey:kVNDDetailsVisible];
    self.unlockValueHash = [aDecoder decodeDoubleForKey:kVNDDetailsUnlockValueHash];
    self.interactions = [aDecoder decodeObjectForKey:kVNDDetailsInteractions];
    self.categories = [aDecoder decodeObjectForKey:kVNDDetailsCategories];
    self.inhibitSelling = [aDecoder decodeBoolForKey:kVNDDetailsInhibitSelling];
    self.vendorIdentifier = [aDecoder decodeObjectForKey:kVNDDetailsVendorIdentifier];
    self.itemList = [aDecoder decodeObjectForKey:kVNDDetailsItemList];
    self.inhibitBuying = [aDecoder decodeBoolForKey:kVNDDetailsInhibitBuying];
    self.enabled = [aDecoder decodeBoolForKey:kVNDDetailsEnabled];
    self.acceptedItems = [aDecoder decodeObjectForKey:kVNDDetailsAcceptedItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_returnWithVendorRequest forKey:kVNDDetailsReturnWithVendorRequest];
    [aCoder encodeBool:_consolidateCategories forKey:kVNDDetailsConsolidateCategories];
    [aCoder encodeObject:_displayProperties forKey:kVNDDetailsDisplayProperties];
    [aCoder encodeObject:_actions forKey:kVNDDetailsActions];
    [aCoder encodeObject:_inventoryFlyouts forKey:kVNDDetailsInventoryFlyouts];
    [aCoder encodeObject:_groups forKey:kVNDDetailsGroups];
    [aCoder encodeObject:_ignoreSaleItemHashes forKey:kVNDDetailsIgnoreSaleItemHashes];
    [aCoder encodeBool:_redacted forKey:kVNDDetailsRedacted];
    [aCoder encodeObject:_failureStrings forKey:kVNDDetailsFailureStrings];
    [aCoder encodeObject:_unlockRanges forKey:kVNDDetailsUnlockRanges];
    [aCoder encodeDouble:_vendorProgressionType forKey:kVNDDetailsVendorProgressionType];
    [aCoder encodeObject:_displayCategories forKey:kVNDDetailsDisplayCategories];
    [aCoder encodeDouble:_index forKey:kVNDDetailsIndex];
    [aCoder encodeObject:_services forKey:kVNDDetailsServices];
    [aCoder encodeDouble:_hash forKey:kVNDDetailsHash];
    [aCoder encodeDouble:_resetIntervalMinutes forKey:kVNDDetailsResetIntervalMinutes];
    [aCoder encodeObject:_locations forKey:kVNDDetailsLocations];
    [aCoder encodeObject:_originalCategories forKey:kVNDDetailsOriginalCategories];
    [aCoder encodeDouble:_displayItemHash forKey:kVNDDetailsDisplayItemHash];
    [aCoder encodeDouble:_factionHash forKey:kVNDDetailsFactionHash];
    [aCoder encodeObject:_bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties forKey:kVNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties];
    [aCoder encodeDouble:_resetOffsetMinutes forKey:kVNDDetailsResetOffsetMinutes];
    [aCoder encodeBool:_blacklisted forKey:kVNDDetailsBlacklisted];
    [aCoder encodeBool:_visible forKey:kVNDDetailsVisible];
    [aCoder encodeDouble:_unlockValueHash forKey:kVNDDetailsUnlockValueHash];
    [aCoder encodeObject:_interactions forKey:kVNDDetailsInteractions];
    [aCoder encodeObject:_categories forKey:kVNDDetailsCategories];
    [aCoder encodeBool:_inhibitSelling forKey:kVNDDetailsInhibitSelling];
    [aCoder encodeObject:_vendorIdentifier forKey:kVNDDetailsVendorIdentifier];
    [aCoder encodeObject:_itemList forKey:kVNDDetailsItemList];
    [aCoder encodeBool:_inhibitBuying forKey:kVNDDetailsInhibitBuying];
    [aCoder encodeBool:_enabled forKey:kVNDDetailsEnabled];
    [aCoder encodeObject:_acceptedItems forKey:kVNDDetailsAcceptedItems];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetails *copy = [[VNDDetails alloc] init];
    
    if (copy) {

        copy.returnWithVendorRequest = self.returnWithVendorRequest;
        copy.consolidateCategories = self.consolidateCategories;
        copy.displayProperties = [self.displayProperties copyWithZone:zone];
        copy.actions = [self.actions copyWithZone:zone];
        copy.inventoryFlyouts = [self.inventoryFlyouts copyWithZone:zone];
        copy.groups = [self.groups copyWithZone:zone];
        copy.ignoreSaleItemHashes = [self.ignoreSaleItemHashes copyWithZone:zone];
        copy.redacted = self.redacted;
        copy.failureStrings = [self.failureStrings copyWithZone:zone];
        copy.unlockRanges = [self.unlockRanges copyWithZone:zone];
        copy.vendorProgressionType = self.vendorProgressionType;
        copy.displayCategories = [self.displayCategories copyWithZone:zone];
        copy.index = self.index;
        copy.services = [self.services copyWithZone:zone];
        copy.hash = self.hash;
        copy.resetIntervalMinutes = self.resetIntervalMinutes;
        copy.locations = [self.locations copyWithZone:zone];
        copy.originalCategories = [self.originalCategories copyWithZone:zone];
        copy.displayItemHash = self.displayItemHash;
        copy.factionHash = self.factionHash;
        copy.bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties = [self.bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties copyWithZone:zone];
        copy.resetOffsetMinutes = self.resetOffsetMinutes;
        copy.blacklisted = self.blacklisted;
        copy.visible = self.visible;
        copy.unlockValueHash = self.unlockValueHash;
        copy.interactions = [self.interactions copyWithZone:zone];
        copy.categories = [self.categories copyWithZone:zone];
        copy.inhibitSelling = self.inhibitSelling;
        copy.vendorIdentifier = [self.vendorIdentifier copyWithZone:zone];
        copy.itemList = [self.itemList copyWithZone:zone];
        copy.inhibitBuying = self.inhibitBuying;
        copy.enabled = self.enabled;
        copy.acceptedItems = [self.acceptedItems copyWithZone:zone];
    }
    
    return copy;
}


@end
