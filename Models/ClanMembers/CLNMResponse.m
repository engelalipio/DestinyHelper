//
//  Response.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "CLNMResponse.h"
#import "Results.h"
#import "Query.h"


NSString *const kResponseResults = @"results";
NSString *const kResponseQuery = @"query";
NSString *const kResponseTotalResults = @"totalResults";
NSString *const kResponseUseTotalResults = @"useTotalResults";
NSString *const kResponseHasMore = @"hasMore";


@interface CLNMResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLNMResponse

@synthesize results = _results;
@synthesize query = _query;
@synthesize totalResults = _totalResults;
@synthesize useTotalResults = _useTotalResults;
@synthesize hasMore = _hasMore;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kResponseResults,@"results",
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
    NSObject *receivedResults = [dict objectForKey:kResponseResults];
    NSMutableArray *parsedResults = [NSMutableArray array];
    if ([receivedResults isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResults) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResults addObject:[Results modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResults isKindOfClass:[NSDictionary class]]) {
       [parsedResults addObject:[Results modelObjectWithDictionary:(NSDictionary *)receivedResults]];
    }

    self.results = [NSArray arrayWithArray:parsedResults];
            self.query = [Query modelObjectWithDictionary:[dict objectForKey:kResponseQuery]];
            self.totalResults = [[self objectOrNilForKey:kResponseTotalResults fromDictionary:dict] doubleValue];
            self.useTotalResults = [[self objectOrNilForKey:kResponseUseTotalResults fromDictionary:dict] boolValue];
            self.hasMore = [[self objectOrNilForKey:kResponseHasMore fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForResults = [NSMutableArray array];
    for (NSObject *subArrayObject in self.results) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResults addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResults addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResults] forKey:kResponseResults];
    [mutableDict setValue:[self.query dictionaryRepresentation] forKey:kResponseQuery];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalResults] forKey:kResponseTotalResults];
    [mutableDict setValue:[NSNumber numberWithBool:self.useTotalResults] forKey:kResponseUseTotalResults];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kResponseHasMore];

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

    self.results = [aDecoder decodeObjectForKey:kResponseResults];
    self.query = [aDecoder decodeObjectForKey:kResponseQuery];
    self.totalResults = [aDecoder decodeDoubleForKey:kResponseTotalResults];
    self.useTotalResults = [aDecoder decodeBoolForKey:kResponseUseTotalResults];
    self.hasMore = [aDecoder decodeBoolForKey:kResponseHasMore];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_results forKey:kResponseResults];
    [aCoder encodeObject:_query forKey:kResponseQuery];
    [aCoder encodeDouble:_totalResults forKey:kResponseTotalResults];
    [aCoder encodeBool:_useTotalResults forKey:kResponseUseTotalResults];
    [aCoder encodeBool:_hasMore forKey:kResponseHasMore];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLNMResponse *copy = [[CLNMResponse alloc] init];
    
    if (copy) {

        copy.results = [self.results copyWithZone:zone];
        copy.query = [self.query copyWithZone:zone];
        copy.totalResults = self.totalResults;
        copy.useTotalResults = self.useTotalResults;
        copy.hasMore = self.hasMore;
    }
    
    return copy;
}


@end
