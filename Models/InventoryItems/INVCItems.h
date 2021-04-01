//
//  INVCItems.h
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INVCItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double quantity;
@property (nonatomic, assign) double state;
@property (nonatomic, strong) NSArray *tooltipNotificationIndexes;
@property (nonatomic, assign) BOOL lockable;
@property (nonatomic, assign) BOOL isWrapper;
@property (nonatomic, assign) double itemHash;
@property (nonatomic, assign) double bindStatus;
@property (nonatomic, assign) double dismantlePermission;
@property (nonatomic, assign) double location;
@property (nonatomic, strong) NSString *itemInstanceId;
@property (nonatomic, assign) double bucketHash;
@property (nonatomic, assign) double transferStatus;
@property (nonatomic, assign) double versionNumber;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
