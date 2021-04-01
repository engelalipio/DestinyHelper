//
//  InfusionProcess.h
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ITMTInfusionProcess : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double baseQualityTransferRatio;
@property (nonatomic, assign) double minimumQualityIncrement;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
