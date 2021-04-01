//
//  Replies.h
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VNDDetailsReplies : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double rewardSiteHash;
@property (nonatomic, strong) NSString *reply;
@property (nonatomic, assign) double replyType;
@property (nonatomic, assign) double itemRewardsSelection;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
