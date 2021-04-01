//
//  DisplayProperties.m
//
//  Created by Engel Alipio on 3/9/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "BCKDisplayProperties.h"


NSString *const kDisplayPropertiesHasIcon = @"hasIcon";
NSString *const kIBCKDisplayPropertiesDescription = @"description";
NSString *const kIBCKDisplayPropertiesName = @"name";

@interface BCKDisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BCKDisplayProperties

@synthesize hasIcon = _hasIcon;
@synthesize description = _description;
@synthesize name = _name;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kIBCKDisplayPropertiesDescription,@"name",
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
            self.hasIcon = [[self objectOrNilForKey:kDisplayPropertiesHasIcon fromDictionary:dict] boolValue];
            self.description = [self objectOrNilForKey:kIBCKDisplayPropertiesDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kIBCKDisplayPropertiesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kDisplayPropertiesHasIcon];
    [mutableDict setValue:self.description forKey:kIBCKDisplayPropertiesDescription];
    [mutableDict setValue:self.name forKey:kIBCKDisplayPropertiesName];
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

    self.hasIcon = [aDecoder decodeBoolForKey:kDisplayPropertiesHasIcon];
    self.description = [aDecoder decodeObjectForKey:kIBCKDisplayPropertiesDescription];
    self.name = [aDecoder decodeObjectForKey:kIBCKDisplayPropertiesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasIcon forKey:kDisplayPropertiesHasIcon];
    [aCoder encodeObject:_description forKey:kIBCKDisplayPropertiesDescription];
    [aCoder encodeObject:_name forKey:kIBCKDisplayPropertiesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    BCKDisplayProperties *copy = [[BCKDisplayProperties alloc] init];
    
    if (copy) {

        copy.hasIcon = self.hasIcon;
        copy.description = self.description;
        copy.name = self.name;
    }
    
    return copy;
}


@end
