//
//  GRDCustomization.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDCustomization.h"


NSString *const kGRDCustomizationSkinColor = @"skinColor";
NSString *const kGRDCustomizationHairIndex = @"hairIndex";
NSString *const kGRDCustomizationFeatureColor = @"featureColor";
NSString *const kGRDCustomizationWearHelmet = @"wearHelmet";
NSString *const kGRDCustomizationEyeColor = @"eyeColor";
NSString *const kGRDCustomizationDecalColor = @"decalColor";
NSString *const kGRDCustomizationHairColor = @"hairColor";
NSString *const kGRDCustomizationPersonality = @"personality";
NSString *const kGRDCustomizationDecalIndex = @"decalIndex";
NSString *const kGRDCustomizationFeatureIndex = @"featureIndex";
NSString *const kGRDCustomizationLipColor = @"lipColor";
NSString *const kGRDCustomizationFace = @"face";


@interface GRDCustomization ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDCustomization

@synthesize skinColor = _skinColor;
@synthesize hairIndex = _hairIndex;
@synthesize featureColor = _featureColor;
@synthesize wearHelmet = _wearHelmet;
@synthesize eyeColor = _eyeColor;
@synthesize decalColor = _decalColor;
@synthesize hairColor = _hairColor;
@synthesize personality = _personality;
@synthesize decalIndex = _decalIndex;
@synthesize featureIndex = _featureIndex;
@synthesize lipColor = _lipColor;
@synthesize face = _face;


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
            self.skinColor = [[self objectOrNilForKey:kGRDCustomizationSkinColor fromDictionary:dict] doubleValue];
            self.hairIndex = [[self objectOrNilForKey:kGRDCustomizationHairIndex fromDictionary:dict] doubleValue];
            self.featureColor = [[self objectOrNilForKey:kGRDCustomizationFeatureColor fromDictionary:dict] doubleValue];
            self.wearHelmet = [[self objectOrNilForKey:kGRDCustomizationWearHelmet fromDictionary:dict] boolValue];
            self.eyeColor = [[self objectOrNilForKey:kGRDCustomizationEyeColor fromDictionary:dict] doubleValue];
            self.decalColor = [[self objectOrNilForKey:kGRDCustomizationDecalColor fromDictionary:dict] doubleValue];
            self.hairColor = [[self objectOrNilForKey:kGRDCustomizationHairColor fromDictionary:dict] doubleValue];
            self.personality = [[self objectOrNilForKey:kGRDCustomizationPersonality fromDictionary:dict] doubleValue];
            self.decalIndex = [[self objectOrNilForKey:kGRDCustomizationDecalIndex fromDictionary:dict] doubleValue];
            self.featureIndex = [[self objectOrNilForKey:kGRDCustomizationFeatureIndex fromDictionary:dict] doubleValue];
            self.lipColor = [[self objectOrNilForKey:kGRDCustomizationLipColor fromDictionary:dict] doubleValue];
            self.face = [[self objectOrNilForKey:kGRDCustomizationFace fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.skinColor] forKey:kGRDCustomizationSkinColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hairIndex] forKey:kGRDCustomizationHairIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.featureColor] forKey:kGRDCustomizationFeatureColor];
    [mutableDict setValue:[NSNumber numberWithBool:self.wearHelmet] forKey:kGRDCustomizationWearHelmet];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eyeColor] forKey:kGRDCustomizationEyeColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.decalColor] forKey:kGRDCustomizationDecalColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hairColor] forKey:kGRDCustomizationHairColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.personality] forKey:kGRDCustomizationPersonality];
    [mutableDict setValue:[NSNumber numberWithDouble:self.decalIndex] forKey:kGRDCustomizationDecalIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.featureIndex] forKey:kGRDCustomizationFeatureIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lipColor] forKey:kGRDCustomizationLipColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.face] forKey:kGRDCustomizationFace];

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

    self.skinColor = [aDecoder decodeDoubleForKey:kGRDCustomizationSkinColor];
    self.hairIndex = [aDecoder decodeDoubleForKey:kGRDCustomizationHairIndex];
    self.featureColor = [aDecoder decodeDoubleForKey:kGRDCustomizationFeatureColor];
    self.wearHelmet = [aDecoder decodeBoolForKey:kGRDCustomizationWearHelmet];
    self.eyeColor = [aDecoder decodeDoubleForKey:kGRDCustomizationEyeColor];
    self.decalColor = [aDecoder decodeDoubleForKey:kGRDCustomizationDecalColor];
    self.hairColor = [aDecoder decodeDoubleForKey:kGRDCustomizationHairColor];
    self.personality = [aDecoder decodeDoubleForKey:kGRDCustomizationPersonality];
    self.decalIndex = [aDecoder decodeDoubleForKey:kGRDCustomizationDecalIndex];
    self.featureIndex = [aDecoder decodeDoubleForKey:kGRDCustomizationFeatureIndex];
    self.lipColor = [aDecoder decodeDoubleForKey:kGRDCustomizationLipColor];
    self.face = [aDecoder decodeDoubleForKey:kGRDCustomizationFace];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_skinColor forKey:kGRDCustomizationSkinColor];
    [aCoder encodeDouble:_hairIndex forKey:kGRDCustomizationHairIndex];
    [aCoder encodeDouble:_featureColor forKey:kGRDCustomizationFeatureColor];
    [aCoder encodeBool:_wearHelmet forKey:kGRDCustomizationWearHelmet];
    [aCoder encodeDouble:_eyeColor forKey:kGRDCustomizationEyeColor];
    [aCoder encodeDouble:_decalColor forKey:kGRDCustomizationDecalColor];
    [aCoder encodeDouble:_hairColor forKey:kGRDCustomizationHairColor];
    [aCoder encodeDouble:_personality forKey:kGRDCustomizationPersonality];
    [aCoder encodeDouble:_decalIndex forKey:kGRDCustomizationDecalIndex];
    [aCoder encodeDouble:_featureIndex forKey:kGRDCustomizationFeatureIndex];
    [aCoder encodeDouble:_lipColor forKey:kGRDCustomizationLipColor];
    [aCoder encodeDouble:_face forKey:kGRDCustomizationFace];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDCustomization *copy = [[GRDCustomization alloc] init];
    
    if (copy) {

        copy.skinColor = self.skinColor;
        copy.hairIndex = self.hairIndex;
        copy.featureColor = self.featureColor;
        copy.wearHelmet = self.wearHelmet;
        copy.eyeColor = self.eyeColor;
        copy.decalColor = self.decalColor;
        copy.hairColor = self.hairColor;
        copy.personality = self.personality;
        copy.decalIndex = self.decalIndex;
        copy.featureIndex = self.featureIndex;
        copy.lipColor = self.lipColor;
        copy.face = self.face;
    }
    
    return copy;
}


@end
