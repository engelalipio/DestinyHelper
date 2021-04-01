//
//  INSTPrimaryStat.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INSTPrimaryStat : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double value;
@property (nonatomic, assign) double statHash;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
