//
//  CLNMResponse.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Query;

@interface CLNMResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) Query *query;
@property (nonatomic, assign) double totalResults;
@property (nonatomic, assign) BOOL useTotalResults;
@property (nonatomic, assign) BOOL hasMore;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
