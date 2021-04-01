//
//  TRXBaseClass.m
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "TRXBaseClass.h"


NSString *const kBaseClassTransferToVault = @"transferToVault";
NSString *const kBaseClassItemId = @"itemId";
NSString *const kBaseClassMembershipType = @"membershipType";
NSString *const kBaseClassItemReferenceHash = @"itemReferenceHash";
NSString *const kBaseClassStackSize = @"stackSize";
NSString *const kBaseClassCharacterId = @"characterId";


@interface TRXBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TRXBaseClass

@synthesize transferToVault = _transferToVault;
@synthesize itemId = _itemId;
@synthesize membershipType = _membershipType;
@synthesize itemReferenceHash = _itemReferenceHash;
@synthesize stackSize = _stackSize;
@synthesize characterId = _characterId;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kBaseClassItemId,@"itemId",
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
            self.transferToVault = [[self objectOrNilForKey:kBaseClassTransferToVault fromDictionary:dict] boolValue];
            self.itemId = [self objectOrNilForKey:kBaseClassItemId fromDictionary:dict];
            self.membershipType = [[self objectOrNilForKey:kBaseClassMembershipType fromDictionary:dict] doubleValue];
            self.itemReferenceHash = [self objectOrNilForKey:kBaseClassItemReferenceHash fromDictionary:dict];
            self.stackSize = [[self objectOrNilForKey:kBaseClassStackSize fromDictionary:dict] doubleValue];
            self.characterId = [self objectOrNilForKey:kBaseClassCharacterId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.transferToVault] forKey:kBaseClassTransferToVault];
    [mutableDict setValue:self.itemId forKey:kBaseClassItemId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kBaseClassMembershipType];
    [mutableDict setValue:self.itemReferenceHash forKey:kBaseClassItemReferenceHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stackSize] forKey:kBaseClassStackSize];
    [mutableDict setValue:self.characterId forKey:kBaseClassCharacterId];

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

    self.transferToVault = [aDecoder decodeBoolForKey:kBaseClassTransferToVault];
    self.itemId = [aDecoder decodeObjectForKey:kBaseClassItemId];
    self.membershipType = [aDecoder decodeDoubleForKey:kBaseClassMembershipType];
    self.itemReferenceHash = [aDecoder decodeObjectForKey:kBaseClassItemReferenceHash];
    self.stackSize = [aDecoder decodeDoubleForKey:kBaseClassStackSize];
    self.characterId = [aDecoder decodeObjectForKey:kBaseClassCharacterId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_transferToVault forKey:kBaseClassTransferToVault];
    [aCoder encodeObject:_itemId forKey:kBaseClassItemId];
    [aCoder encodeDouble:_membershipType forKey:kBaseClassMembershipType];
    [aCoder encodeObject:_itemReferenceHash forKey:kBaseClassItemReferenceHash];
    [aCoder encodeDouble:_stackSize forKey:kBaseClassStackSize];
    [aCoder encodeObject:_characterId forKey:kBaseClassCharacterId];
}

- (id)copyWithZone:(NSZone *)zone
{
    TRXBaseClass *copy = [[TRXBaseClass alloc] init];
    
    if (copy) {

        copy.transferToVault = self.transferToVault;
        copy.itemId = [self.itemId copyWithZone:zone];
        copy.membershipType = self.membershipType;
        copy.itemReferenceHash = [self.itemReferenceHash copyWithZone:zone];
        copy.stackSize = self.stackSize;
        copy.characterId = [self.characterId copyWithZone:zone];
    }
    
    return copy;
}


@end
