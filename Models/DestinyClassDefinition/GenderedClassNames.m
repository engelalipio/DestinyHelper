//
//  GenderedClassNames.m
//
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "GenderedClassNames.h"


NSString *const kGenderedClassNamesFemale = @"Female";
NSString *const kGenderedClassNamesMale = @"Male";


@interface GenderedClassNames ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GenderedClassNames

@synthesize female = _female;
@synthesize male = _male;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGenderedClassNamesMale,@"Male",
                         nil];
    
    return map;
}

+ (NSString *)key{
    return nil;
}

+ (NSString *)maleKey{
    return kGenderedClassNamesMale;
}

+ (NSString *)femaleKey{
    return kGenderedClassNamesFemale;
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
            self.female = [self objectOrNilForKey:kGenderedClassNamesFemale fromDictionary:dict];
            self.male = [self objectOrNilForKey:kGenderedClassNamesMale fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.female forKey:kGenderedClassNamesFemale];
    [mutableDict setValue:self.male forKey:kGenderedClassNamesMale];

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

    self.female = [aDecoder decodeObjectForKey:kGenderedClassNamesFemale];
    self.male = [aDecoder decodeObjectForKey:kGenderedClassNamesMale];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_female forKey:kGenderedClassNamesFemale];
    [aCoder encodeObject:_male forKey:kGenderedClassNamesMale];
}

- (id)copyWithZone:(NSZone *)zone
{
    GenderedClassNames *copy = [[GenderedClassNames alloc] init];
    
    if (copy) {

        copy.female = [self.female copyWithZone:zone];
        copy.male = [self.male copyWithZone:zone];
    }
    
    return copy;
}


@end
