//  TitanClass.m
//  Titan
//
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "TitanClass.h"
#import "GenderedClassNamesByGenderHash.h"
#import "DisplayProperties.h"
#import "GenderedClassNames.h"


NSString *const kTitanClassType = @"classType";
NSString *const kTitanHash = @"hash";
NSString *const kTitanBlacklisted = @"blacklisted";
NSString *const kTitanGenderedClassNamesByGenderHash = @"genderedClassNamesByGenderHash";
NSString *const kTitanRedacted = @"redacted";
NSString *const kTitanDisplayProperties = @"displayProperties";
NSString *const kTitanGenderedClassNames = @"genderedClassNames";
NSString *const kTitanIndex = @"index";


@interface Titan ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Titan

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
                         kTitanHash,@"hash",
                         nil];
    
    return map;
}

+ (NSString *)key{
    return @"3655393761";
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
            self.classType = [[self objectOrNilForKey:kTitanClassType fromDictionary:dict] doubleValue];
            self.hash = [[self objectOrNilForKey:kTitanHash fromDictionary:dict] doubleValue];
            self.blacklisted = [[self objectOrNilForKey:kTitanBlacklisted fromDictionary:dict] boolValue];
            self.genderedClassNamesByGenderHash = [GenderedClassNamesByGenderHash modelObjectWithDictionary:[dict objectForKey:kTitanGenderedClassNamesByGenderHash]];
            self.redacted = [[self objectOrNilForKey:kTitanRedacted fromDictionary:dict] boolValue];
            self.displayProperties = [DisplayProperties modelObjectWithDictionary:[dict objectForKey:kTitanDisplayProperties]];
            self.genderedClassNames = [GenderedClassNames modelObjectWithDictionary:[dict objectForKey:kTitanGenderedClassNames]];
            self.index = [[self objectOrNilForKey:kTitanIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classType] forKey:kTitanClassType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kTitanHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kTitanBlacklisted];
    [mutableDict setValue:[self.genderedClassNamesByGenderHash dictionaryRepresentation] forKey:kTitanGenderedClassNamesByGenderHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kTitanRedacted];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kTitanDisplayProperties];
    [mutableDict setValue:[self.genderedClassNames dictionaryRepresentation] forKey:kTitanGenderedClassNames];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kTitanIndex];

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

    self.classType = [aDecoder decodeDoubleForKey:kTitanClassType];
    self.hash = [aDecoder decodeDoubleForKey:kTitanHash];
    self.blacklisted = [aDecoder decodeBoolForKey:kTitanBlacklisted];
    self.genderedClassNamesByGenderHash = [aDecoder decodeObjectForKey:kTitanGenderedClassNamesByGenderHash];
    self.redacted = [aDecoder decodeBoolForKey:kTitanRedacted];
    self.displayProperties = [aDecoder decodeObjectForKey:kTitanDisplayProperties];
    self.genderedClassNames = [aDecoder decodeObjectForKey:kTitanGenderedClassNames];
    self.index = [aDecoder decodeDoubleForKey:kTitanIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_classType forKey:kTitanClassType];
    [aCoder encodeDouble:_hash forKey:kTitanHash];
    [aCoder encodeBool:_blacklisted forKey:kTitanBlacklisted];
    [aCoder encodeObject:_genderedClassNamesByGenderHash forKey:kTitanGenderedClassNamesByGenderHash];
    [aCoder encodeBool:_redacted forKey:kTitanRedacted];
    [aCoder encodeObject:_displayProperties forKey:kTitanDisplayProperties];
    [aCoder encodeObject:_genderedClassNames forKey:kTitanGenderedClassNames];
    [aCoder encodeDouble:_index forKey:kTitanIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    Titan *copy = [[Titan alloc] init];
    
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
