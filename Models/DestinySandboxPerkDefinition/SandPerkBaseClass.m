//
//  SandPerkBaseClass.m
//
//  Created by Engel Alipio on 6/9/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "SandPerkBaseClass.h"
#import "SPDisplayProperties.h"


NSString *const kSandPerkBaseClassHash = @"hash";
NSString *const kSandPerkBaseClassBlacklisted = @"blacklisted";
NSString *const kSandPerkBaseClassRedacted = @"redacted";
NSString *const kSandPerkBaseClassIsDisplayable = @"isDisplayable";
NSString *const kSandPerkBaseClassDisplayProperties = @"displayProperties";
NSString *const kSandPerkBaseClassDamageType = @"damageType";
NSString *const kSandPerkBaseClassIndex = @"index";


@interface SandPerkBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SandPerkBaseClass

@synthesize hash = _hash;
@synthesize blacklisted = _blacklisted;
@synthesize redacted = _redacted;
@synthesize isDisplayable = _isDisplayable;
@synthesize displayProperties = _displayProperties;
@synthesize damageType = _damageType;
@synthesize index = _index;




+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kSandPerkBaseClassHash,@"hash",
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
            self.hash = [[self objectOrNilForKey:kSandPerkBaseClassHash fromDictionary:dict] doubleValue];
            self.blacklisted = [[self objectOrNilForKey:kSandPerkBaseClassBlacklisted fromDictionary:dict] boolValue];
            self.redacted = [[self objectOrNilForKey:kSandPerkBaseClassRedacted fromDictionary:dict] boolValue];
            self.isDisplayable = [[self objectOrNilForKey:kSandPerkBaseClassIsDisplayable fromDictionary:dict] boolValue];
            self.displayProperties = [SPDisplayProperties modelObjectWithDictionary:[dict objectForKey:kSandPerkBaseClassDisplayProperties]];
            self.damageType = [[self objectOrNilForKey:kSandPerkBaseClassDamageType fromDictionary:dict] doubleValue];
            self.index = [[self objectOrNilForKey:kSandPerkBaseClassIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kSandPerkBaseClassHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kSandPerkBaseClassBlacklisted];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kSandPerkBaseClassRedacted];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDisplayable] forKey:kSandPerkBaseClassIsDisplayable];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kSandPerkBaseClassDisplayProperties];
    [mutableDict setValue:[NSNumber numberWithDouble:self.damageType] forKey:kSandPerkBaseClassDamageType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kSandPerkBaseClassIndex];

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

    self.hash = [aDecoder decodeDoubleForKey:kSandPerkBaseClassHash];
    self.blacklisted = [aDecoder decodeBoolForKey:kSandPerkBaseClassBlacklisted];
    self.redacted = [aDecoder decodeBoolForKey:kSandPerkBaseClassRedacted];
    self.isDisplayable = [aDecoder decodeBoolForKey:kSandPerkBaseClassIsDisplayable];
    self.displayProperties = [aDecoder decodeObjectForKey:kSandPerkBaseClassDisplayProperties];
    self.damageType = [aDecoder decodeDoubleForKey:kSandPerkBaseClassDamageType];
    self.index = [aDecoder decodeDoubleForKey:kSandPerkBaseClassIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_hash forKey:kSandPerkBaseClassHash];
    [aCoder encodeBool:_blacklisted forKey:kSandPerkBaseClassBlacklisted];
    [aCoder encodeBool:_redacted forKey:kSandPerkBaseClassRedacted];
    [aCoder encodeBool:_isDisplayable forKey:kSandPerkBaseClassIsDisplayable];
    [aCoder encodeObject:_displayProperties forKey:kSandPerkBaseClassDisplayProperties];
    [aCoder encodeDouble:_damageType forKey:kSandPerkBaseClassDamageType];
    [aCoder encodeDouble:_index forKey:kSandPerkBaseClassIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    SandPerkBaseClass *copy = [[SandPerkBaseClass alloc] init];
    
    if (copy) {

        copy.hash = self.hash;
        copy.blacklisted = self.blacklisted;
        copy.redacted = self.redacted;
        copy.isDisplayable = self.isDisplayable;
        copy.displayProperties = [self.displayProperties copyWithZone:zone];
        copy.damageType = self.damageType;
        copy.index = self.index;
    }
    
    return copy;
}


@end
