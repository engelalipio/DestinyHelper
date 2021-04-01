//
//  INVDBackgroundColor.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INVDBackgroundColor : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double red;
@property (nonatomic, assign) double alpha;
@property (nonatomic, assign) double blue;
@property (nonatomic, assign) double green;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
