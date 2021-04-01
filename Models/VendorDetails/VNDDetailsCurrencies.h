//
//  Currencies.h
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VNDDetailsCurrencies : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double quantity;
@property (nonatomic, assign) double scalarDenominator;
@property (nonatomic, assign) double itemHash;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
