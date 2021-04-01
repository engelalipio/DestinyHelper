//
//  ClanBannerData.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "ClanBannerData.h"


NSString *const kClanBannerDataDecalId = @"decalId";
NSString *const kClanBannerDataGonfalonId = @"gonfalonId";
NSString *const kClanBannerDataDecalBackgroundColorId = @"decalBackgroundColorId";
NSString *const kClanBannerDataDecalColorId = @"decalColorId";
NSString *const kClanBannerDataGonfalonColorId = @"gonfalonColorId";
NSString *const kClanBannerDataGonfalonDetailId = @"gonfalonDetailId";
NSString *const kClanBannerDataGonfalonDetailColorId = @"gonfalonDetailColorId";


@interface ClanBannerData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ClanBannerData

@synthesize decalId = _decalId;
@synthesize gonfalonId = _gonfalonId;
@synthesize decalBackgroundColorId = _decalBackgroundColorId;
@synthesize decalColorId = _decalColorId;
@synthesize gonfalonColorId = _gonfalonColorId;
@synthesize gonfalonDetailId = _gonfalonDetailId;
@synthesize gonfalonDetailColorId = _gonfalonDetailColorId;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kClanBannerDataDecalId,@"decalId",
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
            self.decalId = [[self objectOrNilForKey:kClanBannerDataDecalId fromDictionary:dict] doubleValue];
            self.gonfalonId = [[self objectOrNilForKey:kClanBannerDataGonfalonId fromDictionary:dict] doubleValue];
            self.decalBackgroundColorId = [[self objectOrNilForKey:kClanBannerDataDecalBackgroundColorId fromDictionary:dict] doubleValue];
            self.decalColorId = [[self objectOrNilForKey:kClanBannerDataDecalColorId fromDictionary:dict] doubleValue];
            self.gonfalonColorId = [[self objectOrNilForKey:kClanBannerDataGonfalonColorId fromDictionary:dict] doubleValue];
            self.gonfalonDetailId = [[self objectOrNilForKey:kClanBannerDataGonfalonDetailId fromDictionary:dict] doubleValue];
            self.gonfalonDetailColorId = [[self objectOrNilForKey:kClanBannerDataGonfalonDetailColorId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.decalId] forKey:kClanBannerDataDecalId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gonfalonId] forKey:kClanBannerDataGonfalonId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.decalBackgroundColorId] forKey:kClanBannerDataDecalBackgroundColorId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.decalColorId] forKey:kClanBannerDataDecalColorId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gonfalonColorId] forKey:kClanBannerDataGonfalonColorId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gonfalonDetailId] forKey:kClanBannerDataGonfalonDetailId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gonfalonDetailColorId] forKey:kClanBannerDataGonfalonDetailColorId];

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

    self.decalId = [aDecoder decodeDoubleForKey:kClanBannerDataDecalId];
    self.gonfalonId = [aDecoder decodeDoubleForKey:kClanBannerDataGonfalonId];
    self.decalBackgroundColorId = [aDecoder decodeDoubleForKey:kClanBannerDataDecalBackgroundColorId];
    self.decalColorId = [aDecoder decodeDoubleForKey:kClanBannerDataDecalColorId];
    self.gonfalonColorId = [aDecoder decodeDoubleForKey:kClanBannerDataGonfalonColorId];
    self.gonfalonDetailId = [aDecoder decodeDoubleForKey:kClanBannerDataGonfalonDetailId];
    self.gonfalonDetailColorId = [aDecoder decodeDoubleForKey:kClanBannerDataGonfalonDetailColorId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_decalId forKey:kClanBannerDataDecalId];
    [aCoder encodeDouble:_gonfalonId forKey:kClanBannerDataGonfalonId];
    [aCoder encodeDouble:_decalBackgroundColorId forKey:kClanBannerDataDecalBackgroundColorId];
    [aCoder encodeDouble:_decalColorId forKey:kClanBannerDataDecalColorId];
    [aCoder encodeDouble:_gonfalonColorId forKey:kClanBannerDataGonfalonColorId];
    [aCoder encodeDouble:_gonfalonDetailId forKey:kClanBannerDataGonfalonDetailId];
    [aCoder encodeDouble:_gonfalonDetailColorId forKey:kClanBannerDataGonfalonDetailColorId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ClanBannerData *copy = [[ClanBannerData alloc] init];
    
    if (copy) {

        copy.decalId = self.decalId;
        copy.gonfalonId = self.gonfalonId;
        copy.decalBackgroundColorId = self.decalBackgroundColorId;
        copy.decalColorId = self.decalColorId;
        copy.gonfalonColorId = self.gonfalonColorId;
        copy.gonfalonDetailId = self.gonfalonDetailId;
        copy.gonfalonDetailColorId = self.gonfalonDetailColorId;
    }
    
    return copy;
}


@end
