//
//  StatDestinyStatDefinition.m
//
//  Created by Engel Alipio on 6/6/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "DestinyStatDefinition.h"
#import "StatDisplayProperties.h"


NSString *const kDestinyStatDefinitionInterpolate = @"interpolate";
NSString *const kDestinyStatDefinitionHash = @"hash";
NSString *const kDestinyStatDefinitionBlacklisted = @"blacklisted";
NSString *const kDestinyStatDefinitionRedacted = @"redacted";
NSString *const kDestinyStatDefinitionDisplayProperties = @"displayProperties";
NSString *const kDestinyStatDefinitionHasComputedBlock = @"hasComputedBlock";
NSString *const kDestinyStatDefinitionAggregationType = @"aggregationType";
NSString *const kDestinyStatDefinitionStatCategory = @"statCategory";
NSString *const kDestinyStatDefinitionIndex = @"index";


@interface DestinyStatDefinition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DestinyStatDefinition

@synthesize interpolate = _interpolate;
@synthesize hash = _hash;
@synthesize blacklisted = _blacklisted;
@synthesize redacted = _redacted;
@synthesize displayProperties = _displayProperties;
@synthesize hasComputedBlock = _hasComputedBlock;
@synthesize aggregationType = _aggregationType;
@synthesize statCategory = _statCategory;
@synthesize index = _index;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kDestinyStatDefinitionHash,@"hash",
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
            self.interpolate = [[self objectOrNilForKey:kDestinyStatDefinitionInterpolate fromDictionary:dict] boolValue];
            self.hash = [[self objectOrNilForKey:kDestinyStatDefinitionHash fromDictionary:dict] doubleValue];
            self.blacklisted = [[self objectOrNilForKey:kDestinyStatDefinitionBlacklisted fromDictionary:dict] boolValue];
            self.redacted = [[self objectOrNilForKey:kDestinyStatDefinitionRedacted fromDictionary:dict] boolValue];
            self.displayProperties = [StatDisplayProperties modelObjectWithDictionary:[dict objectForKey:kDestinyStatDefinitionDisplayProperties]];
            self.hasComputedBlock = [[self objectOrNilForKey:kDestinyStatDefinitionHasComputedBlock fromDictionary:dict] boolValue];
            self.aggregationType = [[self objectOrNilForKey:kDestinyStatDefinitionAggregationType fromDictionary:dict] doubleValue];
            self.statCategory = [[self objectOrNilForKey:kDestinyStatDefinitionStatCategory fromDictionary:dict] doubleValue];
            self.index = [[self objectOrNilForKey:kDestinyStatDefinitionIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.interpolate] forKey:kDestinyStatDefinitionInterpolate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kDestinyStatDefinitionHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kDestinyStatDefinitionBlacklisted];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kDestinyStatDefinitionRedacted];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kDestinyStatDefinitionDisplayProperties];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasComputedBlock] forKey:kDestinyStatDefinitionHasComputedBlock];
    [mutableDict setValue:[NSNumber numberWithDouble:self.aggregationType] forKey:kDestinyStatDefinitionAggregationType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statCategory] forKey:kDestinyStatDefinitionStatCategory];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kDestinyStatDefinitionIndex];

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

    self.interpolate = [aDecoder decodeBoolForKey:kDestinyStatDefinitionInterpolate];
    self.hash = [aDecoder decodeDoubleForKey:kDestinyStatDefinitionHash];
    self.blacklisted = [aDecoder decodeBoolForKey:kDestinyStatDefinitionBlacklisted];
    self.redacted = [aDecoder decodeBoolForKey:kDestinyStatDefinitionRedacted];
    self.displayProperties = [aDecoder decodeObjectForKey:kDestinyStatDefinitionDisplayProperties];
    self.hasComputedBlock = [aDecoder decodeBoolForKey:kDestinyStatDefinitionHasComputedBlock];
    self.aggregationType = [aDecoder decodeDoubleForKey:kDestinyStatDefinitionAggregationType];
    self.statCategory = [aDecoder decodeDoubleForKey:kDestinyStatDefinitionStatCategory];
    self.index = [aDecoder decodeDoubleForKey:kDestinyStatDefinitionIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_interpolate forKey:kDestinyStatDefinitionInterpolate];
    [aCoder encodeDouble:_hash forKey:kDestinyStatDefinitionHash];
    [aCoder encodeBool:_blacklisted forKey:kDestinyStatDefinitionBlacklisted];
    [aCoder encodeBool:_redacted forKey:kDestinyStatDefinitionRedacted];
    [aCoder encodeObject:_displayProperties forKey:kDestinyStatDefinitionDisplayProperties];
    [aCoder encodeBool:_hasComputedBlock forKey:kDestinyStatDefinitionHasComputedBlock];
    [aCoder encodeDouble:_aggregationType forKey:kDestinyStatDefinitionAggregationType];
    [aCoder encodeDouble:_statCategory forKey:kDestinyStatDefinitionStatCategory];
    [aCoder encodeDouble:_index forKey:kDestinyStatDefinitionIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    DestinyStatDefinition *copy = [[DestinyStatDefinition alloc] init];
    
    if (copy) {

        copy.interpolate = self.interpolate;
        copy.hash = self.hash;
        copy.blacklisted = self.blacklisted;
        copy.redacted = self.redacted;
        copy.displayProperties = [self.displayProperties copyWithZone:zone];
        copy.hasComputedBlock = self.hasComputedBlock;
        copy.aggregationType = self.aggregationType;
        copy.statCategory = self.statCategory;
        copy.index = self.index;
    }
    
    return copy;
}


@end
