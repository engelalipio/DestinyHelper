//
//  GLSClassDefinition.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GLSClassDefinition : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double classType;
@property (nonatomic, assign) double classHash;
@property (nonatomic, strong) NSString *classNameMale;
@property (nonatomic, strong) NSString *classNameFemale;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, assign) double hash;
@property (nonatomic, assign) double index;
@property (nonatomic, strong) NSString *mentorVendorIdentifier;
@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, strong) NSString *classIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
