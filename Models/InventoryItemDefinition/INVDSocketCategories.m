//
//  INVDSocketCategories.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDSocketCategories.h"


NSString *const kSocketCategoriesSocketIndexes = @"socketIndexes";
NSString *const kSocketCategoriesSocketCategoryHash = @"socketCategoryHash";


@interface INVDSocketCategories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDSocketCategories

@synthesize socketIndexes = _socketIndexes;
@synthesize socketCategoryHash = _socketCategoryHash;


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
            self.socketIndexes = [self objectOrNilForKey:kSocketCategoriesSocketIndexes fromDictionary:dict];
            self.socketCategoryHash = [[self objectOrNilForKey:kSocketCategoriesSocketCategoryHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForSocketIndexes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.socketIndexes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSocketIndexes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSocketIndexes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSocketIndexes] forKey:kSocketCategoriesSocketIndexes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.socketCategoryHash] forKey:kSocketCategoriesSocketCategoryHash];

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

    self.socketIndexes = [aDecoder decodeObjectForKey:kSocketCategoriesSocketIndexes];
    self.socketCategoryHash = [aDecoder decodeDoubleForKey:kSocketCategoriesSocketCategoryHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_socketIndexes forKey:kSocketCategoriesSocketIndexes];
    [aCoder encodeDouble:_socketCategoryHash forKey:kSocketCategoriesSocketCategoryHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDSocketCategories *copy = [[INVDSocketCategories alloc] init];
    
    if (copy) {

        copy.socketIndexes = [self.socketIndexes copyWithZone:zone];
        copy.socketCategoryHash = self.socketCategoryHash;
    }
    
    return copy;
}


@end
