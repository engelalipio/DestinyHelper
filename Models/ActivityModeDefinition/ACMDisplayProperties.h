//
//  ACMDisplayProperties.h
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ACMDisplayProperties : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *displayPropertiesDescription;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
