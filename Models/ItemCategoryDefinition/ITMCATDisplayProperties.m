//
//  DisplayProperties.m
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "ITMCATDisplayProperties.h"


NSString *const kITMCATDisplayPropertiesName = @"name";
NSString *const kITMCATDisplayPropertiesHasIcon = @"hasIcon";
NSString *const kITMCATDisplayPropertiesDescription = @"description";


@interface ITMCATDisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITMCATDisplayProperties

@synthesize name = _name;
@synthesize hasIcon = _hasIcon;
@synthesize displayPropertiesDescription = _displayPropertiesDescription;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kITMCATDisplayPropertiesName,@"name",
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
            self.name = [self objectOrNilForKey:kITMCATDisplayPropertiesName fromDictionary:dict];
            self.hasIcon = [[self objectOrNilForKey:kITMCATDisplayPropertiesHasIcon fromDictionary:dict] boolValue];
            self.displayPropertiesDescription = [self objectOrNilForKey:kITMCATDisplayPropertiesDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kITMCATDisplayPropertiesName];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kITMCATDisplayPropertiesHasIcon];
    [mutableDict setValue:self.displayPropertiesDescription forKey:kITMCATDisplayPropertiesDescription];

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

    self.name = [aDecoder decodeObjectForKey:kITMCATDisplayPropertiesName];
    self.hasIcon = [aDecoder decodeBoolForKey:kITMCATDisplayPropertiesHasIcon];
    self.displayPropertiesDescription = [aDecoder decodeObjectForKey:kITMCATDisplayPropertiesDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kITMCATDisplayPropertiesName];
    [aCoder encodeBool:_hasIcon forKey:kITMCATDisplayPropertiesHasIcon];
    [aCoder encodeObject:_displayPropertiesDescription forKey:kITMCATDisplayPropertiesDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITMCATDisplayProperties *copy = [[ITMCATDisplayProperties alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.hasIcon = self.hasIcon;
        copy.displayPropertiesDescription = [self.displayPropertiesDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
