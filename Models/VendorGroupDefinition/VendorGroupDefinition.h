//
//  VendorGroupDefinition.h
//
//  Created by Engel Alipio on 3/2/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VendorGroupDefinition : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, assign) double order;
@property (nonatomic, assign) double hash;
@property (nonatomic, assign) BOOL blacklisted;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, assign) double index;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
