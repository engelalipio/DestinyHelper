//
//  Interactions.h
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VNDDetailsHeaderDisplayProperties;

@interface VNDDetailsInteractions : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *flavorLineTwo;
@property (nonatomic, strong) VNDDetailsHeaderDisplayProperties *headerDisplayProperties;
@property (nonatomic, assign) double interactionType;
@property (nonatomic, assign) double questlineItemHash;
@property (nonatomic, assign) double vendorCategoryIndex;
@property (nonatomic, assign) double interactionIndex;
@property (nonatomic, strong) NSString *rewardBlockLabel;
@property (nonatomic, assign) double rewardVendorCategoryIndex;
@property (nonatomic, strong) NSArray *replies;
@property (nonatomic, strong) NSString *flavorLineOne;
@property (nonatomic, strong) NSArray *sackInteractionList;
@property (nonatomic, assign) double uiInteractionType;
@property (nonatomic, strong) NSString *instructions;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
