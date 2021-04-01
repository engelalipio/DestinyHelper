//
//  Instance.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INSTInstance.h"
#import "INSTData.h"


NSString *const kInstancePrivacy = @"privacy";
NSString *const kInstanceData = @"data";


@interface INSTInstance ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INSTInstance

@synthesize privacy = _privacy;
@synthesize data = _data;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kInstanceData,@"data",
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
            self.privacy = [[self objectOrNilForKey:kInstancePrivacy fromDictionary:dict] doubleValue];
            self.data = [INSTData modelObjectWithDictionary:[dict objectForKey:kInstanceData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.privacy] forKey:kInstancePrivacy];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kInstanceData];

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

    self.privacy = [aDecoder decodeDoubleForKey:kInstancePrivacy];
    self.data = [aDecoder decodeObjectForKey:kInstanceData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_privacy forKey:kInstancePrivacy];
    [aCoder encodeObject:_data forKey:kInstanceData];
}

- (id)copyWithZone:(NSZone *)zone
{
    INSTInstance *copy = [[INSTInstance alloc] init];
    
    if (copy) {

        copy.privacy = self.privacy;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
