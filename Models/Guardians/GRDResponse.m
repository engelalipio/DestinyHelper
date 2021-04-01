//
//  GRDResponse.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDResponse.h"
#import "GRDData.h"
#import "GRDInventory.h"


NSString *const kGRDResponseData = @"data";
NSString *const kGRDResponseInventory = @"inventory";

@interface GRDResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDResponse

@synthesize data = _data;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGRDResponseData,@"data",
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
            self.data = [GRDData modelObjectWithDictionary:[dict objectForKey:kGRDResponseData]];
            self.inventory = [GRDInventory modelObjectWithDictionary:[dict objectForKey:kGRDResponseInventory]];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kGRDResponseData];
    [mutableDict setValue:[self.inventory dictionaryRepresentation] forKey:kGRDResponseInventory];
    
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

    self.data = [aDecoder decodeObjectForKey:kGRDResponseData];
    self.data =[aDecoder decodeObjectForKey:kGRDResponseInventory];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_data forKey:kGRDResponseData];
    [aCoder encodeObject:_inventory forKey:kGRDResponseInventory];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDResponse *copy = [[GRDResponse alloc] init];
    
    if (copy) {

        copy.data = [self.data copyWithZone:zone];
        copy.inventory = [self.inventory copyWithZone:zone];
    }
    
    return copy;
}


@end
