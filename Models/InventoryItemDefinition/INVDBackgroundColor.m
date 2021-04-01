//
//  INVDBackgroundColor.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDBackgroundColor.h"


NSString *const kBackgroundColorRed = @"red";
NSString *const kBackgroundColorAlpha = @"alpha";
NSString *const kBackgroundColorBlue = @"blue";
NSString *const kBackgroundColorGreen = @"green";


@interface INVDBackgroundColor ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDBackgroundColor

@synthesize red = _red;
@synthesize alpha = _alpha;
@synthesize blue = _blue;
@synthesize green = _green;


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
            self.red = [[self objectOrNilForKey:kBackgroundColorRed fromDictionary:dict] doubleValue];
            self.alpha = [[self objectOrNilForKey:kBackgroundColorAlpha fromDictionary:dict] doubleValue];
            self.blue = [[self objectOrNilForKey:kBackgroundColorBlue fromDictionary:dict] doubleValue];
            self.green = [[self objectOrNilForKey:kBackgroundColorGreen fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.red] forKey:kBackgroundColorRed];
    [mutableDict setValue:[NSNumber numberWithDouble:self.alpha] forKey:kBackgroundColorAlpha];
    [mutableDict setValue:[NSNumber numberWithDouble:self.blue] forKey:kBackgroundColorBlue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.green] forKey:kBackgroundColorGreen];

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

    self.red = [aDecoder decodeDoubleForKey:kBackgroundColorRed];
    self.alpha = [aDecoder decodeDoubleForKey:kBackgroundColorAlpha];
    self.blue = [aDecoder decodeDoubleForKey:kBackgroundColorBlue];
    self.green = [aDecoder decodeDoubleForKey:kBackgroundColorGreen];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_red forKey:kBackgroundColorRed];
    [aCoder encodeDouble:_alpha forKey:kBackgroundColorAlpha];
    [aCoder encodeDouble:_blue forKey:kBackgroundColorBlue];
    [aCoder encodeDouble:_green forKey:kBackgroundColorGreen];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDBackgroundColor *copy = [[INVDBackgroundColor alloc] init];
    
    if (copy) {

        copy.red = self.red;
        copy.alpha = self.alpha;
        copy.blue = self.blue;
        copy.green = self.green;
    }
    
    return copy;
}


@end
