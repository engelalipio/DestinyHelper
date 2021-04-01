//
//  ItemList.h
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VNDDetailsAction;

@interface VNDDetailsItemList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *creationLevels;
@property (nonatomic, assign) double weight;
@property (nonatomic, assign) BOOL priceOverrideEnabled;
@property (nonatomic, assign) double licenseUnlockHash;
@property (nonatomic, assign) double vendorItemIndex;
@property (nonatomic, assign) double refundPolicy;
@property (nonatomic, assign) double rewardAdjustorPointerHash;
@property (nonatomic, assign) double inventoryBucketHash;
@property (nonatomic, strong) NSArray *socketOverrides;
@property (nonatomic, assign) double visibilityScope;
@property (nonatomic, strong) VNDDetailsAction *action;
@property (nonatomic, strong) NSArray *currencies;
@property (nonatomic, assign) double displayCategoryIndex;
@property (nonatomic, assign) double itemHash;
@property (nonatomic, assign) BOOL unpurchasable;
@property (nonatomic, assign) double seedOverride;
@property (nonatomic, assign) double exclusivity;
@property (nonatomic, assign) double sortValue;
@property (nonatomic, strong) NSArray *failureIndexes;
@property (nonatomic, assign) double quantity;
@property (nonatomic, assign) double purchasableScope;
@property (nonatomic, strong) NSArray *redirectToSaleIndexes;
@property (nonatomic, assign) double maximumLevel;
@property (nonatomic, assign) double refundTimeLimit;
@property (nonatomic, strong) NSString *expirationTooltip;
@property (nonatomic, assign) double originalCategoryIndex;
@property (nonatomic, strong) NSString *displayCategory;
@property (nonatomic, assign) double minimumLevel;
@property (nonatomic, assign) double categoryIndex;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
