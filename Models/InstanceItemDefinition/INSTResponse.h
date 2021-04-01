//
//  INSTResponse.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class INSTInstance;

@interface INSTResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *characterId;
@property (nonatomic, strong) INSTInstance *instance;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
