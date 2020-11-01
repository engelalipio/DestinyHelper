//
//  MBRBungieNetUser.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MBRBungieNetUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double profilePicture;
@property (nonatomic, assign) BOOL isDeleted;
@property (nonatomic, strong) NSString *userTitleDisplay;
@property (nonatomic, assign) BOOL showGroupMessaging;
@property (nonatomic, strong) NSString *firstAccess;
@property (nonatomic, strong) NSString *membershipId;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, assign) double profileTheme;
@property (nonatomic, strong) NSString *lastUpdate;
@property (nonatomic, strong) NSString *locale;
@property (nonatomic, strong) NSString *profilePicturePath;
@property (nonatomic, strong) NSString *successMessageFlags;
@property (nonatomic, strong) NSString *about;
@property (nonatomic, strong) NSString *uniqueName;
@property (nonatomic, assign) double userTitle;
@property (nonatomic, assign) BOOL localeInheritDefault;
@property (nonatomic, strong) NSString *profileThemeName;
@property (nonatomic, strong) NSString *statusDate;
@property (nonatomic, assign) BOOL showActivity;
@property (nonatomic, strong) NSString *statusText;
@property (nonatomic, strong) NSString *xboxDisplayName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
