//
//  Warlock.m
//  2271682572
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "WarlockClass.h"
#import "GenderedClassNamesByGenderHash.h"
#import "DisplayProperties.h"
#import "GenderedClassNames.h"


NSString *const kWarlockClassType = @"classType";
NSString *const kWarlockHash = @"hash";
NSString *const kWarlockBlacklisted = @"blacklisted";
NSString *const kWarlockGenderedClassNamesByGenderHash = @"genderedClassNamesByGenderHash";
NSString *const kWarlockRedacted = @"redacted";
NSString *const kWarlockDisplayProperties = @"displayProperties";
NSString *const kWarlockGenderedClassNames = @"genderedClassNames";
NSString *const kWarlockIndex = @"index";


@interface Warlock ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Warlock

@synthesize className = _className;
@synthesize classType = _classType;
@synthesize hash = _hash;
@synthesize blacklisted = _blacklisted;
@synthesize genderedClassNamesByGenderHash = _genderedClassNamesByGenderHash;
@synthesize redacted = _redacted;
@synthesize displayProperties = _displayProperties;
@synthesize genderedClassNames = _genderedClassNames;
@synthesize index = _index;

+ (NSDictionary *)mapping{
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kWarlockHash,@"hash",
                         nil];
    
    return map;
}

+ (NSString *)key{
    return @"2271682572";
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
            self.classType = [[self objectOrNilForKey:kWarlockClassType fromDictionary:dict] doubleValue];
            self.hash = [[self objectOrNilForKey:kWarlockHash fromDictionary:dict] doubleValue];
            self.blacklisted = [[self objectOrNilForKey:kWarlockBlacklisted fromDictionary:dict] boolValue];
            self.genderedClassNamesByGenderHash = [GenderedClassNamesByGenderHash modelObjectWithDictionary:[dict objectForKey:kWarlockGenderedClassNamesByGenderHash]];
            self.redacted = [[self objectOrNilForKey:kWarlockRedacted fromDictionary:dict] boolValue];
            self.displayProperties = [DisplayProperties modelObjectWithDictionary:[dict objectForKey:kWarlockDisplayProperties]];
            self.genderedClassNames = [GenderedClassNames modelObjectWithDictionary:[dict objectForKey:kWarlockGenderedClassNames]];
            self.index = [[self objectOrNilForKey:kWarlockIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classType] forKey:kWarlockClassType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kWarlockHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kWarlockBlacklisted];
    [mutableDict setValue:[self.genderedClassNamesByGenderHash dictionaryRepresentation] forKey:kWarlockGenderedClassNamesByGenderHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kWarlockRedacted];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kWarlockDisplayProperties];
    [mutableDict setValue:[self.genderedClassNames dictionaryRepresentation] forKey:kWarlockGenderedClassNames];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kWarlockIndex];

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

    self.classType = [aDecoder decodeDoubleForKey:kWarlockClassType];
    self.hash = [aDecoder decodeDoubleForKey:kWarlockHash];
    self.blacklisted = [aDecoder decodeBoolForKey:kWarlockBlacklisted];
    self.genderedClassNamesByGenderHash = [aDecoder decodeObjectForKey:kWarlockGenderedClassNamesByGenderHash];
    self.redacted = [aDecoder decodeBoolForKey:kWarlockRedacted];
    self.displayProperties = [aDecoder decodeObjectForKey:kWarlockDisplayProperties];
    self.genderedClassNames = [aDecoder decodeObjectForKey:kWarlockGenderedClassNames];
    self.index = [aDecoder decodeDoubleForKey:kWarlockIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_classType forKey:kWarlockClassType];
    [aCoder encodeDouble:_hash forKey:kWarlockHash];
    [aCoder encodeBool:_blacklisted forKey:kWarlockBlacklisted];
    [aCoder encodeObject:_genderedClassNamesByGenderHash forKey:kWarlockGenderedClassNamesByGenderHash];
    [aCoder encodeBool:_redacted forKey:kWarlockRedacted];
    [aCoder encodeObject:_displayProperties forKey:kWarlockDisplayProperties];
    [aCoder encodeObject:_genderedClassNames forKey:kWarlockGenderedClassNames];
    [aCoder encodeDouble:_index forKey:kWarlockIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    Warlock *copy = [[Warlock alloc] init];
    
    if (copy) {

        copy.classType = self.classType;
        copy.hash = self.hash;
        copy.blacklisted = self.blacklisted;
        copy.genderedClassNamesByGenderHash = [self.genderedClassNamesByGenderHash copyWithZone:zone];
        copy.redacted = self.redacted;
        copy.displayProperties = [self.displayProperties copyWithZone:zone];
        copy.genderedClassNames = [self.genderedClassNames copyWithZone:zone];
        copy.index = self.index;
    }
    
    return copy;
}


@end
