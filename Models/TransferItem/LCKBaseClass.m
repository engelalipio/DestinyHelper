//
//  LCKBaseClass.m
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "LCKBaseClass.h"


NSString *const kLCKBaseClassState = @"state";
NSString *const kLCKBaseClassItemId = @"itemId";
NSString *const kLCKBaseClassMembershipType = @"membershipType";
NSString *const kLCKBaseClassCharacterId = @"characterId";


@interface LCKBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LCKBaseClass

@synthesize state = _state;
@synthesize itemId = _itemId;
@synthesize membershipType = _membershipType;
@synthesize characterId = _characterId;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kLCKBaseClassItemId,@"itemId",
                         nil];
    
    return map;
}


+ (NSString *)key{
    return kLCKBaseClassItemId;
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
            self.state = [[self objectOrNilForKey:kLCKBaseClassState fromDictionary:dict] boolValue];
            self.itemId = [self objectOrNilForKey:kLCKBaseClassItemId fromDictionary:dict];
            self.membershipType = [[self objectOrNilForKey:kLCKBaseClassMembershipType fromDictionary:dict] doubleValue];
            self.characterId = [self objectOrNilForKey:kLCKBaseClassCharacterId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.state] forKey:kLCKBaseClassState];
    [mutableDict setValue:self.itemId forKey:kLCKBaseClassItemId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kLCKBaseClassMembershipType];
    [mutableDict setValue:self.characterId forKey:kLCKBaseClassCharacterId];

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

    self.state = [aDecoder decodeBoolForKey:kLCKBaseClassState];
    self.itemId = [aDecoder decodeObjectForKey:kLCKBaseClassItemId];
    self.membershipType = [aDecoder decodeDoubleForKey:kLCKBaseClassMembershipType];
    self.characterId = [aDecoder decodeObjectForKey:kLCKBaseClassCharacterId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_state forKey:kLCKBaseClassState];
    [aCoder encodeObject:_itemId forKey:kLCKBaseClassItemId];
    [aCoder encodeDouble:_membershipType forKey:kLCKBaseClassMembershipType];
    [aCoder encodeObject:_characterId forKey:kLCKBaseClassCharacterId];
}

- (id)copyWithZone:(NSZone *)zone
{
    LCKBaseClass *copy = [[LCKBaseClass alloc] init];
    
    if (copy) {

        copy.state = self.state;
        copy.itemId = [self.itemId copyWithZone:zone];
        copy.membershipType = self.membershipType;
        copy.characterId = [self.characterId copyWithZone:zone];
    }
    
    return copy;
}


@end
