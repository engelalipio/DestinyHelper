//
//  Query.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "Query.h"


NSString *const kQueryItemsPerPage = @"itemsPerPage";
NSString *const kQueryCurrentPage = @"currentPage";


@interface Query ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Query

@synthesize itemsPerPage = _itemsPerPage;
@synthesize currentPage = _currentPage;


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
            self.itemsPerPage = [[self objectOrNilForKey:kQueryItemsPerPage fromDictionary:dict] doubleValue];
            self.currentPage = [[self objectOrNilForKey:kQueryCurrentPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemsPerPage] forKey:kQueryItemsPerPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentPage] forKey:kQueryCurrentPage];

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

    self.itemsPerPage = [aDecoder decodeDoubleForKey:kQueryItemsPerPage];
    self.currentPage = [aDecoder decodeDoubleForKey:kQueryCurrentPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_itemsPerPage forKey:kQueryItemsPerPage];
    [aCoder encodeDouble:_currentPage forKey:kQueryCurrentPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    Query *copy = [[Query alloc] init];
    
    if (copy) {

        copy.itemsPerPage = self.itemsPerPage;
        copy.currentPage = self.currentPage;
    }
    
    return copy;
}


@end
