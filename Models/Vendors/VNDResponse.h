//
//  Response.h
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VNDCurrencyLookups, VNDVendorGroups, VNDCategories, VNDVendors, VNDSales;

@interface VNDResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) VNDCurrencyLookups *currencyLookups;
@property (nonatomic, strong) VNDVendorGroups *vendorGroups;
@property (nonatomic, strong) VNDCategories *categories;
@property (nonatomic, strong) VNDVendors *vendors;
@property (nonatomic, strong) VNDSales *sales;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
