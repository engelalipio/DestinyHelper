//
//  GRDCharacters.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDCharacters.h"
#import "GRDCharacterBase.h"
#import "GRDLevelProgression.h"


NSString *const kGRDCharactersCharacterBase = @"characterBase";
NSString *const kGRDCharactersLevelProgression = @"levelProgression";
NSString *const kGRDCharactersEmblemPath = @"emblemPath";
NSString *const kGRDCharactersEmblemHash = @"emblemHash";
NSString *const kGRDCharactersBackgroundPath = @"backgroundPath";
NSString *const kGRDCharactersCharacterLevel = @"characterLevel";
NSString *const kGRDCharactersBaseCharacterLevel = @"baseCharacterLevel";
NSString *const kGRDCharactersIsPrestigeLevel = @"isPrestigeLevel";
NSString *const kGRDCharactersPercentToNextLevel = @"percentToNextLevel";


@interface GRDCharacters ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDCharacters

@synthesize characterBase = _characterBase;
@synthesize levelProgression = _levelProgression;
@synthesize emblemPath = _emblemPath;
@synthesize emblemHash = _emblemHash;
@synthesize backgroundPath = _backgroundPath;
@synthesize characterLevel = _characterLevel;
@synthesize baseCharacterLevel = _baseCharacterLevel;
@synthesize isPrestigeLevel = _isPrestigeLevel;
@synthesize percentToNextLevel = _percentToNextLevel;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGRDCharactersCharacterBase,@"characterBase",
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
            self.characterBase = [GRDCharacterBase modelObjectWithDictionary:[dict objectForKey:kGRDCharactersCharacterBase]];
            self.levelProgression = [GRDLevelProgression modelObjectWithDictionary:[dict objectForKey:kGRDCharactersLevelProgression]];
            self.emblemPath = [self objectOrNilForKey:kGRDCharactersEmblemPath fromDictionary:dict];
            self.emblemHash = [[self objectOrNilForKey:kGRDCharactersEmblemHash fromDictionary:dict] doubleValue];
            self.backgroundPath = [self objectOrNilForKey:kGRDCharactersBackgroundPath fromDictionary:dict];
            self.characterLevel = [[self objectOrNilForKey:kGRDCharactersCharacterLevel fromDictionary:dict] doubleValue];
            self.baseCharacterLevel = [[self objectOrNilForKey:kGRDCharactersBaseCharacterLevel fromDictionary:dict] doubleValue];
            self.isPrestigeLevel = [[self objectOrNilForKey:kGRDCharactersIsPrestigeLevel fromDictionary:dict] boolValue];
            self.percentToNextLevel = [[self objectOrNilForKey:kGRDCharactersPercentToNextLevel fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.characterBase dictionaryRepresentation] forKey:kGRDCharactersCharacterBase];
    [mutableDict setValue:[self.levelProgression dictionaryRepresentation] forKey:kGRDCharactersLevelProgression];
    [mutableDict setValue:self.emblemPath forKey:kGRDCharactersEmblemPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.emblemHash] forKey:kGRDCharactersEmblemHash];
    [mutableDict setValue:self.backgroundPath forKey:kGRDCharactersBackgroundPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.characterLevel] forKey:kGRDCharactersCharacterLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseCharacterLevel] forKey:kGRDCharactersBaseCharacterLevel];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPrestigeLevel] forKey:kGRDCharactersIsPrestigeLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.percentToNextLevel] forKey:kGRDCharactersPercentToNextLevel];

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

    self.characterBase = [aDecoder decodeObjectForKey:kGRDCharactersCharacterBase];
    self.levelProgression = [aDecoder decodeObjectForKey:kGRDCharactersLevelProgression];
    self.emblemPath = [aDecoder decodeObjectForKey:kGRDCharactersEmblemPath];
    self.emblemHash = [aDecoder decodeDoubleForKey:kGRDCharactersEmblemHash];
    self.backgroundPath = [aDecoder decodeObjectForKey:kGRDCharactersBackgroundPath];
    self.characterLevel = [aDecoder decodeDoubleForKey:kGRDCharactersCharacterLevel];
    self.baseCharacterLevel = [aDecoder decodeDoubleForKey:kGRDCharactersBaseCharacterLevel];
    self.isPrestigeLevel = [aDecoder decodeBoolForKey:kGRDCharactersIsPrestigeLevel];
    self.percentToNextLevel = [aDecoder decodeDoubleForKey:kGRDCharactersPercentToNextLevel];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_characterBase forKey:kGRDCharactersCharacterBase];
    [aCoder encodeObject:_levelProgression forKey:kGRDCharactersLevelProgression];
    [aCoder encodeObject:_emblemPath forKey:kGRDCharactersEmblemPath];
    [aCoder encodeDouble:_emblemHash forKey:kGRDCharactersEmblemHash];
    [aCoder encodeObject:_backgroundPath forKey:kGRDCharactersBackgroundPath];
    [aCoder encodeDouble:_characterLevel forKey:kGRDCharactersCharacterLevel];
    [aCoder encodeDouble:_baseCharacterLevel forKey:kGRDCharactersBaseCharacterLevel];
    [aCoder encodeBool:_isPrestigeLevel forKey:kGRDCharactersIsPrestigeLevel];
    [aCoder encodeDouble:_percentToNextLevel forKey:kGRDCharactersPercentToNextLevel];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDCharacters *copy = [[GRDCharacters alloc] init];
    
    if (copy) {

        copy.characterBase = [self.characterBase copyWithZone:zone];
        copy.levelProgression = [self.levelProgression copyWithZone:zone];
        copy.emblemPath = [self.emblemPath copyWithZone:zone];
        copy.emblemHash = self.emblemHash;
        copy.backgroundPath = [self.backgroundPath copyWithZone:zone];
        copy.characterLevel = self.characterLevel;
        copy.baseCharacterLevel = self.baseCharacterLevel;
        copy.isPrestigeLevel = self.isPrestigeLevel;
        copy.percentToNextLevel = self.percentToNextLevel;
    }
    
    return copy;
}


@end
