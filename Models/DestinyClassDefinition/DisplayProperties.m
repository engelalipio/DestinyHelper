//
//  DisplayProperties.m
//
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "DisplayProperties.h"


NSString *const kDisplayPropertiesName = @"name";
NSString *const kDisplayPropertiesHasIcon = @"hasIcon";


@interface DisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DisplayProperties

@synthesize name = _name;
@synthesize hasIcon = _hasIcon;


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
            self.name = [self objectOrNilForKey:kDisplayPropertiesName fromDictionary:dict];
            self.hasIcon = [[self objectOrNilForKey:kDisplayPropertiesHasIcon fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kDisplayPropertiesName];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kDisplayPropertiesHasIcon];

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

    self.name = [aDecoder decodeObjectForKey:kDisplayPropertiesName];
    self.hasIcon = [aDecoder decodeBoolForKey:kDisplayPropertiesHasIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kDisplayPropertiesName];
    [aCoder encodeBool:_hasIcon forKey:kDisplayPropertiesHasIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    DisplayProperties *copy = [[DisplayProperties alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.hasIcon = self.hasIcon;
    }
    
    return copy;
}


@end
