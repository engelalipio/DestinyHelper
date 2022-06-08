//
//  StatDisplayProperties.m
//
//  Created by Engel Alipio on 6/6/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "StatDisplayProperties.h"
#import "StatIconSequences.h"


NSString *const kDisplayPropertiesIconSequences = @"iconSequences";
NSString *const kStatDisplayPropertiesHasIcon = @"hasIcon";
NSString *const kStatDisplayPropertiesIcon = @"icon";
NSString *const kStatDisplayPropertiesDescription = @"description";
NSString *const kStatDisplayPropertiesName = @"name";


@interface StatDisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StatDisplayProperties

@synthesize iconSequences = _iconSequences;
@synthesize hasIcon = _hasIcon;
@synthesize icon = _icon;
@synthesize displayPropertiesDescription = _displayPropertiesDescription;
@synthesize name = _name;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kStatDisplayPropertiesName,@"name",
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
    NSObject *receivedIconSequences = [dict objectForKey:kDisplayPropertiesIconSequences];
    NSMutableArray *parsedIconSequences = [NSMutableArray array];
    if ([receivedIconSequences isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedIconSequences) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedIconSequences addObject:[StatIconSequences modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedIconSequences isKindOfClass:[NSDictionary class]]) {
       [parsedIconSequences addObject:[StatIconSequences modelObjectWithDictionary:(NSDictionary *)receivedIconSequences]];
    }

    self.iconSequences = [NSArray arrayWithArray:parsedIconSequences];
            self.hasIcon = [[self objectOrNilForKey:kStatDisplayPropertiesHasIcon fromDictionary:dict] boolValue];
            self.icon = [self objectOrNilForKey:kStatDisplayPropertiesIcon fromDictionary:dict];
            self.displayPropertiesDescription = [self objectOrNilForKey:kStatDisplayPropertiesDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kStatDisplayPropertiesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForIconSequences = [NSMutableArray array];
    for (NSObject *subArrayObject in self.iconSequences) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIconSequences addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIconSequences addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIconSequences] forKey:kDisplayPropertiesIconSequences];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kStatDisplayPropertiesHasIcon];
    [mutableDict setValue:self.icon forKey:kStatDisplayPropertiesIcon];
    [mutableDict setValue:self.displayPropertiesDescription forKey:kStatDisplayPropertiesDescription];
    [mutableDict setValue:self.name forKey:kStatDisplayPropertiesName];

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

    self.iconSequences = [aDecoder decodeObjectForKey:kDisplayPropertiesIconSequences];
    self.hasIcon = [aDecoder decodeBoolForKey:kStatDisplayPropertiesHasIcon];
    self.icon = [aDecoder decodeObjectForKey:kStatDisplayPropertiesIcon];
    self.displayPropertiesDescription = [aDecoder decodeObjectForKey:kStatDisplayPropertiesDescription];
    self.name = [aDecoder decodeObjectForKey:kStatDisplayPropertiesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_iconSequences forKey:kDisplayPropertiesIconSequences];
    [aCoder encodeBool:_hasIcon forKey:kStatDisplayPropertiesHasIcon];
    [aCoder encodeObject:_icon forKey:kStatDisplayPropertiesIcon];
    [aCoder encodeObject:_displayPropertiesDescription forKey:kStatDisplayPropertiesDescription];
    [aCoder encodeObject:_name forKey:kStatDisplayPropertiesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    StatDisplayProperties *copy = [[StatDisplayProperties alloc] init];
    
    if (copy) {

        copy.iconSequences = [self.iconSequences copyWithZone:zone];
        copy.hasIcon = self.hasIcon;
        copy.icon = [self.icon copyWithZone:zone];
        copy.displayPropertiesDescription = [self.displayPropertiesDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
