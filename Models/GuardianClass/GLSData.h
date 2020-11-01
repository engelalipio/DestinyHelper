//
//  GLSData.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GLSClassDefinition;

@interface GLSData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) GLSClassDefinition *classDefinition;
@property (nonatomic, assign) double requestedId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
