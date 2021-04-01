//
//  VGDBaseClass.m
//
//  Created by Engel Alipio on 3/2/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VGDBaseClass.h"
#import "VendorGroupDefinition.h"


NSString *const kVGDBaseClassVendorGroupDefinition = @"VendorGroupDefinition";



@interface VGDBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VGDBaseClass

@synthesize vendorGroupDefinition = _vendorGroupDefinition;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kVGDBaseClassVendorGroupDefinition,@"VendorGroupDefinition",
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
            self.vendorGroupDefinition = [VendorGroupDefinition modelObjectWithDictionary:[dict objectForKey:kVGDBaseClassVendorGroupDefinition]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.vendorGroupDefinition dictionaryRepresentation] forKey:kVGDBaseClassVendorGroupDefinition];

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

    self.vendorGroupDefinition = [aDecoder decodeObjectForKey:kVGDBaseClassVendorGroupDefinition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_vendorGroupDefinition forKey:kVGDBaseClassVendorGroupDefinition];
}

- (id)copyWithZone:(NSZone *)zone
{
    VGDBaseClass *copy = [[VGDBaseClass alloc] init];
    
    if (copy) {

        copy.vendorGroupDefinition = [self.vendorGroupDefinition copyWithZone:zone];
    }
    
    return copy;
}


@end
