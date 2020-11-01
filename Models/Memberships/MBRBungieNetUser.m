//
//  MBRBungieNetUser.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MBRBungieNetUser.h"


NSString *const kMBRBungieNetUserProfilePicture = @"profilePicture";
NSString *const kMBRBungieNetUserIsDeleted = @"isDeleted";
NSString *const kMBRBungieNetUserUserTitleDisplay = @"userTitleDisplay";
NSString *const kMBRBungieNetUserShowGroupMessaging = @"showGroupMessaging";
NSString *const kMBRBungieNetUserFirstAccess = @"firstAccess";
NSString *const kMBRBungieNetUserMembershipId = @"membershipId";
NSString *const kMBRBungieNetUserDisplayName = @"displayName";
NSString *const kMBRBungieNetUserProfileTheme = @"profileTheme";
NSString *const kMBRBungieNetUserLastUpdate = @"lastUpdate";
NSString *const kMBRBungieNetUserLocale = @"locale";
NSString *const kMBRBungieNetUserProfilePicturePath = @"profilePicturePath";
NSString *const kMBRBungieNetUserSuccessMessageFlags = @"successMessageFlags";
NSString *const kMBRBungieNetUserAbout = @"about";
NSString *const kMBRBungieNetUserUniqueName = @"uniqueName";
NSString *const kMBRBungieNetUserUserTitle = @"userTitle";
NSString *const kMBRBungieNetUserLocaleInheritDefault = @"localeInheritDefault";
NSString *const kMBRBungieNetUserProfileThemeName = @"profileThemeName";
NSString *const kMBRBungieNetUserStatusDate = @"statusDate";
NSString *const kMBRBungieNetUserShowActivity = @"showActivity";
NSString *const kMBRBungieNetUserStatusText = @"statusText";
NSString *const kMBRBungieNetUserXboxDisplayName = @"xboxDisplayName";


@interface MBRBungieNetUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MBRBungieNetUser

@synthesize profilePicture = _profilePicture;
@synthesize isDeleted = _isDeleted;
@synthesize userTitleDisplay = _userTitleDisplay;
@synthesize showGroupMessaging = _showGroupMessaging;
@synthesize firstAccess = _firstAccess;
@synthesize membershipId = _membershipId;
@synthesize displayName = _displayName;
@synthesize profileTheme = _profileTheme;
@synthesize lastUpdate = _lastUpdate;
@synthesize locale = _locale;
@synthesize profilePicturePath = _profilePicturePath;
@synthesize successMessageFlags = _successMessageFlags;
@synthesize about = _about;
@synthesize uniqueName = _uniqueName;
@synthesize userTitle = _userTitle;
@synthesize localeInheritDefault = _localeInheritDefault;
@synthesize profileThemeName = _profileThemeName;
@synthesize statusDate = _statusDate;
@synthesize showActivity = _showActivity;
@synthesize statusText = _statusText;
@synthesize xboxDisplayName = _xboxDisplayName;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.profilePicture = [[self objectOrNilForKey:kMBRBungieNetUserProfilePicture fromDictionary:dict] doubleValue];
            self.isDeleted = [[self objectOrNilForKey:kMBRBungieNetUserIsDeleted fromDictionary:dict] boolValue];
            self.userTitleDisplay = [self objectOrNilForKey:kMBRBungieNetUserUserTitleDisplay fromDictionary:dict];
            self.showGroupMessaging = [[self objectOrNilForKey:kMBRBungieNetUserShowGroupMessaging fromDictionary:dict] boolValue];
            self.firstAccess = [self objectOrNilForKey:kMBRBungieNetUserFirstAccess fromDictionary:dict];
            self.membershipId = [self objectOrNilForKey:kMBRBungieNetUserMembershipId fromDictionary:dict];
            self.displayName = [self objectOrNilForKey:kMBRBungieNetUserDisplayName fromDictionary:dict];
            self.profileTheme = [[self objectOrNilForKey:kMBRBungieNetUserProfileTheme fromDictionary:dict] doubleValue];
            self.lastUpdate = [self objectOrNilForKey:kMBRBungieNetUserLastUpdate fromDictionary:dict];
            self.locale = [self objectOrNilForKey:kMBRBungieNetUserLocale fromDictionary:dict];
            self.profilePicturePath = [self objectOrNilForKey:kMBRBungieNetUserProfilePicturePath fromDictionary:dict];
            self.successMessageFlags = [self objectOrNilForKey:kMBRBungieNetUserSuccessMessageFlags fromDictionary:dict];
            self.about = [self objectOrNilForKey:kMBRBungieNetUserAbout fromDictionary:dict];
            self.uniqueName = [self objectOrNilForKey:kMBRBungieNetUserUniqueName fromDictionary:dict];
            self.userTitle = [[self objectOrNilForKey:kMBRBungieNetUserUserTitle fromDictionary:dict] doubleValue];
            self.localeInheritDefault = [[self objectOrNilForKey:kMBRBungieNetUserLocaleInheritDefault fromDictionary:dict] boolValue];
            self.profileThemeName = [self objectOrNilForKey:kMBRBungieNetUserProfileThemeName fromDictionary:dict];
            self.statusDate = [self objectOrNilForKey:kMBRBungieNetUserStatusDate fromDictionary:dict];
            self.showActivity = [[self objectOrNilForKey:kMBRBungieNetUserShowActivity fromDictionary:dict] boolValue];
            self.statusText = [self objectOrNilForKey:kMBRBungieNetUserStatusText fromDictionary:dict];
            self.xboxDisplayName = [self objectOrNilForKey:kMBRBungieNetUserXboxDisplayName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.profilePicture] forKey:kMBRBungieNetUserProfilePicture];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDeleted] forKey:kMBRBungieNetUserIsDeleted];
    [mutableDict setValue:self.userTitleDisplay forKey:kMBRBungieNetUserUserTitleDisplay];
    [mutableDict setValue:[NSNumber numberWithBool:self.showGroupMessaging] forKey:kMBRBungieNetUserShowGroupMessaging];
    [mutableDict setValue:self.firstAccess forKey:kMBRBungieNetUserFirstAccess];
    [mutableDict setValue:self.membershipId forKey:kMBRBungieNetUserMembershipId];
    [mutableDict setValue:self.displayName forKey:kMBRBungieNetUserDisplayName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.profileTheme] forKey:kMBRBungieNetUserProfileTheme];
    [mutableDict setValue:self.lastUpdate forKey:kMBRBungieNetUserLastUpdate];
    [mutableDict setValue:self.locale forKey:kMBRBungieNetUserLocale];
    [mutableDict setValue:self.profilePicturePath forKey:kMBRBungieNetUserProfilePicturePath];
    [mutableDict setValue:self.successMessageFlags forKey:kMBRBungieNetUserSuccessMessageFlags];
    [mutableDict setValue:self.about forKey:kMBRBungieNetUserAbout];
    [mutableDict setValue:self.uniqueName forKey:kMBRBungieNetUserUniqueName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userTitle] forKey:kMBRBungieNetUserUserTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.localeInheritDefault] forKey:kMBRBungieNetUserLocaleInheritDefault];
    [mutableDict setValue:self.profileThemeName forKey:kMBRBungieNetUserProfileThemeName];
    [mutableDict setValue:self.statusDate forKey:kMBRBungieNetUserStatusDate];
    [mutableDict setValue:[NSNumber numberWithBool:self.showActivity] forKey:kMBRBungieNetUserShowActivity];
    [mutableDict setValue:self.statusText forKey:kMBRBungieNetUserStatusText];
    [mutableDict setValue:self.xboxDisplayName forKey:kMBRBungieNetUserXboxDisplayName];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.profilePicture = [aDecoder decodeDoubleForKey:kMBRBungieNetUserProfilePicture];
    self.isDeleted = [aDecoder decodeBoolForKey:kMBRBungieNetUserIsDeleted];
    self.userTitleDisplay = [aDecoder decodeObjectForKey:kMBRBungieNetUserUserTitleDisplay];
    self.showGroupMessaging = [aDecoder decodeBoolForKey:kMBRBungieNetUserShowGroupMessaging];
    self.firstAccess = [aDecoder decodeObjectForKey:kMBRBungieNetUserFirstAccess];
    self.membershipId = [aDecoder decodeObjectForKey:kMBRBungieNetUserMembershipId];
    self.displayName = [aDecoder decodeObjectForKey:kMBRBungieNetUserDisplayName];
    self.profileTheme = [aDecoder decodeDoubleForKey:kMBRBungieNetUserProfileTheme];
    self.lastUpdate = [aDecoder decodeObjectForKey:kMBRBungieNetUserLastUpdate];
    self.locale = [aDecoder decodeObjectForKey:kMBRBungieNetUserLocale];
    self.profilePicturePath = [aDecoder decodeObjectForKey:kMBRBungieNetUserProfilePicturePath];
    self.successMessageFlags = [aDecoder decodeObjectForKey:kMBRBungieNetUserSuccessMessageFlags];
    self.about = [aDecoder decodeObjectForKey:kMBRBungieNetUserAbout];
    self.uniqueName = [aDecoder decodeObjectForKey:kMBRBungieNetUserUniqueName];
    self.userTitle = [aDecoder decodeDoubleForKey:kMBRBungieNetUserUserTitle];
    self.localeInheritDefault = [aDecoder decodeBoolForKey:kMBRBungieNetUserLocaleInheritDefault];
    self.profileThemeName = [aDecoder decodeObjectForKey:kMBRBungieNetUserProfileThemeName];
    self.statusDate = [aDecoder decodeObjectForKey:kMBRBungieNetUserStatusDate];
    self.showActivity = [aDecoder decodeBoolForKey:kMBRBungieNetUserShowActivity];
    self.statusText = [aDecoder decodeObjectForKey:kMBRBungieNetUserStatusText];
    self.xboxDisplayName = [aDecoder decodeObjectForKey:kMBRBungieNetUserXboxDisplayName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_profilePicture forKey:kMBRBungieNetUserProfilePicture];
    [aCoder encodeBool:_isDeleted forKey:kMBRBungieNetUserIsDeleted];
    [aCoder encodeObject:_userTitleDisplay forKey:kMBRBungieNetUserUserTitleDisplay];
    [aCoder encodeBool:_showGroupMessaging forKey:kMBRBungieNetUserShowGroupMessaging];
    [aCoder encodeObject:_firstAccess forKey:kMBRBungieNetUserFirstAccess];
    [aCoder encodeObject:_membershipId forKey:kMBRBungieNetUserMembershipId];
    [aCoder encodeObject:_displayName forKey:kMBRBungieNetUserDisplayName];
    [aCoder encodeDouble:_profileTheme forKey:kMBRBungieNetUserProfileTheme];
    [aCoder encodeObject:_lastUpdate forKey:kMBRBungieNetUserLastUpdate];
    [aCoder encodeObject:_locale forKey:kMBRBungieNetUserLocale];
    [aCoder encodeObject:_profilePicturePath forKey:kMBRBungieNetUserProfilePicturePath];
    [aCoder encodeObject:_successMessageFlags forKey:kMBRBungieNetUserSuccessMessageFlags];
    [aCoder encodeObject:_about forKey:kMBRBungieNetUserAbout];
    [aCoder encodeObject:_uniqueName forKey:kMBRBungieNetUserUniqueName];
    [aCoder encodeDouble:_userTitle forKey:kMBRBungieNetUserUserTitle];
    [aCoder encodeBool:_localeInheritDefault forKey:kMBRBungieNetUserLocaleInheritDefault];
    [aCoder encodeObject:_profileThemeName forKey:kMBRBungieNetUserProfileThemeName];
    [aCoder encodeObject:_statusDate forKey:kMBRBungieNetUserStatusDate];
    [aCoder encodeBool:_showActivity forKey:kMBRBungieNetUserShowActivity];
    [aCoder encodeObject:_statusText forKey:kMBRBungieNetUserStatusText];
    [aCoder encodeObject:_xboxDisplayName forKey:kMBRBungieNetUserXboxDisplayName];
}

- (id)copyWithZone:(NSZone *)zone
{
    MBRBungieNetUser *copy = [[MBRBungieNetUser alloc] init];
    
    if (copy) {

        copy.profilePicture = self.profilePicture;
        copy.isDeleted = self.isDeleted;
        copy.userTitleDisplay = [self.userTitleDisplay copyWithZone:zone];
        copy.showGroupMessaging = self.showGroupMessaging;
        copy.firstAccess = [self.firstAccess copyWithZone:zone];
        copy.membershipId = [self.membershipId copyWithZone:zone];
        copy.displayName = [self.displayName copyWithZone:zone];
        copy.profileTheme = self.profileTheme;
        copy.lastUpdate = [self.lastUpdate copyWithZone:zone];
        copy.locale = [self.locale copyWithZone:zone];
        copy.profilePicturePath = [self.profilePicturePath copyWithZone:zone];
        copy.successMessageFlags = [self.successMessageFlags copyWithZone:zone];
        copy.about = [self.about copyWithZone:zone];
        copy.uniqueName = [self.uniqueName copyWithZone:zone];
        copy.userTitle = self.userTitle;
        copy.localeInheritDefault = self.localeInheritDefault;
        copy.profileThemeName = [self.profileThemeName copyWithZone:zone];
        copy.statusDate = [self.statusDate copyWithZone:zone];
        copy.showActivity = self.showActivity;
        copy.statusText = [self.statusText copyWithZone:zone];
        copy.xboxDisplayName = [self.xboxDisplayName copyWithZone:zone];
    }
    
    return copy;
}


@end
