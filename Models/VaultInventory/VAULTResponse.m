//
//  VAULTResponse.m
//
//  Created by Engel Alipio on 5/17/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "VAULTResponse.h"
#import "ProfileInventory.h"


NSString *const kResponseProfileInventory = @"profileInventory";


@interface VAULTResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VAULTResponse

@synthesize profileInventory = _profileInventory;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kResponseProfileInventory,@"profileInventory",
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
            self.profileInventory = [ProfileInventory modelObjectWithDictionary:[dict objectForKey:kResponseProfileInventory]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.profileInventory dictionaryRepresentation] forKey:kResponseProfileInventory];

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

    self.profileInventory = [aDecoder decodeObjectForKey:kResponseProfileInventory];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_profileInventory forKey:kResponseProfileInventory];
}

- (id)copyWithZone:(NSZone *)zone
{
    VAULTResponse *copy = [[VAULTResponse alloc] init];
    
    if (copy) {

        copy.profileInventory = [self.profileInventory copyWithZone:zone];
    }
    
    return copy;
}


@end
