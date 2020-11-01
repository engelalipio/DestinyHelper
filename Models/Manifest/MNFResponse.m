//
//  Response.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "MNFResponse.h"
#import "JsonWorldComponentContentPaths.h"
#import "MobileWorldContentPaths.h"
#import "MobileGearAssetDataBases.h"
#import "JsonWorldContentPaths.h"
#import "MobileGearCDN.h"


NSString *const kResponseJsonWorldComponentContentPaths = @"jsonWorldComponentContentPaths";
NSString *const kResponseMobileWorldContentPaths = @"mobileWorldContentPaths";
NSString *const kResponseMobileClanBannerDatabasePath = @"mobileClanBannerDatabasePath";
NSString *const kResponseMobileGearAssetDataBases = @"mobileGearAssetDataBases";
NSString *const kResponseMobileAssetContentPath = @"mobileAssetContentPath";
NSString *const kResponseJsonWorldContentPaths = @"jsonWorldContentPaths";
NSString *const kResponseVersion = @"version";
NSString *const kResponseIconImagePyramidInfo = @"iconImagePyramidInfo";
NSString *const kResponseMobileGearCDN = @"mobileGearCDN";


@interface MNFResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MNFResponse

@synthesize jsonWorldComponentContentPaths = _jsonWorldComponentContentPaths;
@synthesize mobileWorldContentPaths = _mobileWorldContentPaths;
@synthesize mobileClanBannerDatabasePath = _mobileClanBannerDatabasePath;
@synthesize mobileGearAssetDataBases = _mobileGearAssetDataBases;
@synthesize mobileAssetContentPath = _mobileAssetContentPath;
@synthesize jsonWorldContentPaths = _jsonWorldContentPaths;
@synthesize version = _version;
@synthesize iconImagePyramidInfo = _iconImagePyramidInfo;
@synthesize mobileGearCDN = _mobileGearCDN;


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
            self.jsonWorldComponentContentPaths = [JsonWorldComponentContentPaths modelObjectWithDictionary:[dict objectForKey:kResponseJsonWorldComponentContentPaths]];
            self.mobileWorldContentPaths = [MobileWorldContentPaths modelObjectWithDictionary:[dict objectForKey:kResponseMobileWorldContentPaths]];
            self.mobileClanBannerDatabasePath = [self objectOrNilForKey:kResponseMobileClanBannerDatabasePath fromDictionary:dict];
    NSObject *receivedMobileGearAssetDataBases = [dict objectForKey:kResponseMobileGearAssetDataBases];
    NSMutableArray *parsedMobileGearAssetDataBases = [NSMutableArray array];
    if ([receivedMobileGearAssetDataBases isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMobileGearAssetDataBases) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMobileGearAssetDataBases addObject:[MobileGearAssetDataBases modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMobileGearAssetDataBases isKindOfClass:[NSDictionary class]]) {
       [parsedMobileGearAssetDataBases addObject:[MobileGearAssetDataBases modelObjectWithDictionary:(NSDictionary *)receivedMobileGearAssetDataBases]];
    }

    self.mobileGearAssetDataBases = [NSArray arrayWithArray:parsedMobileGearAssetDataBases];
            self.mobileAssetContentPath = [self objectOrNilForKey:kResponseMobileAssetContentPath fromDictionary:dict];
            self.jsonWorldContentPaths = [JsonWorldContentPaths modelObjectWithDictionary:[dict objectForKey:kResponseJsonWorldContentPaths]];
            self.version = [self objectOrNilForKey:kResponseVersion fromDictionary:dict];
            self.iconImagePyramidInfo = [self objectOrNilForKey:kResponseIconImagePyramidInfo fromDictionary:dict];
            self.mobileGearCDN = [MobileGearCDN modelObjectWithDictionary:[dict objectForKey:kResponseMobileGearCDN]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.jsonWorldComponentContentPaths dictionaryRepresentation] forKey:kResponseJsonWorldComponentContentPaths];
    [mutableDict setValue:[self.mobileWorldContentPaths dictionaryRepresentation] forKey:kResponseMobileWorldContentPaths];
    [mutableDict setValue:self.mobileClanBannerDatabasePath forKey:kResponseMobileClanBannerDatabasePath];
    NSMutableArray *tempArrayForMobileGearAssetDataBases = [NSMutableArray array];
    for (NSObject *subArrayObject in self.mobileGearAssetDataBases) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMobileGearAssetDataBases addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMobileGearAssetDataBases addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMobileGearAssetDataBases] forKey:kResponseMobileGearAssetDataBases];
    [mutableDict setValue:self.mobileAssetContentPath forKey:kResponseMobileAssetContentPath];
    [mutableDict setValue:[self.jsonWorldContentPaths dictionaryRepresentation] forKey:kResponseJsonWorldContentPaths];
    [mutableDict setValue:self.version forKey:kResponseVersion];
    NSMutableArray *tempArrayForIconImagePyramidInfo = [NSMutableArray array];
    for (NSObject *subArrayObject in self.iconImagePyramidInfo) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIconImagePyramidInfo addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIconImagePyramidInfo addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIconImagePyramidInfo] forKey:kResponseIconImagePyramidInfo];
    [mutableDict setValue:[self.mobileGearCDN dictionaryRepresentation] forKey:kResponseMobileGearCDN];

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

    self.jsonWorldComponentContentPaths = [aDecoder decodeObjectForKey:kResponseJsonWorldComponentContentPaths];
    self.mobileWorldContentPaths = [aDecoder decodeObjectForKey:kResponseMobileWorldContentPaths];
    self.mobileClanBannerDatabasePath = [aDecoder decodeObjectForKey:kResponseMobileClanBannerDatabasePath];
    self.mobileGearAssetDataBases = [aDecoder decodeObjectForKey:kResponseMobileGearAssetDataBases];
    self.mobileAssetContentPath = [aDecoder decodeObjectForKey:kResponseMobileAssetContentPath];
    self.jsonWorldContentPaths = [aDecoder decodeObjectForKey:kResponseJsonWorldContentPaths];
    self.version = [aDecoder decodeObjectForKey:kResponseVersion];
    self.iconImagePyramidInfo = [aDecoder decodeObjectForKey:kResponseIconImagePyramidInfo];
    self.mobileGearCDN = [aDecoder decodeObjectForKey:kResponseMobileGearCDN];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_jsonWorldComponentContentPaths forKey:kResponseJsonWorldComponentContentPaths];
    [aCoder encodeObject:_mobileWorldContentPaths forKey:kResponseMobileWorldContentPaths];
    [aCoder encodeObject:_mobileClanBannerDatabasePath forKey:kResponseMobileClanBannerDatabasePath];
    [aCoder encodeObject:_mobileGearAssetDataBases forKey:kResponseMobileGearAssetDataBases];
    [aCoder encodeObject:_mobileAssetContentPath forKey:kResponseMobileAssetContentPath];
    [aCoder encodeObject:_jsonWorldContentPaths forKey:kResponseJsonWorldContentPaths];
    [aCoder encodeObject:_version forKey:kResponseVersion];
    [aCoder encodeObject:_iconImagePyramidInfo forKey:kResponseIconImagePyramidInfo];
    [aCoder encodeObject:_mobileGearCDN forKey:kResponseMobileGearCDN];
}

- (id)copyWithZone:(NSZone *)zone
{
    MNFResponse *copy = [[MNFResponse alloc] init];
    
    if (copy) {

        copy.jsonWorldComponentContentPaths = [self.jsonWorldComponentContentPaths copyWithZone:zone];
        copy.mobileWorldContentPaths = [self.mobileWorldContentPaths copyWithZone:zone];
        copy.mobileClanBannerDatabasePath = [self.mobileClanBannerDatabasePath copyWithZone:zone];
        copy.mobileGearAssetDataBases = [self.mobileGearAssetDataBases copyWithZone:zone];
        copy.mobileAssetContentPath = [self.mobileAssetContentPath copyWithZone:zone];
        copy.jsonWorldContentPaths = [self.jsonWorldContentPaths copyWithZone:zone];
        copy.version = [self.version copyWithZone:zone];
        copy.iconImagePyramidInfo = [self.iconImagePyramidInfo copyWithZone:zone];
        copy.mobileGearCDN = [self.mobileGearCDN copyWithZone:zone];
    }
    
    return copy;
}


@end
