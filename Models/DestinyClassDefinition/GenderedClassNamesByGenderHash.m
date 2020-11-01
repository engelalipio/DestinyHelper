//
//  GenderedClassNamesByGenderHash.m
//
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "GenderedClassNamesByGenderHash.h"


NSString *const kGenderedClassNamesByGenderHash2204441813 = @"2204441813";
NSString *const kGenderedClassNamesByGenderHash3111576190 = @"3111576190";


@interface GenderedClassNamesByGenderHash ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GenderedClassNamesByGenderHash

@synthesize MaleHash_3111576190 = _MaleHash_3111576190;
@synthesize FemaleHash_2204441813 = _FemaleHash_2204441813;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGenderedClassNamesByGenderHash2204441813,@"2204441813",
                         nil];
    
    return map;
}

+ (NSString *)key{
    return nil;
}

+ (NSString *)maleHash{
    return kGenderedClassNamesByGenderHash3111576190;
}

+ (NSString *)femaleHash{
    return kGenderedClassNamesByGenderHash2204441813;
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
            self.MaleHash_3111576190 = [self objectOrNilForKey:kGenderedClassNamesByGenderHash3111576190 fromDictionary:dict];
            self.FemaleHash_2204441813 = [self objectOrNilForKey:kGenderedClassNamesByGenderHash2204441813 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.MaleHash_3111576190 forKey:kGenderedClassNamesByGenderHash3111576190];
    [mutableDict setValue:self.FemaleHash_2204441813 forKey:kGenderedClassNamesByGenderHash2204441813];

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

    self.MaleHash_3111576190 = [aDecoder decodeObjectForKey:kGenderedClassNamesByGenderHash3111576190];
    self.FemaleHash_2204441813 = [aDecoder decodeObjectForKey:kGenderedClassNamesByGenderHash2204441813];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_MaleHash_3111576190 forKey:kGenderedClassNamesByGenderHash3111576190];
    [aCoder encodeObject:_FemaleHash_2204441813 forKey:kGenderedClassNamesByGenderHash2204441813];
}

- (id)copyWithZone:(NSZone *)zone
{
    GenderedClassNamesByGenderHash *copy = [[GenderedClassNamesByGenderHash alloc] init];
    
    if (copy) {

        copy.MaleHash_3111576190 = [self.MaleHash_3111576190 copyWithZone:zone];
        copy.FemaleHash_2204441813 = [self.FemaleHash_2204441813 copyWithZone:zone];
    }
    
    return copy;
}


@end
