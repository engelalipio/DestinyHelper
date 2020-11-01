//
//  GLSClassDefinition.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GLSClassDefinition.h"


NSString *const kGLSClassDefinitionClassType = @"classType";
NSString *const kGLSClassDefinitionClassHash = @"classHash";
NSString *const kGLSClassDefinitionClassNameMale = @"classNameMale";
NSString *const kGLSClassDefinitionClassNameFemale = @"classNameFemale";
NSString *const kGLSClassDefinitionClassName = @"className";
NSString *const kGLSClassDefinitionHash = @"hash";
NSString *const kGLSClassDefinitionIndex = @"index";
NSString *const kGLSClassDefinitionMentorVendorIdentifier = @"mentorVendorIdentifier";
NSString *const kGLSClassDefinitionRedacted = @"redacted";
NSString *const kGLSClassDefinitionClassIdentifier = @"classIdentifier";


@interface GLSClassDefinition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GLSClassDefinition

@synthesize classType = _classType;
@synthesize classHash = _classHash;
@synthesize classNameMale = _classNameMale;
@synthesize classNameFemale = _classNameFemale;
@synthesize className = _className;
@synthesize hash = _hash;
@synthesize index = _index;
@synthesize mentorVendorIdentifier = _mentorVendorIdentifier;
@synthesize redacted = _redacted;
@synthesize classIdentifier = _classIdentifier;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGLSClassDefinitionClassIdentifier,@"classIdentifier",
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
            self.classType = [[self objectOrNilForKey:kGLSClassDefinitionClassType fromDictionary:dict] doubleValue];
            self.classHash = [[self objectOrNilForKey:kGLSClassDefinitionClassHash fromDictionary:dict] doubleValue];
            self.classNameMale = [self objectOrNilForKey:kGLSClassDefinitionClassNameMale fromDictionary:dict];
            self.classNameFemale = [self objectOrNilForKey:kGLSClassDefinitionClassNameFemale fromDictionary:dict];
            self.className = [self objectOrNilForKey:kGLSClassDefinitionClassName fromDictionary:dict];
            self.hash = [[self objectOrNilForKey:kGLSClassDefinitionHash fromDictionary:dict] doubleValue];
            self.index = [[self objectOrNilForKey:kGLSClassDefinitionIndex fromDictionary:dict] doubleValue];
            self.mentorVendorIdentifier = [self objectOrNilForKey:kGLSClassDefinitionMentorVendorIdentifier fromDictionary:dict];
            self.redacted = [[self objectOrNilForKey:kGLSClassDefinitionRedacted fromDictionary:dict] boolValue];
            self.classIdentifier = [self objectOrNilForKey:kGLSClassDefinitionClassIdentifier fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classType] forKey:kGLSClassDefinitionClassType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classHash] forKey:kGLSClassDefinitionClassHash];
    [mutableDict setValue:self.classNameMale forKey:kGLSClassDefinitionClassNameMale];
    [mutableDict setValue:self.classNameFemale forKey:kGLSClassDefinitionClassNameFemale];
    [mutableDict setValue:self.className forKey:kGLSClassDefinitionClassName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kGLSClassDefinitionHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kGLSClassDefinitionIndex];
    [mutableDict setValue:self.mentorVendorIdentifier forKey:kGLSClassDefinitionMentorVendorIdentifier];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kGLSClassDefinitionRedacted];
    [mutableDict setValue:self.classIdentifier forKey:kGLSClassDefinitionClassIdentifier];

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

    self.classType = [aDecoder decodeDoubleForKey:kGLSClassDefinitionClassType];
    self.classHash = [aDecoder decodeDoubleForKey:kGLSClassDefinitionClassHash];
    self.classNameMale = [aDecoder decodeObjectForKey:kGLSClassDefinitionClassNameMale];
    self.classNameFemale = [aDecoder decodeObjectForKey:kGLSClassDefinitionClassNameFemale];
    self.className = [aDecoder decodeObjectForKey:kGLSClassDefinitionClassName];
    self.hash = [aDecoder decodeDoubleForKey:kGLSClassDefinitionHash];
    self.index = [aDecoder decodeDoubleForKey:kGLSClassDefinitionIndex];
    self.mentorVendorIdentifier = [aDecoder decodeObjectForKey:kGLSClassDefinitionMentorVendorIdentifier];
    self.redacted = [aDecoder decodeBoolForKey:kGLSClassDefinitionRedacted];
    self.classIdentifier = [aDecoder decodeObjectForKey:kGLSClassDefinitionClassIdentifier];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_classType forKey:kGLSClassDefinitionClassType];
    [aCoder encodeDouble:_classHash forKey:kGLSClassDefinitionClassHash];
    [aCoder encodeObject:_classNameMale forKey:kGLSClassDefinitionClassNameMale];
    [aCoder encodeObject:_classNameFemale forKey:kGLSClassDefinitionClassNameFemale];
    [aCoder encodeObject:_className forKey:kGLSClassDefinitionClassName];
    [aCoder encodeDouble:_hash forKey:kGLSClassDefinitionHash];
    [aCoder encodeDouble:_index forKey:kGLSClassDefinitionIndex];
    [aCoder encodeObject:_mentorVendorIdentifier forKey:kGLSClassDefinitionMentorVendorIdentifier];
    [aCoder encodeBool:_redacted forKey:kGLSClassDefinitionRedacted];
    [aCoder encodeObject:_classIdentifier forKey:kGLSClassDefinitionClassIdentifier];
}

- (id)copyWithZone:(NSZone *)zone
{
    GLSClassDefinition *copy = [[GLSClassDefinition alloc] init];
    
    if (copy) {

        copy.classType = self.classType;
        copy.classHash = self.classHash;
        copy.classNameMale = [self.classNameMale copyWithZone:zone];
        copy.classNameFemale = [self.classNameFemale copyWithZone:zone];
        copy.className = [self.className copyWithZone:zone];
        copy.hash = self.hash;
        copy.index = self.index;
        copy.mentorVendorIdentifier = [self.mentorVendorIdentifier copyWithZone:zone];
        copy.redacted = self.redacted;
        copy.classIdentifier = [self.classIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
