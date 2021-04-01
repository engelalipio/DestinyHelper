//
//  DisplayCategories.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsDisplayCategories.h"
#import "VNDDetailsDisplayProperties.h"


NSString *const kDisplayCategoriesDisplayCategoryHash = @"displayCategoryHash";
NSString *const kDisplayCategoriesDisplayInBanner = @"displayInBanner";
NSString *const kDisplayCategoriesSortOrder = @"sortOrder";
NSString *const kDisplayCategoriesIdentifier = @"identifier";
NSString *const kDisplayCategoriesDisplayProperties = @"displayProperties";
NSString *const kDisplayCategoriesIndex = @"index";


@interface VNDDetailsDisplayCategories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsDisplayCategories

@synthesize displayCategoryHash = _displayCategoryHash;
@synthesize displayInBanner = _displayInBanner;
@synthesize sortOrder = _sortOrder;
@synthesize identifier = _identifier;
@synthesize displayProperties = _displayProperties;
@synthesize index = _index;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kDisplayCategoriesIdentifier,@"identifier",
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
            self.displayCategoryHash = [[self objectOrNilForKey:kDisplayCategoriesDisplayCategoryHash fromDictionary:dict] doubleValue];
            self.displayInBanner = [[self objectOrNilForKey:kDisplayCategoriesDisplayInBanner fromDictionary:dict] boolValue];
            self.sortOrder = [[self objectOrNilForKey:kDisplayCategoriesSortOrder fromDictionary:dict] doubleValue];
            self.identifier = [self objectOrNilForKey:kDisplayCategoriesIdentifier fromDictionary:dict];
            self.displayProperties = [VNDDetailsDisplayProperties modelObjectWithDictionary:[dict objectForKey:kDisplayCategoriesDisplayProperties]];
            self.index = [[self objectOrNilForKey:kDisplayCategoriesIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayCategoryHash] forKey:kDisplayCategoriesDisplayCategoryHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.displayInBanner] forKey:kDisplayCategoriesDisplayInBanner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sortOrder] forKey:kDisplayCategoriesSortOrder];
    [mutableDict setValue:self.identifier forKey:kDisplayCategoriesIdentifier];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kDisplayCategoriesDisplayProperties];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kDisplayCategoriesIndex];

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

    self.displayCategoryHash = [aDecoder decodeDoubleForKey:kDisplayCategoriesDisplayCategoryHash];
    self.displayInBanner = [aDecoder decodeBoolForKey:kDisplayCategoriesDisplayInBanner];
    self.sortOrder = [aDecoder decodeDoubleForKey:kDisplayCategoriesSortOrder];
    self.identifier = [aDecoder decodeObjectForKey:kDisplayCategoriesIdentifier];
    self.displayProperties = [aDecoder decodeObjectForKey:kDisplayCategoriesDisplayProperties];
    self.index = [aDecoder decodeDoubleForKey:kDisplayCategoriesIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_displayCategoryHash forKey:kDisplayCategoriesDisplayCategoryHash];
    [aCoder encodeBool:_displayInBanner forKey:kDisplayCategoriesDisplayInBanner];
    [aCoder encodeDouble:_sortOrder forKey:kDisplayCategoriesSortOrder];
    [aCoder encodeObject:_identifier forKey:kDisplayCategoriesIdentifier];
    [aCoder encodeObject:_displayProperties forKey:kDisplayCategoriesDisplayProperties];
    [aCoder encodeDouble:_index forKey:kDisplayCategoriesIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsDisplayCategories *copy = [[VNDDetailsDisplayCategories alloc] init];
    
    if (copy) {

        copy.displayCategoryHash = self.displayCategoryHash;
        copy.displayInBanner = self.displayInBanner;
        copy.sortOrder = self.sortOrder;
        copy.identifier = [self.identifier copyWithZone:zone];
        copy.displayProperties = [self.displayProperties copyWithZone:zone];
        copy.index = self.index;
    }
    
    return copy;
}


@end
