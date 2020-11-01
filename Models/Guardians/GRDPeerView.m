//
//  GRDPeerView.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDPeerView.h"
#import "GRDEquipment.h"


NSString *const kGRDPeerViewEquipment = @"equipment";


@interface GRDPeerView ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDPeerView

@synthesize equipment = _equipment;


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
    NSObject *receivedGRDEquipment = [dict objectForKey:kGRDPeerViewEquipment];
    NSMutableArray *parsedGRDEquipment = [NSMutableArray array];
    if ([receivedGRDEquipment isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGRDEquipment) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGRDEquipment addObject:[GRDEquipment modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGRDEquipment isKindOfClass:[NSDictionary class]]) {
       [parsedGRDEquipment addObject:[GRDEquipment modelObjectWithDictionary:(NSDictionary *)receivedGRDEquipment]];
    }

    self.equipment = [NSArray arrayWithArray:parsedGRDEquipment];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForEquipment = [NSMutableArray array];
    for (NSObject *subArrayObject in self.equipment) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEquipment addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEquipment addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEquipment] forKey:kGRDPeerViewEquipment];

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

    self.equipment = [aDecoder decodeObjectForKey:kGRDPeerViewEquipment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_equipment forKey:kGRDPeerViewEquipment];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDPeerView *copy = [[GRDPeerView alloc] init];
    
    if (copy) {

        copy.equipment = [self.equipment copyWithZone:zone];
    }
    
    return copy;
}


@end
