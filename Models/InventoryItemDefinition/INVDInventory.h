//
//  INVDInventory.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INVDInventory : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double maxStackSize;
@property (nonatomic, assign) double bucketTypeHash;
@property (nonatomic, strong) NSString *tierTypeName;
@property (nonatomic, assign) BOOL nonTransferrableOriginal;
@property (nonatomic, assign) BOOL isInstanceItem;
@property (nonatomic, strong) NSString *expirationTooltip;
@property (nonatomic, assign) BOOL suppressExpirationWhenObjectivesComplete;
@property (nonatomic, strong) NSString *expiredInActivityMessage;
@property (nonatomic, assign) double tierTypeHash;
@property (nonatomic, assign) double tierType;
@property (nonatomic, strong) NSString *expiredInOrbitMessage;
@property (nonatomic, assign) double recoveryBucketTypeHash;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
