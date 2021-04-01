//
//  Data.h
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

 

@interface VNDData : NSObject <NSCoding, NSCopying>

 
@property (nonatomic, strong) NSArray *groups;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
