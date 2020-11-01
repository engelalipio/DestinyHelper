//
//  MBRResponse.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MBRResponse.h"
#import "MBRDestinyMemberships.h"
#import "MBRBungieNetUser.h"


NSString *const kMBRResponseDestinyMemberships = @"destinyMemberships";
NSString *const kMBRResponseBungieNetUser = @"bungieNetUser";


@interface MBRResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MBRResponse

@synthesize destinyMemberships = _destinyMemberships;
@synthesize bungieNetUser = _bungieNetUser;


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
    NSObject *receivedMBRDestinyMemberships = [dict objectForKey:kMBRResponseDestinyMemberships];
    NSMutableArray *parsedMBRDestinyMemberships = [NSMutableArray array];
    if ([receivedMBRDestinyMemberships isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMBRDestinyMemberships) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMBRDestinyMemberships addObject:[MBRDestinyMemberships modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMBRDestinyMemberships isKindOfClass:[NSDictionary class]]) {
       [parsedMBRDestinyMemberships addObject:[MBRDestinyMemberships modelObjectWithDictionary:(NSDictionary *)receivedMBRDestinyMemberships]];
    }

    self.destinyMemberships = [NSArray arrayWithArray:parsedMBRDestinyMemberships];
            self.bungieNetUser = [MBRBungieNetUser modelObjectWithDictionary:[dict objectForKey:kMBRResponseBungieNetUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForDestinyMemberships = [NSMutableArray array];
    for (NSObject *subArrayObject in self.destinyMemberships) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDestinyMemberships addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDestinyMemberships addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDestinyMemberships] forKey:kMBRResponseDestinyMemberships];
    [mutableDict setValue:[self.bungieNetUser dictionaryRepresentation] forKey:kMBRResponseBungieNetUser];

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

    self.destinyMemberships = [aDecoder decodeObjectForKey:kMBRResponseDestinyMemberships];
    self.bungieNetUser = [aDecoder decodeObjectForKey:kMBRResponseBungieNetUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_destinyMemberships forKey:kMBRResponseDestinyMemberships];
    [aCoder encodeObject:_bungieNetUser forKey:kMBRResponseBungieNetUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    MBRResponse *copy = [[MBRResponse alloc] init];
    
    if (copy) {

        copy.destinyMemberships = [self.destinyMemberships copyWithZone:zone];
        copy.bungieNetUser = [self.bungieNetUser copyWithZone:zone];
    }
    
    return copy;
}


@end
