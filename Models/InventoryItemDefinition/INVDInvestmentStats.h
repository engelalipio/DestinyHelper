//
//  INVDInvestmentStats.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INVDInvestmentStats : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double statTypeHash;
@property (nonatomic, assign) BOOL isConditionallyActive;
@property (nonatomic, assign) double value;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
