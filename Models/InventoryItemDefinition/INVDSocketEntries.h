//
//  INVDSocketEntries.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INVDSocketEntries : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double plugSources;
@property (nonatomic, assign) BOOL preventInitializationWhenVersioning;
@property (nonatomic, assign) BOOL preventInitializationOnVendorPurchase;
@property (nonatomic, assign) double socketTypeHash;
@property (nonatomic, strong) NSArray *reusablePlugItems;
@property (nonatomic, assign) double reusablePlugSetHash;
@property (nonatomic, assign) double randomizedPlugSetHash;
@property (nonatomic, assign) BOOL overridesUiAppearance;
@property (nonatomic, assign) double singleInitialItemHash;
@property (nonatomic, assign) BOOL defaultVisible;
@property (nonatomic, assign) BOOL hidePerksInItemTooltip;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
