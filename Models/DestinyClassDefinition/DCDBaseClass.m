//
//  DCDBaseClass.m
//
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "DCDBaseClass.h"
#import "HunterClass.h"
#import "WarlockClass.h"
#import "TitanClass.h"


NSString *const kDCDBaseClassTitan = @"3655393761";
NSString *const kDCDBaseClassHunter = @"671679327";
NSString *const kDCDBaseClassWarlock = @"2271682572";


@interface DCDBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DCDBaseClass

@synthesize Hunter = _Hunter;
@synthesize Warlock = _Warlock;
@synthesize Titan = _Titan;


+ (NSDictionary *)mapping{
    
    Titan *titan = [[Titan alloc] init];
         [titan setClassName:@"Titan"];
         [titan setHash:3655393761];
    
    Hunter *hunter = [[Hunter alloc] init];
        [hunter setClassName:@"Hunter"];
        [hunter setHash:671679327];
    
    Warlock *warlock = [[Warlock alloc] init];
        [warlock setClassName:@"Warlock"];
        [warlock setHash:2271682572];
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         titan,kDCDBaseClassTitan,hunter,kDCDBaseClassHunter,
                         warlock,kDCDBaseClassWarlock,nil];
 
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
            self.Titan = [Titan modelObjectWithDictionary:[dict objectForKey:kDCDBaseClassTitan]];
            self.Hunter = [Hunter modelObjectWithDictionary:[dict objectForKey:kDCDBaseClassHunter]];
            self.Warlock = [Warlock modelObjectWithDictionary:[dict objectForKey:kDCDBaseClassWarlock]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.Titan dictionaryRepresentation] forKey:kDCDBaseClassTitan];
    [mutableDict setValue:[self.Hunter dictionaryRepresentation] forKey:kDCDBaseClassHunter];
    [mutableDict setValue:[self.Warlock dictionaryRepresentation] forKey:kDCDBaseClassWarlock];

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

    self.Titan = [aDecoder decodeObjectForKey:kDCDBaseClassTitan];
    self.Hunter = [aDecoder decodeObjectForKey:kDCDBaseClassHunter];
    self.Warlock = [aDecoder decodeObjectForKey:kDCDBaseClassWarlock];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_Titan forKey:kDCDBaseClassTitan];
    [aCoder encodeObject:_Hunter forKey:kDCDBaseClassHunter];
    [aCoder encodeObject:_Warlock forKey:kDCDBaseClassWarlock];
}

- (id)copyWithZone:(NSZone *)zone
{
    DCDBaseClass *copy = [[DCDBaseClass alloc] init];
    
    if (copy) {

        copy.Titan = [self.Titan copyWithZone:zone];
        copy.Hunter = [self.Hunter copyWithZone:zone];
        copy.Warlock = [self.Warlock copyWithZone:zone];
    }
    
    return copy;
}


@end
