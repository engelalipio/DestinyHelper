//
//  ActivityDetails.h
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ActivityDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *instanceId;
@property (nonatomic, strong) NSArray *modes;
@property (nonatomic, assign) double mode;
@property (nonatomic, assign) double membershipType;
@property (nonatomic, assign) double directorActivityHash;
@property (nonatomic, assign) double referenceId;
@property (nonatomic, assign) BOOL isPrivate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
