//
//  MobileGearCDN.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "MobileGearCDN.h"


NSString *const kMobileGearCDNGear = @"Gear";
NSString *const kMobileGearCDNTexture = @"Texture";
NSString *const kMobileGearCDNGeometry = @"Geometry";
NSString *const kMobileGearCDNShader = @"Shader";
NSString *const kMobileGearCDNPlateRegion = @"PlateRegion";


@interface MobileGearCDN ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MobileGearCDN

@synthesize gear = _gear;
@synthesize texture = _texture;
@synthesize geometry = _geometry;
@synthesize shader = _shader;
@synthesize plateRegion = _plateRegion;


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
            self.gear = [self objectOrNilForKey:kMobileGearCDNGear fromDictionary:dict];
            self.texture = [self objectOrNilForKey:kMobileGearCDNTexture fromDictionary:dict];
            self.geometry = [self objectOrNilForKey:kMobileGearCDNGeometry fromDictionary:dict];
            self.shader = [self objectOrNilForKey:kMobileGearCDNShader fromDictionary:dict];
            self.plateRegion = [self objectOrNilForKey:kMobileGearCDNPlateRegion fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.gear forKey:kMobileGearCDNGear];
    [mutableDict setValue:self.texture forKey:kMobileGearCDNTexture];
    [mutableDict setValue:self.geometry forKey:kMobileGearCDNGeometry];
    [mutableDict setValue:self.shader forKey:kMobileGearCDNShader];
    [mutableDict setValue:self.plateRegion forKey:kMobileGearCDNPlateRegion];

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

    self.gear = [aDecoder decodeObjectForKey:kMobileGearCDNGear];
    self.texture = [aDecoder decodeObjectForKey:kMobileGearCDNTexture];
    self.geometry = [aDecoder decodeObjectForKey:kMobileGearCDNGeometry];
    self.shader = [aDecoder decodeObjectForKey:kMobileGearCDNShader];
    self.plateRegion = [aDecoder decodeObjectForKey:kMobileGearCDNPlateRegion];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_gear forKey:kMobileGearCDNGear];
    [aCoder encodeObject:_texture forKey:kMobileGearCDNTexture];
    [aCoder encodeObject:_geometry forKey:kMobileGearCDNGeometry];
    [aCoder encodeObject:_shader forKey:kMobileGearCDNShader];
    [aCoder encodeObject:_plateRegion forKey:kMobileGearCDNPlateRegion];
}

- (id)copyWithZone:(NSZone *)zone
{
    MobileGearCDN *copy = [[MobileGearCDN alloc] init];
    
    if (copy) {

        copy.gear = [self.gear copyWithZone:zone];
        copy.texture = [self.texture copyWithZone:zone];
        copy.geometry = [self.geometry copyWithZone:zone];
        copy.shader = [self.shader copyWithZone:zone];
        copy.plateRegion = [self.plateRegion copyWithZone:zone];
    }
    
    return copy;
}


@end
