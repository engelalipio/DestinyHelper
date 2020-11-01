//
//  Response.h
//
//  Created by Engel Alipio on 4/27/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RefreshToken, AccessToken;

@interface Response : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *membershipId;
@property (nonatomic, assign) double scope;
@property (nonatomic, strong) RefreshToken *refreshToken;
@property (nonatomic, strong) AccessToken *accessToken;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
