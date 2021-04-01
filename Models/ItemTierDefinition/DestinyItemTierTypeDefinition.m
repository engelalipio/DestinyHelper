//
//  DestinyItemTierDefinition.m
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "DestinyItemTierTypeDefinition.h"
#import "ITMTInfusionProcess.h"
#import "ITMTDisplayProperties.h"


NSString *const kDestinyItemTierDefinitionRedacted = @"redacted";
NSString *const kDestinyItemTierDefinitionHash = @"hash";
NSString *const kDestinyItemTierDefinitionInfusionProcess = @"infusionProcess";
NSString *const kDestinyItemTierDefinitionBlacklisted = @"blacklisted";
NSString *const kDestinyItemTierDefinitionDisplayProperties = @"displayProperties";
NSString *const kDestinyItemTierDefinitionIndex = @"index";


@interface DestinyItemTierTypeDefinition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DestinyItemTierTypeDefinition

@synthesize redacted = _redacted;
@synthesize hash = _hash;
@synthesize infusionProcess = _infusionProcess;
@synthesize blacklisted = _blacklisted;
@synthesize displayProperties = _displayProperties;
@synthesize index = _index;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kDestinyItemTierDefinitionHash,@"hash",
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
            self.redacted = [[self objectOrNilForKey:kDestinyItemTierDefinitionRedacted fromDictionary:dict] boolValue];
            self.hash = [[self objectOrNilForKey:kDestinyItemTierDefinitionHash fromDictionary:dict] doubleValue];
            self.infusionProcess = [ITMTInfusionProcess modelObjectWithDictionary:[dict objectForKey:kDestinyItemTierDefinitionInfusionProcess]];
            self.blacklisted = [[self objectOrNilForKey:kDestinyItemTierDefinitionBlacklisted fromDictionary:dict] boolValue];
            self.displayProperties = [ITMTDisplayProperties modelObjectWithDictionary:[dict objectForKey:kDestinyItemTierDefinitionDisplayProperties]];
            self.index = [[self objectOrNilForKey:kDestinyItemTierDefinitionIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kDestinyItemTierDefinitionRedacted];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kDestinyItemTierDefinitionHash];
    [mutableDict setValue:[self.infusionProcess dictionaryRepresentation] forKey:kDestinyItemTierDefinitionInfusionProcess];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kDestinyItemTierDefinitionBlacklisted];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kDestinyItemTierDefinitionDisplayProperties];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kDestinyItemTierDefinitionIndex];

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

    self.redacted = [aDecoder decodeBoolForKey:kDestinyItemTierDefinitionRedacted];
    self.hash = [aDecoder decodeDoubleForKey:kDestinyItemTierDefinitionHash];
    self.infusionProcess = [aDecoder decodeObjectForKey:kDestinyItemTierDefinitionInfusionProcess];
    self.blacklisted = [aDecoder decodeBoolForKey:kDestinyItemTierDefinitionBlacklisted];
    self.displayProperties = [aDecoder decodeObjectForKey:kDestinyItemTierDefinitionDisplayProperties];
    self.index = [aDecoder decodeDoubleForKey:kDestinyItemTierDefinitionIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_redacted forKey:kDestinyItemTierDefinitionRedacted];
    [aCoder encodeDouble:_hash forKey:kDestinyItemTierDefinitionHash];
    [aCoder encodeObject:_infusionProcess forKey:kDestinyItemTierDefinitionInfusionProcess];
    [aCoder encodeBool:_blacklisted forKey:kDestinyItemTierDefinitionBlacklisted];
    [aCoder encodeObject:_displayProperties forKey:kDestinyItemTierDefinitionDisplayProperties];
    [aCoder encodeDouble:_index forKey:kDestinyItemTierDefinitionIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    DestinyItemTierTypeDefinition *copy = [[DestinyItemTierTypeDefinition alloc] init];
    
    if (copy) {

        copy.redacted = self.redacted;
        copy.hash = self.hash;
        copy.infusionProcess = [self.infusionProcess copyWithZone:zone];
        copy.blacklisted = self.blacklisted;
        copy.displayProperties = [self.displayProperties copyWithZone:zone];
        copy.index = self.index;
    }
    
    return copy;
}


@end
