//
//  MobileGearAssetDataBases.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "MobileGearAssetDataBases.h"


NSString *const kMobileGearAssetDataBasesVersion = @"version";
NSString *const kMobileGearAssetDataBasesPath = @"path";


@interface MobileGearAssetDataBases ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MobileGearAssetDataBases

@synthesize version = _version;
@synthesize path = _path;


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
            self.version = [[self objectOrNilForKey:kMobileGearAssetDataBasesVersion fromDictionary:dict] doubleValue];
            self.path = [self objectOrNilForKey:kMobileGearAssetDataBasesPath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.version] forKey:kMobileGearAssetDataBasesVersion];
    [mutableDict setValue:self.path forKey:kMobileGearAssetDataBasesPath];

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

    self.version = [aDecoder decodeDoubleForKey:kMobileGearAssetDataBasesVersion];
    self.path = [aDecoder decodeObjectForKey:kMobileGearAssetDataBasesPath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_version forKey:kMobileGearAssetDataBasesVersion];
    [aCoder encodeObject:_path forKey:kMobileGearAssetDataBasesPath];
}

- (id)copyWithZone:(NSZone *)zone
{
    MobileGearAssetDataBases *copy = [[MobileGearAssetDataBases alloc] init];
    
    if (copy) {

        copy.version = self.version;
        copy.path = [self.path copyWithZone:zone];
    }
    
    return copy;
}


@end
