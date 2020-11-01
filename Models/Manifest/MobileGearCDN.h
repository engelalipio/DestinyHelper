//
//  MobileGearCDN.h
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MobileGearCDN : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *gear;
@property (nonatomic, strong) NSString *texture;
@property (nonatomic, strong) NSString *geometry;
@property (nonatomic, strong) NSString *shader;
@property (nonatomic, strong) NSString *plateRegion;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
