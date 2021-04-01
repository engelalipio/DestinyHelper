//
//  DisplayProperties.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsDisplayProperties.h"


NSString *const kVNDDetailsDisplayPropertiesRequirementsDisplay = @"requirementsDisplay";
NSString *const kkVNDDetailsDisplayPropertiesSmallTransparentIcon = @"smallTransparentIcon";
NSString *const kVNDDetailskDisplayPropertiesSubtitle = @"subtitle";
NSString *const kkVNDDetailsDisplayPropertiesName = @"name";
NSString *const kkVNDDetailsDisplayPropertiesLargeTransparentIcon = @"largeTransparentIcon";
NSString *const kDisplayPropertiesLargeIcon = @"largeIcon";
NSString *const kDisplayPropertiesMapIcon = @"mapIcon";
NSString *const kVNDDetailsDisplayPropertiesHasIcon = @"hasIcon";
NSString *const kDisplayPropertiesDescription = @"description";
NSString *const kDisplayPropertiesOriginalIcon = @"originalIcon";
NSString *const kkVNDDetailsDisplayPropertiesIcon = @"icon";


@interface VNDDetailsDisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsDisplayProperties

@synthesize requirementsDisplay = _requirementsDisplay;
@synthesize smallTransparentIcon = _smallTransparentIcon;
@synthesize subtitle = _subtitle;
@synthesize name = _name;
@synthesize largeTransparentIcon = _largeTransparentIcon;
@synthesize largeIcon = _largeIcon;
@synthesize mapIcon = _mapIcon;
@synthesize hasIcon = _hasIcon;
@synthesize displayPropertiesDescription = _displayPropertiesDescription;
@synthesize originalIcon = _originalIcon;
@synthesize icon = _icon;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kkVNDDetailsDisplayPropertiesName,@"name",
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
            self.requirementsDisplay = [self objectOrNilForKey:kVNDDetailsDisplayPropertiesRequirementsDisplay fromDictionary:dict];
            self.smallTransparentIcon = [self objectOrNilForKey:kkVNDDetailsDisplayPropertiesSmallTransparentIcon fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kVNDDetailskDisplayPropertiesSubtitle fromDictionary:dict];
            self.name = [self objectOrNilForKey:kkVNDDetailsDisplayPropertiesName fromDictionary:dict];
            self.largeTransparentIcon = [self objectOrNilForKey:kkVNDDetailsDisplayPropertiesLargeTransparentIcon fromDictionary:dict];
            self.largeIcon = [self objectOrNilForKey:kDisplayPropertiesLargeIcon fromDictionary:dict];
            self.mapIcon = [self objectOrNilForKey:kDisplayPropertiesMapIcon fromDictionary:dict];
            self.hasIcon = [[self objectOrNilForKey:kVNDDetailsDisplayPropertiesHasIcon fromDictionary:dict] boolValue];
            self.displayPropertiesDescription = [self objectOrNilForKey:kDisplayPropertiesDescription fromDictionary:dict];
            self.originalIcon = [self objectOrNilForKey:kDisplayPropertiesOriginalIcon fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kkVNDDetailsDisplayPropertiesIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForRequirementsDisplay = [NSMutableArray array];
    for (NSObject *subArrayObject in self.requirementsDisplay) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRequirementsDisplay addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRequirementsDisplay addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRequirementsDisplay] forKey:kVNDDetailsDisplayPropertiesRequirementsDisplay];
    [mutableDict setValue:self.smallTransparentIcon forKey:kkVNDDetailsDisplayPropertiesSmallTransparentIcon];
    [mutableDict setValue:self.subtitle forKey:kVNDDetailskDisplayPropertiesSubtitle];
    [mutableDict setValue:self.name forKey:kkVNDDetailsDisplayPropertiesName];
    [mutableDict setValue:self.largeTransparentIcon forKey:kkVNDDetailsDisplayPropertiesLargeTransparentIcon];
    [mutableDict setValue:self.largeIcon forKey:kDisplayPropertiesLargeIcon];
    [mutableDict setValue:self.mapIcon forKey:kDisplayPropertiesMapIcon];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kVNDDetailsDisplayPropertiesHasIcon];
    [mutableDict setValue:self.displayPropertiesDescription forKey:kDisplayPropertiesDescription];
    [mutableDict setValue:self.originalIcon forKey:kDisplayPropertiesOriginalIcon];
    [mutableDict setValue:self.icon forKey:kkVNDDetailsDisplayPropertiesIcon];

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

    self.requirementsDisplay = [aDecoder decodeObjectForKey:kVNDDetailsDisplayPropertiesRequirementsDisplay];
    self.smallTransparentIcon = [aDecoder decodeObjectForKey:kkVNDDetailsDisplayPropertiesSmallTransparentIcon];
    self.subtitle = [aDecoder decodeObjectForKey:kVNDDetailskDisplayPropertiesSubtitle];
    self.name = [aDecoder decodeObjectForKey:kkVNDDetailsDisplayPropertiesName];
    self.largeTransparentIcon = [aDecoder decodeObjectForKey:kkVNDDetailsDisplayPropertiesLargeTransparentIcon];
    self.largeIcon = [aDecoder decodeObjectForKey:kDisplayPropertiesLargeIcon];
    self.mapIcon = [aDecoder decodeObjectForKey:kDisplayPropertiesMapIcon];
    self.hasIcon = [aDecoder decodeBoolForKey:kVNDDetailsDisplayPropertiesHasIcon];
    self.displayPropertiesDescription = [aDecoder decodeObjectForKey:kDisplayPropertiesDescription];
    self.originalIcon = [aDecoder decodeObjectForKey:kDisplayPropertiesOriginalIcon];
    self.icon = [aDecoder decodeObjectForKey:kkVNDDetailsDisplayPropertiesIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_requirementsDisplay forKey:kVNDDetailsDisplayPropertiesRequirementsDisplay];
    [aCoder encodeObject:_smallTransparentIcon forKey:kkVNDDetailsDisplayPropertiesSmallTransparentIcon];
    [aCoder encodeObject:_subtitle forKey:kVNDDetailskDisplayPropertiesSubtitle];
    [aCoder encodeObject:_name forKey:kkVNDDetailsDisplayPropertiesName];
    [aCoder encodeObject:_largeTransparentIcon forKey:kkVNDDetailsDisplayPropertiesLargeTransparentIcon];
    [aCoder encodeObject:_largeIcon forKey:kDisplayPropertiesLargeIcon];
    [aCoder encodeObject:_mapIcon forKey:kDisplayPropertiesMapIcon];
    [aCoder encodeBool:_hasIcon forKey:kVNDDetailsDisplayPropertiesHasIcon];
    [aCoder encodeObject:_displayPropertiesDescription forKey:kDisplayPropertiesDescription];
    [aCoder encodeObject:_originalIcon forKey:kDisplayPropertiesOriginalIcon];
    [aCoder encodeObject:_icon forKey:kkVNDDetailsDisplayPropertiesIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsDisplayProperties *copy = [[VNDDetailsDisplayProperties alloc] init];
    
    if (copy) {

        copy.requirementsDisplay = [self.requirementsDisplay copyWithZone:zone];
        copy.smallTransparentIcon = [self.smallTransparentIcon copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.largeTransparentIcon = [self.largeTransparentIcon copyWithZone:zone];
        copy.largeIcon = [self.largeIcon copyWithZone:zone];
        copy.mapIcon = [self.mapIcon copyWithZone:zone];
        copy.hasIcon = self.hasIcon;
        copy.displayPropertiesDescription = [self.displayPropertiesDescription copyWithZone:zone];
        copy.originalIcon = [self.originalIcon copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
    }
    
    return copy;
}


@end
