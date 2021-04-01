//
//  INSTResponse.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INSTResponse.h"
#import "INSTInstance.h"


NSString *const kResponseCharacterId = @"characterId";
NSString *const kResponseInstance = @"instance";


@interface INSTResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INSTResponse

@synthesize characterId = _characterId;
@synthesize instance = _instance;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kResponseCharacterId,@"characterId",
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
            self.characterId = [self objectOrNilForKey:kResponseCharacterId fromDictionary:dict];
            self.instance = [INSTInstance modelObjectWithDictionary:[dict objectForKey:kResponseInstance]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.characterId forKey:kResponseCharacterId];
    [mutableDict setValue:[self.instance dictionaryRepresentation] forKey:kResponseInstance];

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

    self.characterId = [aDecoder decodeObjectForKey:kResponseCharacterId];
    self.instance = [aDecoder decodeObjectForKey:kResponseInstance];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_characterId forKey:kResponseCharacterId];
    [aCoder encodeObject:_instance forKey:kResponseInstance];
}

- (id)copyWithZone:(NSZone *)zone
{
    INSTResponse *copy = [[INSTResponse alloc] init];
    
    if (copy) {

        copy.characterId = [self.characterId copyWithZone:zone];
        copy.instance = [self.instance copyWithZone:zone];
    }
    
    return copy;
}


@end
