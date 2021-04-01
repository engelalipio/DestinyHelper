//
//  SocketOverrides.h
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VNDDetailsSocketOverrides : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double randomizedOptionsCount;
@property (nonatomic, assign) double socketTypeHash;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
