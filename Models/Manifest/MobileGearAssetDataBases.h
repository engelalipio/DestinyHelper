//
//  MobileGearAssetDataBases.h
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MobileGearAssetDataBases : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double version;
@property (nonatomic, strong) NSString *path;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
