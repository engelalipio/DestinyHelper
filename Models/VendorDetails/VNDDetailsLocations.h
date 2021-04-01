//
//  Locations.h
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VNDDetailsLocations : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *backgroundImagePath;
@property (nonatomic, assign) double destinationHash;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
