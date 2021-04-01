//
//  BungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties.h
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *requirementsDisplay;
@property (nonatomic, strong) NSString *smallTransparentIcon;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *largeTransparentIcon;
@property (nonatomic, strong) NSString *largeIcon;
@property (nonatomic, strong) NSString *mapIcon;
@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, strong) NSString *bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayPropertiesDescription;
@property (nonatomic, strong) NSString *originalIcon;
@property (nonatomic, strong) NSString *icon;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
