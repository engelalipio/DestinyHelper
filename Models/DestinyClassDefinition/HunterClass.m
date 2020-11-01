//
//  Hunter.m
//
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "HunterClass.h"
#import "GenderedClassNamesByGenderHash.h"
#import "DisplayProperties.h"
#import "GenderedClassNames.h"


NSString *const kHunterClassName = @"className";
NSString *const kHunterClassType = @"classType";
NSString *const kHunterHash = @"hash";
NSString *const kHunterBlacklisted = @"blacklisted";
NSString *const kHunterGenderedClassNamesByGenderHash = @"genderedClassNamesByGenderHash";
NSString *const kHunterRedacted = @"redacted";
NSString *const kHunterDisplayProperties = @"displayProperties";
NSString *const kHunterGenderedClassNames = @"genderedClassNames";
NSString *const kHunterIndex = @"index";


@interface Hunter ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Hunter

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
                         kHunterHash,@"hash",
                         nil];
    
    return map;
}

+ (NSString *)key{
    return @"671679327";
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
            self.classType = [[self objectOrNilForKey:kHunterClassType fromDictionary:dict] doubleValue];
            self.hash = [[self objectOrNilForKey:kHunterHash fromDictionary:dict] doubleValue];
            self.blacklisted = [[self objectOrNilForKey:kHunterBlacklisted fromDictionary:dict] boolValue];
            self.genderedClassNamesByGenderHash = [GenderedClassNamesByGenderHash modelObjectWithDictionary:[dict objectForKey:kHunterGenderedClassNamesByGenderHash]];
            self.redacted = [[self objectOrNilForKey:kHunterRedacted fromDictionary:dict] boolValue];
            self.displayProperties = [DisplayProperties modelObjectWithDictionary:[dict objectForKey:kHunterDisplayProperties]];
            self.genderedClassNames = [GenderedClassNames modelObjectWithDictionary:[dict objectForKey:kHunterGenderedClassNames]];
            self.index = [[self objectOrNilForKey:kHunterIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classType] forKey:kHunterClassType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kHunterHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kHunterBlacklisted];
    [mutableDict setValue:[self.genderedClassNamesByGenderHash dictionaryRepresentation] forKey:kHunterGenderedClassNamesByGenderHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kHunterRedacted];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kHunterDisplayProperties];
    [mutableDict setValue:[self.genderedClassNames dictionaryRepresentation] forKey:kHunterGenderedClassNames];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kHunterIndex];

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

    self.classType = [aDecoder decodeDoubleForKey:kHunterClassType];
    self.hash = [aDecoder decodeDoubleForKey:kHunterHash];
    self.blacklisted = [aDecoder decodeBoolForKey:kHunterBlacklisted];
    self.genderedClassNamesByGenderHash = [aDecoder decodeObjectForKey:kHunterGenderedClassNamesByGenderHash];
    self.redacted = [aDecoder decodeBoolForKey:kHunterRedacted];
    self.displayProperties = [aDecoder decodeObjectForKey:kHunterDisplayProperties];
    self.genderedClassNames = [aDecoder decodeObjectForKey:kHunterGenderedClassNames];
    self.index = [aDecoder decodeDoubleForKey:kHunterIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_classType forKey:kHunterClassType];
    [aCoder encodeDouble:_hash forKey:kHunterHash];
    [aCoder encodeBool:_blacklisted forKey:kHunterBlacklisted];
    [aCoder encodeObject:_genderedClassNamesByGenderHash forKey:kHunterGenderedClassNamesByGenderHash];
    [aCoder encodeBool:_redacted forKey:kHunterRedacted];
    [aCoder encodeObject:_displayProperties forKey:kHunterDisplayProperties];
    [aCoder encodeObject:_genderedClassNames forKey:kHunterGenderedClassNames];
    [aCoder encodeDouble:_index forKey:kHunterIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    Hunter *copy = [[Hunter alloc] init];
    
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
