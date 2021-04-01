//
//  INVDSockets.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INVDSockets : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *socketCategories;
@property (nonatomic, strong) NSArray *intrinsicSockets;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSArray *socketEntries;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
