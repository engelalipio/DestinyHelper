//
//  ACMDisplayProperties.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "ACMDisplayProperties.h"


NSString *const kACMDisplayPropertiesHasIcon = @"hasIcon";
NSString *const kACMDisplayPropertiesIcon = @"icon";
NSString *const kACMDisplayPropertiesDescription = @"description";
NSString *const kACMDisplayPropertiesName = @"name";


@interface ACMDisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ACMDisplayProperties

@synthesize hasIcon = _hasIcon;
@synthesize icon = _icon;
@synthesize displayPropertiesDescription = _displayPropertiesDescription;
@synthesize name = _name;


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
            self.hasIcon = [[self objectOrNilForKey:kACMDisplayPropertiesHasIcon fromDictionary:dict] boolValue];
            self.icon = [self objectOrNilForKey:kACMDisplayPropertiesIcon fromDictionary:dict];
            self.displayPropertiesDescription = [self objectOrNilForKey:kACMDisplayPropertiesDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kACMDisplayPropertiesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kACMDisplayPropertiesHasIcon];
    [mutableDict setValue:self.icon forKey:kACMDisplayPropertiesIcon];
    [mutableDict setValue:self.displayPropertiesDescription forKey:kACMDisplayPropertiesDescription];
    [mutableDict setValue:self.name forKey:kACMDisplayPropertiesName];

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

    self.hasIcon = [aDecoder decodeBoolForKey:kACMDisplayPropertiesHasIcon];
    self.icon = [aDecoder decodeObjectForKey:kACMDisplayPropertiesIcon];
    self.displayPropertiesDescription = [aDecoder decodeObjectForKey:kACMDisplayPropertiesDescription];
    self.name = [aDecoder decodeObjectForKey:kACMDisplayPropertiesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasIcon forKey:kACMDisplayPropertiesHasIcon];
    [aCoder encodeObject:_icon forKey:kACMDisplayPropertiesIcon];
    [aCoder encodeObject:_displayPropertiesDescription forKey:kACMDisplayPropertiesDescription];
    [aCoder encodeObject:_name forKey:kACMDisplayPropertiesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ACMDisplayProperties *copy = [[ACMDisplayProperties alloc] init];
    
    if (copy) {

        copy.hasIcon = self.hasIcon;
        copy.icon = [self.icon copyWithZone:zone];
        copy.displayPropertiesDescription = [self.displayPropertiesDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
