//
//  SRCResponse.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SRCResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *membershipId;
@property (nonatomic, strong) NSString *iconPath;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, assign) double membershipType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
