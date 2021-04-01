//
//  BCKDisplayProperties.h
//
//  Created by Engel Alipio on 3/9/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BCKDisplayProperties : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
