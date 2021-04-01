//
//  INVDQuality.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDQuality.h"
//#import "Versions.h"


NSString *const kQualityInfusionCategoryName = @"infusionCategoryName";
NSString *const kQualityInfusionCategoryHash = @"infusionCategoryHash";
NSString *const kQualityVersions = @"versions";
NSString *const kQualityCurrentVersion = @"currentVersion";
NSString *const kQualityInfusionCategoryHashes = @"infusionCategoryHashes";
NSString *const kQualityProgressionLevelRequirementHash = @"progressionLevelRequirementHash";
NSString *const kQualityDisplayVersionWatermarkIcons = @"displayVersionWatermarkIcons";
NSString *const kQualityItemLevels = @"itemLevels";
NSString *const kQualityQualityLevel = @"qualityLevel";


@interface INVDQuality ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDQuality

@synthesize infusionCategoryName = _infusionCategoryName;
@synthesize infusionCategoryHash = _infusionCategoryHash;
@synthesize versions = _versions;
@synthesize currentVersion = _currentVersion;
@synthesize infusionCategoryHashes = _infusionCategoryHashes;
@synthesize progressionLevelRequirementHash = _progressionLevelRequirementHash;
@synthesize displayVersionWatermarkIcons = _displayVersionWatermarkIcons;
@synthesize itemLevels = _itemLevels;
@synthesize qualityLevel = _qualityLevel;


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
            self.infusionCategoryName = [self objectOrNilForKey:kQualityInfusionCategoryName fromDictionary:dict];
            self.infusionCategoryHash = [[self objectOrNilForKey:kQualityInfusionCategoryHash fromDictionary:dict] doubleValue];
    NSObject *receivedVersions = [dict objectForKey:kQualityVersions];
    NSMutableArray *parsedVersions = [NSMutableArray array];
    if ([receivedVersions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVersions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
             //   [parsedVersions addObject:[Versions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVersions isKindOfClass:[NSDictionary class]]) {
      // [parsedVersions addObject:[Versions modelObjectWithDictionary:(NSDictionary *)receivedVersions]];
    }

    self.versions = [NSArray arrayWithArray:parsedVersions];
            self.currentVersion = [[self objectOrNilForKey:kQualityCurrentVersion fromDictionary:dict] doubleValue];
            self.infusionCategoryHashes = [self objectOrNilForKey:kQualityInfusionCategoryHashes fromDictionary:dict];
            self.progressionLevelRequirementHash = [[self objectOrNilForKey:kQualityProgressionLevelRequirementHash fromDictionary:dict] doubleValue];
            self.displayVersionWatermarkIcons = [self objectOrNilForKey:kQualityDisplayVersionWatermarkIcons fromDictionary:dict];
            self.itemLevels = [self objectOrNilForKey:kQualityItemLevels fromDictionary:dict];
            self.qualityLevel = [[self objectOrNilForKey:kQualityQualityLevel fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.infusionCategoryName forKey:kQualityInfusionCategoryName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.infusionCategoryHash] forKey:kQualityInfusionCategoryHash];
    NSMutableArray *tempArrayForVersions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.versions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVersions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVersions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVersions] forKey:kQualityVersions];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentVersion] forKey:kQualityCurrentVersion];
    NSMutableArray *tempArrayForInfusionCategoryHashes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.infusionCategoryHashes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForInfusionCategoryHashes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForInfusionCategoryHashes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForInfusionCategoryHashes] forKey:kQualityInfusionCategoryHashes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.progressionLevelRequirementHash] forKey:kQualityProgressionLevelRequirementHash];
    NSMutableArray *tempArrayForDisplayVersionWatermarkIcons = [NSMutableArray array];
    for (NSObject *subArrayObject in self.displayVersionWatermarkIcons) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDisplayVersionWatermarkIcons addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDisplayVersionWatermarkIcons addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDisplayVersionWatermarkIcons] forKey:kQualityDisplayVersionWatermarkIcons];
    NSMutableArray *tempArrayForItemLevels = [NSMutableArray array];
    for (NSObject *subArrayObject in self.itemLevels) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemLevels addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemLevels addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemLevels] forKey:kQualityItemLevels];
    [mutableDict setValue:[NSNumber numberWithDouble:self.qualityLevel] forKey:kQualityQualityLevel];

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

    self.infusionCategoryName = [aDecoder decodeObjectForKey:kQualityInfusionCategoryName];
    self.infusionCategoryHash = [aDecoder decodeDoubleForKey:kQualityInfusionCategoryHash];
    self.versions = [aDecoder decodeObjectForKey:kQualityVersions];
    self.currentVersion = [aDecoder decodeDoubleForKey:kQualityCurrentVersion];
    self.infusionCategoryHashes = [aDecoder decodeObjectForKey:kQualityInfusionCategoryHashes];
    self.progressionLevelRequirementHash = [aDecoder decodeDoubleForKey:kQualityProgressionLevelRequirementHash];
    self.displayVersionWatermarkIcons = [aDecoder decodeObjectForKey:kQualityDisplayVersionWatermarkIcons];
    self.itemLevels = [aDecoder decodeObjectForKey:kQualityItemLevels];
    self.qualityLevel = [aDecoder decodeDoubleForKey:kQualityQualityLevel];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_infusionCategoryName forKey:kQualityInfusionCategoryName];
    [aCoder encodeDouble:_infusionCategoryHash forKey:kQualityInfusionCategoryHash];
    [aCoder encodeObject:_versions forKey:kQualityVersions];
    [aCoder encodeDouble:_currentVersion forKey:kQualityCurrentVersion];
    [aCoder encodeObject:_infusionCategoryHashes forKey:kQualityInfusionCategoryHashes];
    [aCoder encodeDouble:_progressionLevelRequirementHash forKey:kQualityProgressionLevelRequirementHash];
    [aCoder encodeObject:_displayVersionWatermarkIcons forKey:kQualityDisplayVersionWatermarkIcons];
    [aCoder encodeObject:_itemLevels forKey:kQualityItemLevels];
    [aCoder encodeDouble:_qualityLevel forKey:kQualityQualityLevel];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDQuality *copy = [[INVDQuality alloc] init];
    
    if (copy) {

        copy.infusionCategoryName = [self.infusionCategoryName copyWithZone:zone];
        copy.infusionCategoryHash = self.infusionCategoryHash;
        copy.versions = [self.versions copyWithZone:zone];
        copy.currentVersion = self.currentVersion;
        copy.infusionCategoryHashes = [self.infusionCategoryHashes copyWithZone:zone];
        copy.progressionLevelRequirementHash = self.progressionLevelRequirementHash;
        copy.displayVersionWatermarkIcons = [self.displayVersionWatermarkIcons copyWithZone:zone];
        copy.itemLevels = [self.itemLevels copyWithZone:zone];
        copy.qualityLevel = self.qualityLevel;
    }
    
    return copy;
}


@end
