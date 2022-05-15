//
//  Activities.h
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ActivityDetails, Values;

@interface Activities : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *period;
@property (nonatomic, strong) ActivityDetails *activityDetails;
@property (nonatomic, strong) Values *values;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
