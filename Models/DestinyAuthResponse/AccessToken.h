//
//  AccessToken.h
//
//  Created by Engel Alipio on 4/27/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AccessToken : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *value;
@property (nonatomic, assign) double readyin;
@property (nonatomic, assign) double expires;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
