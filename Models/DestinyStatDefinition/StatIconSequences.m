//
//  StatIconSequences.m
//
//  Created by Engel Alipio on 6/6/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "StatIconSequences.h"


NSString *const kIconSequencesFrames = @"frames";


@interface StatIconSequences ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StatIconSequences

@synthesize frames = _frames;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kIconSequencesFrames,@"frames",
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
            self.frames = [self objectOrNilForKey:kIconSequencesFrames fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForFrames = [NSMutableArray array];
    for (NSObject *subArrayObject in self.frames) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFrames addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFrames addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFrames] forKey:kIconSequencesFrames];

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

    self.frames = [aDecoder decodeObjectForKey:kIconSequencesFrames];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_frames forKey:kIconSequencesFrames];
}

- (id)copyWithZone:(NSZone *)zone
{
    StatIconSequences *copy = [[StatIconSequences alloc] init];
    
    if (copy) {

        copy.frames = [self.frames copyWithZone:zone];
    }
    
    return copy;
}


@end
