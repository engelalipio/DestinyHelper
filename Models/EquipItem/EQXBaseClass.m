//
//  EQXBaseClass.m
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "EQXBaseClass.h"



NSString *const kEquipBaseClassItemId = @"itemId";
NSString *const kEquipBaseClassMembershipType = @"membershipType";
NSString *const kEquipBaseClassCharacterId = @"characterId";


@interface EQXBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EQXBaseClass

 
@synthesize itemId = _itemId;
@synthesize membershipType = _membershipType;
@synthesize characterId = _characterId;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kEquipBaseClassItemId,@"itemId",
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
            self.itemId = [self objectOrNilForKey:kEquipBaseClassItemId fromDictionary:dict];
            self.membershipType = [[self objectOrNilForKey:kEquipBaseClassMembershipType fromDictionary:dict] doubleValue];
            self.characterId = [self objectOrNilForKey:kEquipBaseClassCharacterId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.itemId forKey:kEquipBaseClassItemId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kEquipBaseClassMembershipType];
    [mutableDict setValue:self.characterId forKey:kEquipBaseClassCharacterId];

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

 
    self.itemId = [aDecoder decodeObjectForKey:kEquipBaseClassItemId];
    self.membershipType = [aDecoder decodeDoubleForKey:kEquipBaseClassMembershipType];
    self.characterId = [aDecoder decodeObjectForKey:kEquipBaseClassCharacterId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_itemId forKey:kEquipBaseClassItemId];
    [aCoder encodeDouble:_membershipType forKey:kEquipBaseClassMembershipType];
    [aCoder encodeObject:_characterId forKey:kEquipBaseClassCharacterId];
}

- (id)copyWithZone:(NSZone *)zone
{
    EQXBaseClass *copy = [[EQXBaseClass alloc] init];
    
    if (copy) {

        copy.itemId = [self.itemId copyWithZone:zone];
        copy.membershipType = self.membershipType;
        copy.characterId = [self.characterId copyWithZone:zone];
    }
    
    return copy;
}


@end
