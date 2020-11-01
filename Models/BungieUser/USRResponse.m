//
//  USRResponse.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "USRResponse.h"


NSString *const kUSRResponseProfilePicture = @"profilePicture";
NSString *const kUSRResponseIsDeleted = @"isDeleted";
NSString *const kUSRResponseUserTitleDisplay = @"userTitleDisplay";
NSString *const kUSRResponseShowGroupMessaging = @"showGroupMessaging";
NSString *const kUSRResponseFirstAccess = @"firstAccess";
NSString *const kUSRResponseMembershipId = @"membershipId";
NSString *const kUSRResponseDisplayName = @"displayName";
NSString *const kUSRResponseProfileTheme = @"profileTheme";
NSString *const kUSRResponseLastUpdate = @"lastUpdate";
NSString *const kUSRResponseLocale = @"locale";
NSString *const kUSRResponseProfilePicturePath = @"profilePicturePath";
NSString *const kUSRResponseSuccessMessageFlags = @"successMessageFlags";
NSString *const kUSRResponseAbout = @"about";
NSString *const kUSRResponseUniqueName = @"uniqueName";
NSString *const kUSRResponseUserTitle = @"userTitle";
NSString *const kUSRResponseLocaleInheritDefault = @"localeInheritDefault";
NSString *const kUSRResponseProfileThemeName = @"profileThemeName";
NSString *const kUSRResponseStatusDate = @"statusDate";
NSString *const kUSRResponseShowActivity = @"showActivity";
NSString *const kUSRResponseStatusText = @"statusText";
NSString *const kUSRResponseXboxDisplayName = @"xboxDisplayName";


@interface USRResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation USRResponse

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


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kUSRResponseMembershipId,@"membershipId",
                         nil];
    
    return map;
}

+ (NSString *)key{
    return nil;
}



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
            self.profilePicture = [[self objectOrNilForKey:kUSRResponseProfilePicture fromDictionary:dict] doubleValue];
            self.isDeleted = [[self objectOrNilForKey:kUSRResponseIsDeleted fromDictionary:dict] boolValue];
            self.userTitleDisplay = [self objectOrNilForKey:kUSRResponseUserTitleDisplay fromDictionary:dict];
            self.showGroupMessaging = [[self objectOrNilForKey:kUSRResponseShowGroupMessaging fromDictionary:dict] boolValue];
            self.firstAccess = [self objectOrNilForKey:kUSRResponseFirstAccess fromDictionary:dict];
            self.membershipId = [self objectOrNilForKey:kUSRResponseMembershipId fromDictionary:dict];
            self.displayName = [self objectOrNilForKey:kUSRResponseDisplayName fromDictionary:dict];
            self.profileTheme = [[self objectOrNilForKey:kUSRResponseProfileTheme fromDictionary:dict] doubleValue];
            self.lastUpdate = [self objectOrNilForKey:kUSRResponseLastUpdate fromDictionary:dict];
            self.locale = [self objectOrNilForKey:kUSRResponseLocale fromDictionary:dict];
            self.profilePicturePath = [self objectOrNilForKey:kUSRResponseProfilePicturePath fromDictionary:dict];
            self.successMessageFlags = [self objectOrNilForKey:kUSRResponseSuccessMessageFlags fromDictionary:dict];
            self.about = [self objectOrNilForKey:kUSRResponseAbout fromDictionary:dict];
            self.uniqueName = [self objectOrNilForKey:kUSRResponseUniqueName fromDictionary:dict];
            self.userTitle = [[self objectOrNilForKey:kUSRResponseUserTitle fromDictionary:dict] doubleValue];
            self.localeInheritDefault = [[self objectOrNilForKey:kUSRResponseLocaleInheritDefault fromDictionary:dict] boolValue];
            self.profileThemeName = [self objectOrNilForKey:kUSRResponseProfileThemeName fromDictionary:dict];
            self.statusDate = [self objectOrNilForKey:kUSRResponseStatusDate fromDictionary:dict];
            self.showActivity = [[self objectOrNilForKey:kUSRResponseShowActivity fromDictionary:dict] boolValue];
            self.statusText = [self objectOrNilForKey:kUSRResponseStatusText fromDictionary:dict];
            self.xboxDisplayName = [self objectOrNilForKey:kUSRResponseXboxDisplayName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.profilePicture] forKey:kUSRResponseProfilePicture];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDeleted] forKey:kUSRResponseIsDeleted];
    [mutableDict setValue:self.userTitleDisplay forKey:kUSRResponseUserTitleDisplay];
    [mutableDict setValue:[NSNumber numberWithBool:self.showGroupMessaging] forKey:kUSRResponseShowGroupMessaging];
    [mutableDict setValue:self.firstAccess forKey:kUSRResponseFirstAccess];
    [mutableDict setValue:self.membershipId forKey:kUSRResponseMembershipId];
    [mutableDict setValue:self.displayName forKey:kUSRResponseDisplayName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.profileTheme] forKey:kUSRResponseProfileTheme];
    [mutableDict setValue:self.lastUpdate forKey:kUSRResponseLastUpdate];
    [mutableDict setValue:self.locale forKey:kUSRResponseLocale];
    [mutableDict setValue:self.profilePicturePath forKey:kUSRResponseProfilePicturePath];
    [mutableDict setValue:self.successMessageFlags forKey:kUSRResponseSuccessMessageFlags];
    [mutableDict setValue:self.about forKey:kUSRResponseAbout];
    [mutableDict setValue:self.uniqueName forKey:kUSRResponseUniqueName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userTitle] forKey:kUSRResponseUserTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.localeInheritDefault] forKey:kUSRResponseLocaleInheritDefault];
    [mutableDict setValue:self.profileThemeName forKey:kUSRResponseProfileThemeName];
    [mutableDict setValue:self.statusDate forKey:kUSRResponseStatusDate];
    [mutableDict setValue:[NSNumber numberWithBool:self.showActivity] forKey:kUSRResponseShowActivity];
    [mutableDict setValue:self.statusText forKey:kUSRResponseStatusText];
    [mutableDict setValue:self.xboxDisplayName forKey:kUSRResponseXboxDisplayName];

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

    self.profilePicture = [aDecoder decodeDoubleForKey:kUSRResponseProfilePicture];
    self.isDeleted = [aDecoder decodeBoolForKey:kUSRResponseIsDeleted];
    self.userTitleDisplay = [aDecoder decodeObjectForKey:kUSRResponseUserTitleDisplay];
    self.showGroupMessaging = [aDecoder decodeBoolForKey:kUSRResponseShowGroupMessaging];
    self.firstAccess = [aDecoder decodeObjectForKey:kUSRResponseFirstAccess];
    self.membershipId = [aDecoder decodeObjectForKey:kUSRResponseMembershipId];
    self.displayName = [aDecoder decodeObjectForKey:kUSRResponseDisplayName];
    self.profileTheme = [aDecoder decodeDoubleForKey:kUSRResponseProfileTheme];
    self.lastUpdate = [aDecoder decodeObjectForKey:kUSRResponseLastUpdate];
    self.locale = [aDecoder decodeObjectForKey:kUSRResponseLocale];
    self.profilePicturePath = [aDecoder decodeObjectForKey:kUSRResponseProfilePicturePath];
    self.successMessageFlags = [aDecoder decodeObjectForKey:kUSRResponseSuccessMessageFlags];
    self.about = [aDecoder decodeObjectForKey:kUSRResponseAbout];
    self.uniqueName = [aDecoder decodeObjectForKey:kUSRResponseUniqueName];
    self.userTitle = [aDecoder decodeDoubleForKey:kUSRResponseUserTitle];
    self.localeInheritDefault = [aDecoder decodeBoolForKey:kUSRResponseLocaleInheritDefault];
    self.profileThemeName = [aDecoder decodeObjectForKey:kUSRResponseProfileThemeName];
    self.statusDate = [aDecoder decodeObjectForKey:kUSRResponseStatusDate];
    self.showActivity = [aDecoder decodeBoolForKey:kUSRResponseShowActivity];
    self.statusText = [aDecoder decodeObjectForKey:kUSRResponseStatusText];
    self.xboxDisplayName = [aDecoder decodeObjectForKey:kUSRResponseXboxDisplayName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_profilePicture forKey:kUSRResponseProfilePicture];
    [aCoder encodeBool:_isDeleted forKey:kUSRResponseIsDeleted];
    [aCoder encodeObject:_userTitleDisplay forKey:kUSRResponseUserTitleDisplay];
    [aCoder encodeBool:_showGroupMessaging forKey:kUSRResponseShowGroupMessaging];
    [aCoder encodeObject:_firstAccess forKey:kUSRResponseFirstAccess];
    [aCoder encodeObject:_membershipId forKey:kUSRResponseMembershipId];
    [aCoder encodeObject:_displayName forKey:kUSRResponseDisplayName];
    [aCoder encodeDouble:_profileTheme forKey:kUSRResponseProfileTheme];
    [aCoder encodeObject:_lastUpdate forKey:kUSRResponseLastUpdate];
    [aCoder encodeObject:_locale forKey:kUSRResponseLocale];
    [aCoder encodeObject:_profilePicturePath forKey:kUSRResponseProfilePicturePath];
    [aCoder encodeObject:_successMessageFlags forKey:kUSRResponseSuccessMessageFlags];
    [aCoder encodeObject:_about forKey:kUSRResponseAbout];
    [aCoder encodeObject:_uniqueName forKey:kUSRResponseUniqueName];
    [aCoder encodeDouble:_userTitle forKey:kUSRResponseUserTitle];
    [aCoder encodeBool:_localeInheritDefault forKey:kUSRResponseLocaleInheritDefault];
    [aCoder encodeObject:_profileThemeName forKey:kUSRResponseProfileThemeName];
    [aCoder encodeObject:_statusDate forKey:kUSRResponseStatusDate];
    [aCoder encodeBool:_showActivity forKey:kUSRResponseShowActivity];
    [aCoder encodeObject:_statusText forKey:kUSRResponseStatusText];
    [aCoder encodeObject:_xboxDisplayName forKey:kUSRResponseXboxDisplayName];
}

- (id)copyWithZone:(NSZone *)zone
{
    USRResponse *copy = [[USRResponse alloc] init];
    
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
