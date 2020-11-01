//
//  GRDDyes.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDDyes.h"


NSString *const kGRDDyesChannelHash = @"channelHash";
NSString *const kGRDDyesDyeHash = @"dyeHash";


@interface GRDDyes ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDDyes

@synthesize channelHash = _channelHash;
@synthesize dyeHash = _dyeHash;


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
            self.channelHash = [[self objectOrNilForKey:kGRDDyesChannelHash fromDictionary:dict] doubleValue];
            self.dyeHash = [[self objectOrNilForKey:kGRDDyesDyeHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.channelHash] forKey:kGRDDyesChannelHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dyeHash] forKey:kGRDDyesDyeHash];

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

    self.channelHash = [aDecoder decodeDoubleForKey:kGRDDyesChannelHash];
    self.dyeHash = [aDecoder decodeDoubleForKey:kGRDDyesDyeHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_channelHash forKey:kGRDDyesChannelHash];
    [aCoder encodeDouble:_dyeHash forKey:kGRDDyesDyeHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDDyes *copy = [[GRDDyes alloc] init];
    
    if (copy) {

        copy.channelHash = self.channelHash;
        copy.dyeHash = self.dyeHash;
    }
    
    return copy;
}


@end
