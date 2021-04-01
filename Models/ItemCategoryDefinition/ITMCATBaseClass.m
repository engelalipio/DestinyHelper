//
//  ITMCATBaseClass.m
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "ITMCATBaseClass.h"
#import "DestinyItemCategoryDefinition.h"


NSString *const kITMCATBaseClassDestinyItemCategoryDefinition = @"DestinyItemCategoryDefinition";


@interface ITMCATBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITMCATBaseClass

@synthesize destinyItemCategoryDefinition = _destinyItemCategoryDefinition;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kITMCATBaseClassDestinyItemCategoryDefinition,@"DestinyItemCategoryDefinition",
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
            self.destinyItemCategoryDefinition = [DestinyItemCategoryDefinition modelObjectWithDictionary:[dict objectForKey:kITMCATBaseClassDestinyItemCategoryDefinition]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.destinyItemCategoryDefinition dictionaryRepresentation] forKey:kITMCATBaseClassDestinyItemCategoryDefinition];

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

    self.destinyItemCategoryDefinition = [aDecoder decodeObjectForKey:kITMCATBaseClassDestinyItemCategoryDefinition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_destinyItemCategoryDefinition forKey:kITMCATBaseClassDestinyItemCategoryDefinition];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITMCATBaseClass *copy = [[ITMCATBaseClass alloc] init];
    
    if (copy) {

        copy.destinyItemCategoryDefinition = [self.destinyItemCategoryDefinition copyWithZone:zone];
    }
    
    return copy;
}


@end
