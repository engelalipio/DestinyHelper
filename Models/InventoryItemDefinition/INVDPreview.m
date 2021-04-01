//
//  INVDPreview.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDPreview.h"


NSString *const kPreviewPreviewActionString = @"previewActionString";
NSString *const kPreviewScreenStyle = @"screenStyle";
NSString *const kPreviewPreviewVendorHash = @"previewVendorHash";


@interface INVDPreview ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDPreview

@synthesize previewActionString = _previewActionString;
@synthesize screenStyle = _screenStyle;
@synthesize previewVendorHash = _previewVendorHash;


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
            self.previewActionString = [self objectOrNilForKey:kPreviewPreviewActionString fromDictionary:dict];
            self.screenStyle = [self objectOrNilForKey:kPreviewScreenStyle fromDictionary:dict];
            self.previewVendorHash = [[self objectOrNilForKey:kPreviewPreviewVendorHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.previewActionString forKey:kPreviewPreviewActionString];
    [mutableDict setValue:self.screenStyle forKey:kPreviewScreenStyle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.previewVendorHash] forKey:kPreviewPreviewVendorHash];

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

    self.previewActionString = [aDecoder decodeObjectForKey:kPreviewPreviewActionString];
    self.screenStyle = [aDecoder decodeObjectForKey:kPreviewScreenStyle];
    self.previewVendorHash = [aDecoder decodeDoubleForKey:kPreviewPreviewVendorHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_previewActionString forKey:kPreviewPreviewActionString];
    [aCoder encodeObject:_screenStyle forKey:kPreviewScreenStyle];
    [aCoder encodeDouble:_previewVendorHash forKey:kPreviewPreviewVendorHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDPreview *copy = [[INVDPreview alloc] init];
    
    if (copy) {

        copy.previewActionString = [self.previewActionString copyWithZone:zone];
        copy.screenStyle = [self.screenStyle copyWithZone:zone];
        copy.previewVendorHash = self.previewVendorHash;
    }
    
    return copy;
}


@end
