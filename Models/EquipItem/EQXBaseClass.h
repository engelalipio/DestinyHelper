//
//  EQXBaseClass.h
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface EQXBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, assign) double membershipType;
@property (nonatomic, strong) NSString *characterId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
