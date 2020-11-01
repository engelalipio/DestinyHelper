//
//  GRDData.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDData.h"
#import "GRDCharacters.h"
#import "GRDInventory.h"


NSString *const kGRDDataMembershipId = @"membershipId";
NSString *const kGRDDataVersions = @"versions";
NSString *const kGRDDataCharacters = @"characters";
NSString *const kGRDDataGrimoireScore = @"grimoireScore";
NSString *const kGRDDataInventory = @"inventory";
NSString *const kGRDDataMembershipType = @"membershipType";


@interface GRDData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDData

@synthesize membershipId = _membershipId;
@synthesize versions = _versions;
@synthesize characters = _characters;
@synthesize grimoireScore = _grimoireScore;
@synthesize inventory = _inventory;
@synthesize membershipType = _membershipType;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGRDDataCharacters,@"characters",
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
            self.membershipId = [self objectOrNilForKey:kGRDDataMembershipId fromDictionary:dict];
            self.versions = [[self objectOrNilForKey:kGRDDataVersions fromDictionary:dict] doubleValue];
    NSObject *receivedGRDCharacters = [dict objectForKey:kGRDDataCharacters];
    NSMutableArray *parsedGRDCharacters = [NSMutableArray array];
    if ([receivedGRDCharacters isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGRDCharacters) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGRDCharacters addObject:[GRDCharacters modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGRDCharacters isKindOfClass:[NSDictionary class]]) {
       [parsedGRDCharacters addObject:[GRDCharacters modelObjectWithDictionary:(NSDictionary *)receivedGRDCharacters]];
    }

    self.characters = [NSArray arrayWithArray:parsedGRDCharacters];
            self.grimoireScore = [[self objectOrNilForKey:kGRDDataGrimoireScore fromDictionary:dict] doubleValue];
            self.inventory = [GRDInventory modelObjectWithDictionary:[dict objectForKey:kGRDDataInventory]];
            self.membershipType = [[self objectOrNilForKey:kGRDDataMembershipType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.membershipId forKey:kGRDDataMembershipId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.versions] forKey:kGRDDataVersions];
    NSMutableArray *tempArrayForCharacters = [NSMutableArray array];
    for (NSObject *subArrayObject in self.characters) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCharacters addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCharacters addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCharacters] forKey:kGRDDataCharacters];
    [mutableDict setValue:[NSNumber numberWithDouble:self.grimoireScore] forKey:kGRDDataGrimoireScore];
    [mutableDict setValue:[self.inventory dictionaryRepresentation] forKey:kGRDDataInventory];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kGRDDataMembershipType];

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

    self.membershipId = [aDecoder decodeObjectForKey:kGRDDataMembershipId];
    self.versions = [aDecoder decodeDoubleForKey:kGRDDataVersions];
    self.characters = [aDecoder decodeObjectForKey:kGRDDataCharacters];
    self.grimoireScore = [aDecoder decodeDoubleForKey:kGRDDataGrimoireScore];
    self.inventory = [aDecoder decodeObjectForKey:kGRDDataInventory];
    self.membershipType = [aDecoder decodeDoubleForKey:kGRDDataMembershipType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_membershipId forKey:kGRDDataMembershipId];
    [aCoder encodeDouble:_versions forKey:kGRDDataVersions];
    [aCoder encodeObject:_characters forKey:kGRDDataCharacters];
    [aCoder encodeDouble:_grimoireScore forKey:kGRDDataGrimoireScore];
    [aCoder encodeObject:_inventory forKey:kGRDDataInventory];
    [aCoder encodeDouble:_membershipType forKey:kGRDDataMembershipType];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDData *copy = [[GRDData alloc] init];
    
    if (copy) {

        copy.membershipId = [self.membershipId copyWithZone:zone];
        copy.versions = self.versions;
        copy.characters = [self.characters copyWithZone:zone];
        copy.grimoireScore = self.grimoireScore;
        copy.inventory = [self.inventory copyWithZone:zone];
        copy.membershipType = self.membershipType;
    }
    
    return copy;
}


@end
