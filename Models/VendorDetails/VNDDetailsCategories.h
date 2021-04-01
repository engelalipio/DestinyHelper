//
//  Categories.h
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VNDDetailsCategories : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double quantityAvailable;
@property (nonatomic, assign) BOOL hideIfNoCurrency;
@property (nonatomic, assign) BOOL isPreview;
@property (nonatomic, strong) NSString *buyStringOverride;
@property (nonatomic, assign) BOOL isDisplayOnly;
@property (nonatomic, assign) double categoryHash;
@property (nonatomic, assign) double resetIntervalMinutesOverride;
@property (nonatomic, assign) double sortValue;
@property (nonatomic, strong) NSString *disabledDescription;
@property (nonatomic, assign) BOOL showUnavailableItems;
@property (nonatomic, assign) BOOL hideFromRegularPurchase;
@property (nonatomic, strong) NSArray *vendorItemIndexes;
@property (nonatomic, assign) double resetOffsetMinutesOverride;
@property (nonatomic, assign) double categoryIndex;
@property (nonatomic, strong) NSString *displayTitle;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
