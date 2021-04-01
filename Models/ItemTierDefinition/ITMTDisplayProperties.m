//
//  ITMTDisplayProperties.m
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "ITMTDisplayProperties.h"


NSString *const kITMTDisplayPropertiesName = @"name";
NSString *const kITMTDisplayPropertiesHasIcon = @"hasIcon";
NSString *const kITMTDisplayPropertiesDescription = @"description";


@interface ITMTDisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITMTDisplayProperties

@synthesize name = _name;
@synthesize hasIcon = _hasIcon;
@synthesize displayPropertiesDescription = _displayPropertiesDescription;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kITMTDisplayPropertiesName,@"hash",
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
            self.name = [self objectOrNilForKey:kITMTDisplayPropertiesName fromDictionary:dict];
            self.hasIcon = [[self objectOrNilForKey:kITMTDisplayPropertiesHasIcon fromDictionary:dict] boolValue];
            self.displayPropertiesDescription = [self objectOrNilForKey:kITMTDisplayPropertiesDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kITMTDisplayPropertiesName];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kITMTDisplayPropertiesHasIcon];
    [mutableDict setValue:self.displayPropertiesDescription forKey:kITMTDisplayPropertiesDescription];

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

    self.name = [aDecoder decodeObjectForKey:kITMTDisplayPropertiesName];
    self.hasIcon = [aDecoder decodeBoolForKey:kITMTDisplayPropertiesHasIcon];
    self.displayPropertiesDescription = [aDecoder decodeObjectForKey:kITMTDisplayPropertiesDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kITMTDisplayPropertiesName];
    [aCoder encodeBool:_hasIcon forKey:kITMTDisplayPropertiesHasIcon];
    [aCoder encodeObject:_displayPropertiesDescription forKey:kITMTDisplayPropertiesDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITMTDisplayProperties *copy = [[ITMTDisplayProperties alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.hasIcon = self.hasIcon;
        copy.displayPropertiesDescription = [self.displayPropertiesDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
