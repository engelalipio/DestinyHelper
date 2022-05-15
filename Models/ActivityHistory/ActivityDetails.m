//
//  ActivityDetails.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "ActivityDetails.h"


NSString *const kActivityDetailsInstanceId = @"instanceId";
NSString *const kActivityDetailsModes = @"modes";
NSString *const kActivityDetailsMode = @"mode";
NSString *const kActivityDetailsMembershipType = @"membershipType";
NSString *const kActivityDetailsDirectorActivityHash = @"directorActivityHash";
NSString *const kActivityDetailsReferenceId = @"referenceId";
NSString *const kActivityDetailsIsPrivate = @"isPrivate";


@interface ActivityDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ActivityDetails

@synthesize instanceId = _instanceId;
@synthesize modes = _modes;
@synthesize mode = _mode;
@synthesize membershipType = _membershipType;
@synthesize directorActivityHash = _directorActivityHash;
@synthesize referenceId = _referenceId;
@synthesize isPrivate = _isPrivate;


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
            self.instanceId = [self objectOrNilForKey:kActivityDetailsInstanceId fromDictionary:dict];
            self.modes = [self objectOrNilForKey:kActivityDetailsModes fromDictionary:dict];
            self.mode = [[self objectOrNilForKey:kActivityDetailsMode fromDictionary:dict] doubleValue];
            self.membershipType = [[self objectOrNilForKey:kActivityDetailsMembershipType fromDictionary:dict] doubleValue];
            self.directorActivityHash = [[self objectOrNilForKey:kActivityDetailsDirectorActivityHash fromDictionary:dict] doubleValue];
            self.referenceId = [[self objectOrNilForKey:kActivityDetailsReferenceId fromDictionary:dict] doubleValue];
            self.isPrivate = [[self objectOrNilForKey:kActivityDetailsIsPrivate fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.instanceId forKey:kActivityDetailsInstanceId];
    NSMutableArray *tempArrayForModes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.modes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForModes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForModes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForModes] forKey:kActivityDetailsModes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mode] forKey:kActivityDetailsMode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kActivityDetailsMembershipType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.directorActivityHash] forKey:kActivityDetailsDirectorActivityHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.referenceId] forKey:kActivityDetailsReferenceId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPrivate] forKey:kActivityDetailsIsPrivate];

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

    self.instanceId = [aDecoder decodeObjectForKey:kActivityDetailsInstanceId];
    self.modes = [aDecoder decodeObjectForKey:kActivityDetailsModes];
    self.mode = [aDecoder decodeDoubleForKey:kActivityDetailsMode];
    self.membershipType = [aDecoder decodeDoubleForKey:kActivityDetailsMembershipType];
    self.directorActivityHash = [aDecoder decodeDoubleForKey:kActivityDetailsDirectorActivityHash];
    self.referenceId = [aDecoder decodeDoubleForKey:kActivityDetailsReferenceId];
    self.isPrivate = [aDecoder decodeBoolForKey:kActivityDetailsIsPrivate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_instanceId forKey:kActivityDetailsInstanceId];
    [aCoder encodeObject:_modes forKey:kActivityDetailsModes];
    [aCoder encodeDouble:_mode forKey:kActivityDetailsMode];
    [aCoder encodeDouble:_membershipType forKey:kActivityDetailsMembershipType];
    [aCoder encodeDouble:_directorActivityHash forKey:kActivityDetailsDirectorActivityHash];
    [aCoder encodeDouble:_referenceId forKey:kActivityDetailsReferenceId];
    [aCoder encodeBool:_isPrivate forKey:kActivityDetailsIsPrivate];
}

- (id)copyWithZone:(NSZone *)zone
{
    ActivityDetails *copy = [[ActivityDetails alloc] init];
    
    if (copy) {

        copy.instanceId = [self.instanceId copyWithZone:zone];
        copy.modes = [self.modes copyWithZone:zone];
        copy.mode = self.mode;
        copy.membershipType = self.membershipType;
        copy.directorActivityHash = self.directorActivityHash;
        copy.referenceId = self.referenceId;
        copy.isPrivate = self.isPrivate;
    }
    
    return copy;
}


@end
