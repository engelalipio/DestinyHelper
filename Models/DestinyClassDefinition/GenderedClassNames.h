//
//  GenderedClassNames.h
//
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GenderedClassNames : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *female;
@property (nonatomic, strong) NSString *male;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

+ (NSString *)maleKey;

+ (NSString *)femaleKey;

@end
