//
//  BungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties.h"


NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesRequirementsDisplay = @"requirementsDisplay";
NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesSmallTransparentIcon = @"smallTransparentIcon";
NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesSubtitle = @"subtitle";
NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesName = @"name";
NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesLargeTransparentIcon = @"largeTransparentIcon";
NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesLargeIcon = @"largeIcon";
NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesMapIcon = @"mapIcon";
NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesHasIcon = @"hasIcon";
NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription = @"description";
NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesOriginalIcon = @"originalIcon";
NSString *const kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesIcon = @"icon";


@interface VNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties

@synthesize requirementsDisplay = _requirementsDisplay;
@synthesize smallTransparentIcon = _smallTransparentIcon;
@synthesize subtitle = _subtitle;
@synthesize name = _name;
@synthesize largeTransparentIcon = _largeTransparentIcon;
@synthesize largeIcon = _largeIcon;
@synthesize mapIcon = _mapIcon;
@synthesize hasIcon = _hasIcon;
@synthesize bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription = _bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription;
@synthesize originalIcon = _originalIcon;
@synthesize icon = _icon;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesName,@"name",
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
            self.requirementsDisplay = [self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesRequirementsDisplay fromDictionary:dict];
            self.smallTransparentIcon = [self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesSmallTransparentIcon fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesSubtitle fromDictionary:dict];
            self.name = [self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesName fromDictionary:dict];
            self.largeTransparentIcon = [self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesLargeTransparentIcon fromDictionary:dict];
            self.largeIcon = [self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesLargeIcon fromDictionary:dict];
            self.mapIcon = [self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesMapIcon fromDictionary:dict];
            self.hasIcon = [[self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesHasIcon fromDictionary:dict] boolValue];
            self.bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription = [self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription fromDictionary:dict];
            self.originalIcon = [self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesOriginalIcon fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesIcon fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRequirementsDisplay] forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesRequirementsDisplay];
    [mutableDict setValue:self.smallTransparentIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesSmallTransparentIcon];
    [mutableDict setValue:self.subtitle forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesSubtitle];
    [mutableDict setValue:self.name forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesName];
    [mutableDict setValue:self.largeTransparentIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesLargeTransparentIcon];
    [mutableDict setValue:self.largeIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesLargeIcon];
    [mutableDict setValue:self.mapIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesMapIcon];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesHasIcon];
    [mutableDict setValue:self.bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription];
    [mutableDict setValue:self.originalIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesOriginalIcon];
    [mutableDict setValue:self.icon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesIcon];

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

    self.requirementsDisplay = [aDecoder decodeObjectForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesRequirementsDisplay];
    self.smallTransparentIcon = [aDecoder decodeObjectForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesSmallTransparentIcon];
    self.subtitle = [aDecoder decodeObjectForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesSubtitle];
    self.name = [aDecoder decodeObjectForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesName];
    self.largeTransparentIcon = [aDecoder decodeObjectForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesLargeTransparentIcon];
    self.largeIcon = [aDecoder decodeObjectForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesLargeIcon];
    self.mapIcon = [aDecoder decodeObjectForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesMapIcon];
    self.hasIcon = [aDecoder decodeBoolForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesHasIcon];
    self.bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription = [aDecoder decodeObjectForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription];
    self.originalIcon = [aDecoder decodeObjectForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesOriginalIcon];
    self.icon = [aDecoder decodeObjectForKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_requirementsDisplay forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesRequirementsDisplay];
    [aCoder encodeObject:_smallTransparentIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesSmallTransparentIcon];
    [aCoder encodeObject:_subtitle forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesSubtitle];
    [aCoder encodeObject:_name forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesName];
    [aCoder encodeObject:_largeTransparentIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesLargeTransparentIcon];
    [aCoder encodeObject:_largeIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesLargeIcon];
    [aCoder encodeObject:_mapIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesMapIcon];
    [aCoder encodeBool:_hasIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesHasIcon];
    [aCoder encodeObject:_bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription];
    [aCoder encodeObject:_originalIcon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesOriginalIcon];
    [aCoder encodeObject:_icon forKey:kBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties *copy = [[VNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties alloc] init];
    
    if (copy) {

        copy.requirementsDisplay = [self.requirementsDisplay copyWithZone:zone];
        copy.smallTransparentIcon = [self.smallTransparentIcon copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.largeTransparentIcon = [self.largeTransparentIcon copyWithZone:zone];
        copy.largeIcon = [self.largeIcon copyWithZone:zone];
        copy.mapIcon = [self.mapIcon copyWithZone:zone];
        copy.hasIcon = self.hasIcon;
        copy.bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription = [self.bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription copyWithZone:zone];
        copy.originalIcon = [self.originalIcon copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
    }
    
    return copy;
}


@end
