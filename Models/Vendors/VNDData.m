//
//  Data.m
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDData.h"
#import "VNDGroups.h"


 
NSString *const kDataGroups = @"groups";


@interface VNDData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDData

 
@synthesize groups = _groups;
 

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
           
    NSObject *receivedGroups = [dict objectForKey:kDataGroups];
    NSMutableArray *parsedGroups = [NSMutableArray array];
    if ([receivedGroups isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGroups) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGroups addObject:[VNDGroups modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGroups isKindOfClass:[NSDictionary class]]) {
       [parsedGroups addObject:[VNDGroups modelObjectWithDictionary:(NSDictionary *)receivedGroups]];
    }

    self.groups = [NSArray arrayWithArray:parsedGroups];
           
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
   
    NSMutableArray *tempArrayForGroups = [NSMutableArray array];
    for (NSObject *subArrayObject in self.groups) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGroups addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGroups addObject:subArrayObject];
        }
    }
    

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

    
    self.groups = [aDecoder decodeObjectForKey:kDataGroups];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    
    [aCoder encodeObject:_groups forKey:kDataGroups];
    
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDData *copy = [[VNDData alloc] init];
    
    if (copy) {

      
        copy.groups = [self.groups copyWithZone:zone];
        
    }
    
    return copy;
}


@end
