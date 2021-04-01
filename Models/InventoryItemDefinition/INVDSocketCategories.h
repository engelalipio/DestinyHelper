//
//  INVDSocketCategories.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INVDSocketCategories : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *socketIndexes;
@property (nonatomic, assign) double socketCategoryHash;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
