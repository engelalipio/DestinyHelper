//
//  HeaderDisplayProperties.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsHeaderDisplayProperties.h"


NSString *const kHeaderDisplayPropertiesHasIcon = @"hasIcon";
NSString *const kHeaderDisplayPropertiesIcon = @"icon";
NSString *const kHeaderDisplayPropertiesDescription = @"description";
NSString *const kHeaderDisplayPropertiesName = @"name";


@interface VNDDetailsHeaderDisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsHeaderDisplayProperties

@synthesize hasIcon = _hasIcon;
@synthesize icon = _icon;
@synthesize headerDisplayPropertiesDescription = _headerDisplayPropertiesDescription;
@synthesize name = _name;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kHeaderDisplayPropertiesName,@"name",
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
            self.hasIcon = [[self objectOrNilForKey:kHeaderDisplayPropertiesHasIcon fromDictionary:dict] boolValue];
            self.icon = [self objectOrNilForKey:kHeaderDisplayPropertiesIcon fromDictionary:dict];
            self.headerDisplayPropertiesDescription = [self objectOrNilForKey:kHeaderDisplayPropertiesDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kHeaderDisplayPropertiesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kHeaderDisplayPropertiesHasIcon];
    [mutableDict setValue:self.icon forKey:kHeaderDisplayPropertiesIcon];
    [mutableDict setValue:self.headerDisplayPropertiesDescription forKey:kHeaderDisplayPropertiesDescription];
    [mutableDict setValue:self.name forKey:kHeaderDisplayPropertiesName];

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

    self.hasIcon = [aDecoder decodeBoolForKey:kHeaderDisplayPropertiesHasIcon];
    self.icon = [aDecoder decodeObjectForKey:kHeaderDisplayPropertiesIcon];
    self.headerDisplayPropertiesDescription = [aDecoder decodeObjectForKey:kHeaderDisplayPropertiesDescription];
    self.name = [aDecoder decodeObjectForKey:kHeaderDisplayPropertiesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasIcon forKey:kHeaderDisplayPropertiesHasIcon];
    [aCoder encodeObject:_icon forKey:kHeaderDisplayPropertiesIcon];
    [aCoder encodeObject:_headerDisplayPropertiesDescription forKey:kHeaderDisplayPropertiesDescription];
    [aCoder encodeObject:_name forKey:kHeaderDisplayPropertiesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsHeaderDisplayProperties *copy = [[VNDDetailsHeaderDisplayProperties alloc] init];
    
    if (copy) {

        copy.hasIcon = self.hasIcon;
        copy.icon = [self.icon copyWithZone:zone];
        copy.headerDisplayPropertiesDescription = [self.headerDisplayPropertiesDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
