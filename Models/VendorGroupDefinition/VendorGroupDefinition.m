//
//  VendorGroupDefinition.m
//
//  Created by Engel Alipio on 3/2/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VendorGroupDefinition.h"


NSString *const kVendorGroupDefinitionRedacted = @"redacted";
NSString *const kVendorGroupDefinitionOrder = @"order";
NSString *const kVendorGroupDefinitionHash = @"hash";
NSString *const kVendorGroupDefinitionBlacklisted = @"blacklisted";
NSString *const kVendorGroupDefinitionCategoryName = @"categoryName";
NSString *const kVendorGroupDefinitionIndex = @"index";


@interface VendorGroupDefinition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VendorGroupDefinition

@synthesize redacted = _redacted;
@synthesize order = _order;
@synthesize hash = _hash;
@synthesize blacklisted = _blacklisted;
@synthesize categoryName = _categoryName;
@synthesize index = _index;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kVendorGroupDefinitionCategoryName,@"categoryName",
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
            self.redacted = [[self objectOrNilForKey:kVendorGroupDefinitionRedacted fromDictionary:dict] boolValue];
            self.order = [[self objectOrNilForKey:kVendorGroupDefinitionOrder fromDictionary:dict] doubleValue];
            self.hash = [[self objectOrNilForKey:kVendorGroupDefinitionHash fromDictionary:dict] doubleValue];
            self.blacklisted = [[self objectOrNilForKey:kVendorGroupDefinitionBlacklisted fromDictionary:dict] boolValue];
            self.categoryName = [self objectOrNilForKey:kVendorGroupDefinitionCategoryName fromDictionary:dict];
            self.index = [[self objectOrNilForKey:kVendorGroupDefinitionIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kVendorGroupDefinitionRedacted];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kVendorGroupDefinitionOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kVendorGroupDefinitionHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kVendorGroupDefinitionBlacklisted];
    [mutableDict setValue:self.categoryName forKey:kVendorGroupDefinitionCategoryName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kVendorGroupDefinitionIndex];

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

    self.redacted = [aDecoder decodeBoolForKey:kVendorGroupDefinitionRedacted];
    self.order = [aDecoder decodeDoubleForKey:kVendorGroupDefinitionOrder];
    self.hash = [aDecoder decodeDoubleForKey:kVendorGroupDefinitionHash];
    self.blacklisted = [aDecoder decodeBoolForKey:kVendorGroupDefinitionBlacklisted];
    self.categoryName = [aDecoder decodeObjectForKey:kVendorGroupDefinitionCategoryName];
    self.index = [aDecoder decodeDoubleForKey:kVendorGroupDefinitionIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_redacted forKey:kVendorGroupDefinitionRedacted];
    [aCoder encodeDouble:_order forKey:kVendorGroupDefinitionOrder];
    [aCoder encodeDouble:_hash forKey:kVendorGroupDefinitionHash];
    [aCoder encodeBool:_blacklisted forKey:kVendorGroupDefinitionBlacklisted];
    [aCoder encodeObject:_categoryName forKey:kVendorGroupDefinitionCategoryName];
    [aCoder encodeDouble:_index forKey:kVendorGroupDefinitionIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    VendorGroupDefinition *copy = [[VendorGroupDefinition alloc] init];
    
    if (copy) {

        copy.redacted = self.redacted;
        copy.order = self.order;
        copy.hash = self.hash;
        copy.blacklisted = self.blacklisted;
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.index = self.index;
    }
    
    return copy;
}


@end
