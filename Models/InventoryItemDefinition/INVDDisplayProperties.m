//
//  INVDDisplayProperties.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDDisplayProperties.h"


NSString *const kINVDDisplayPropertiesHasIcon = @"hasIcon";
NSString *const kINVDDisplayPropertiesIcon = @"icon";
NSString *const kINVDDisplayPropertiesIconWaterMark = @"iconWatermark";
NSString *const kINVDDisplayPropertiesDescription = @"description";
NSString *const kINVDDisplayPropertiesName = @"name";


@interface INVDDisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDDisplayProperties

@synthesize hasIcon = _hasIcon;
@synthesize icon = _icon;
@synthesize iconWatermark = _iconWatermark;
@synthesize displayPropertiesDescription = _displayPropertiesDescription;
@synthesize name = _name;



+ (NSDictionary *)mapping{
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kINVDDisplayPropertiesHasIcon, @"hasIcon",
                         kINVDDisplayPropertiesIcon, @"icon",
                         kINVDDisplayPropertiesIconWaterMark, @"iconWatermark",
                         kINVDDisplayPropertiesDescription, @"description",
                         kINVDDisplayPropertiesName, @"name",
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
            self.hasIcon = [[self objectOrNilForKey:kINVDDisplayPropertiesHasIcon fromDictionary:dict] boolValue];
            self.icon = [self objectOrNilForKey:kINVDDisplayPropertiesIcon fromDictionary:dict];
            self.iconWatermark = [self objectOrNilForKey:kINVDDisplayPropertiesIconWaterMark fromDictionary:dict];
            self.displayPropertiesDescription = [self objectOrNilForKey:kINVDDisplayPropertiesDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kINVDDisplayPropertiesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kINVDDisplayPropertiesHasIcon];
    [mutableDict setValue:self.icon forKey:kINVDDisplayPropertiesIcon];
    [mutableDict setValue:self.iconWatermark forKey:kINVDDisplayPropertiesIconWaterMark];
    [mutableDict setValue:self.displayPropertiesDescription forKey:kINVDDisplayPropertiesDescription];
    [mutableDict setValue:self.name forKey:kINVDDisplayPropertiesName];

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

    self.hasIcon = [aDecoder decodeBoolForKey:kINVDDisplayPropertiesHasIcon];
    self.icon = [aDecoder decodeObjectForKey:kINVDDisplayPropertiesIcon];
    self.iconWatermark = [aDecoder decodeObjectForKey:kINVDDisplayPropertiesIconWaterMark];
    self.displayPropertiesDescription = [aDecoder decodeObjectForKey:kINVDDisplayPropertiesDescription];
    self.name = [aDecoder decodeObjectForKey:kINVDDisplayPropertiesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasIcon forKey:kINVDDisplayPropertiesHasIcon];
    [aCoder encodeObject:_icon forKey:kINVDDisplayPropertiesIcon];
    [aCoder encodeObject:_iconWatermark forKey:kINVDDisplayPropertiesIconWaterMark];
    [aCoder encodeObject:_displayPropertiesDescription forKey:kINVDDisplayPropertiesDescription];
    [aCoder encodeObject:_name forKey:kINVDDisplayPropertiesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDDisplayProperties *copy = [[INVDDisplayProperties alloc] init];
    
    if (copy) {

        copy.hasIcon = self.hasIcon;
        copy.icon = [self.icon copyWithZone:zone];
        copy.iconWatermark = [self.iconWatermark copyWithZone:zone];
        copy.displayPropertiesDescription = [self.displayPropertiesDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
