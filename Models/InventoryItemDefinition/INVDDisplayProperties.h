//
//  INVDDisplayProperties.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INVDDisplayProperties : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *iconWatermark;
@property (nonatomic, strong) NSString *displayPropertiesDescription;
@property (nonatomic, strong) NSString *name;

+ (NSDictionary *)mapping;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
