//
//  SPDisplayProperties.m
//
//  Created by Engel Alipio on 6/9/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "SPDisplayProperties.h"


NSString *const kSPDisplayPropertiesHasIcon = @"hasIcon";
NSString *const kSPDisplayPropertiesIcon = @"icon";
NSString *const kSPDisplayPropertiesDescription = @"description";
NSString *const kSPDisplayPropertiesName = @"name";


@interface SPDisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SPDisplayProperties

@synthesize hasIcon = _hasIcon;
@synthesize icon = _icon;
@synthesize displayPropertiesDescription = _displayPropertiesDescription;
@synthesize name = _name;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kSPDisplayPropertiesName,@"name",
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
            self.hasIcon = [[self objectOrNilForKey:kSPDisplayPropertiesHasIcon fromDictionary:dict] boolValue];
            self.icon = [self objectOrNilForKey:kSPDisplayPropertiesIcon fromDictionary:dict];
            self.displayPropertiesDescription = [self objectOrNilForKey:kSPDisplayPropertiesDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kSPDisplayPropertiesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kSPDisplayPropertiesHasIcon];
    [mutableDict setValue:self.icon forKey:kSPDisplayPropertiesIcon];
    [mutableDict setValue:self.displayPropertiesDescription forKey:kSPDisplayPropertiesDescription];
    [mutableDict setValue:self.name forKey:kSPDisplayPropertiesName];

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

    self.hasIcon = [aDecoder decodeBoolForKey:kSPDisplayPropertiesHasIcon];
    self.icon = [aDecoder decodeObjectForKey:kSPDisplayPropertiesIcon];
    self.displayPropertiesDescription = [aDecoder decodeObjectForKey:kSPDisplayPropertiesDescription];
    self.name = [aDecoder decodeObjectForKey:kSPDisplayPropertiesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasIcon forKey:kSPDisplayPropertiesHasIcon];
    [aCoder encodeObject:_icon forKey:kSPDisplayPropertiesIcon];
    [aCoder encodeObject:_displayPropertiesDescription forKey:kSPDisplayPropertiesDescription];
    [aCoder encodeObject:_name forKey:kSPDisplayPropertiesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    SPDisplayProperties *copy = [[SPDisplayProperties alloc] init];
    
    if (copy) {

        copy.hasIcon = self.hasIcon;
        copy.icon = [self.icon copyWithZone:zone];
        copy.displayPropertiesDescription = [self.displayPropertiesDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
