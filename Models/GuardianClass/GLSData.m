//
//  GLSData.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GLSData.h"
#import "GLSClassDefinition.h"


NSString *const kGLSDataClassDefinition = @"classDefinition";
NSString *const kGLSDataRequestedId = @"requestedId";


@interface GLSData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GLSData

@synthesize classDefinition = _classDefinition;
@synthesize requestedId = _requestedId;


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
            self.classDefinition = [GLSClassDefinition modelObjectWithDictionary:[dict objectForKey:kGLSDataClassDefinition]];
            self.requestedId = [[self objectOrNilForKey:kGLSDataRequestedId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.classDefinition dictionaryRepresentation] forKey:kGLSDataClassDefinition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.requestedId] forKey:kGLSDataRequestedId];

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

    self.classDefinition = [aDecoder decodeObjectForKey:kGLSDataClassDefinition];
    self.requestedId = [aDecoder decodeDoubleForKey:kGLSDataRequestedId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_classDefinition forKey:kGLSDataClassDefinition];
    [aCoder encodeDouble:_requestedId forKey:kGLSDataRequestedId];
}

- (id)copyWithZone:(NSZone *)zone
{
    GLSData *copy = [[GLSData alloc] init];
    
    if (copy) {

        copy.classDefinition = [self.classDefinition copyWithZone:zone];
        copy.requestedId = self.requestedId;
    }
    
    return copy;
}


@end
