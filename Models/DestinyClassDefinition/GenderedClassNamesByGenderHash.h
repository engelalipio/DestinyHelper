//
//  GenderedClassNamesByGenderHash.h
//
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GenderedClassNamesByGenderHash : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString * MaleHash_3111576190;
@property (nonatomic, strong) NSString * FemaleHash_2204441813;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;


+ (NSString *)maleHash;

+ (NSString *)femaleHash;


@end
