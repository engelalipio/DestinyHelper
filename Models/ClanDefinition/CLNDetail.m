//
//  Detail.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "CLNDetail.h"
#import "ClanInfo.h"
#import "Features.h"


NSString *const kDetailMembershipOption = @"membershipOption";
NSString *const kDetailBanExpireDate = @"banExpireDate";
NSString *const kDetailMembershipIdCreated = @"membershipIdCreated";
NSString *const kDetailTags = @"tags";
NSString *const kDetailEnableInvitationMessagingForAdmins = @"enableInvitationMessagingForAdmins";
NSString *const kDetailMotto = @"motto";
NSString *const kDetailAllowChat = @"allowChat";
NSString *const kDetailDefaultPublicity = @"defaultPublicity";
NSString *const kDetailIsDefaultPostPublic = @"isDefaultPostPublic";
NSString *const kDetailBannerPath = @"bannerPath";
NSString *const kDetailClanInfo = @"clanInfo";
NSString *const kDetailIsPublicTopicAdminOnly = @"isPublicTopicAdminOnly";
NSString *const kDetailAvatarPath = @"avatarPath";
NSString *const kDetailLocale = @"locale";
NSString *const kDetailHomepage = @"homepage";
NSString *const kDetailName = @"name";
NSString *const kDetailAvatarImageIndex = @"avatarImageIndex";
NSString *const kDetailGroupType = @"groupType";
NSString *const kDetailMemberCount = @"memberCount";
NSString *const kDetailChatSecurity = @"chatSecurity";
NSString *const kDetailModificationDate = @"modificationDate";
NSString *const kDetailAbout = @"about";
NSString *const kDetailTheme = @"theme";
NSString *const kDetailCreationDate = @"creationDate";
NSString *const kDetailGroupId = @"groupId";
NSString *const kDetailIsPublic = @"isPublic";
NSString *const kDetailConversationId = @"conversationId";
NSString *const kDetailFeatures = @"features";


@interface CLNDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLNDetail

@synthesize membershipOption = _membershipOption;
@synthesize banExpireDate = _banExpireDate;
@synthesize membershipIdCreated = _membershipIdCreated;
@synthesize tags = _tags;
@synthesize enableInvitationMessagingForAdmins = _enableInvitationMessagingForAdmins;
@synthesize motto = _motto;
@synthesize allowChat = _allowChat;
@synthesize defaultPublicity = _defaultPublicity;
@synthesize isDefaultPostPublic = _isDefaultPostPublic;
@synthesize bannerPath = _bannerPath;
@synthesize clanInfo = _clanInfo;
@synthesize isPublicTopicAdminOnly = _isPublicTopicAdminOnly;
@synthesize avatarPath = _avatarPath;
@synthesize locale = _locale;
@synthesize homepage = _homepage;
@synthesize name = _name;
@synthesize avatarImageIndex = _avatarImageIndex;
@synthesize groupType = _groupType;
@synthesize memberCount = _memberCount;
@synthesize chatSecurity = _chatSecurity;
@synthesize modificationDate = _modificationDate;
@synthesize about = _about;
@synthesize theme = _theme;
@synthesize creationDate = _creationDate;
@synthesize groupId = _groupId;
@synthesize isPublic = _isPublic;
@synthesize conversationId = _conversationId;
@synthesize features = _features;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kDetailClanInfo,@"clanInfo",
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
            self.membershipOption = [[self objectOrNilForKey:kDetailMembershipOption fromDictionary:dict] doubleValue];
            self.banExpireDate = [self objectOrNilForKey:kDetailBanExpireDate fromDictionary:dict];
            self.membershipIdCreated = [self objectOrNilForKey:kDetailMembershipIdCreated fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kDetailTags fromDictionary:dict];
            self.enableInvitationMessagingForAdmins = [[self objectOrNilForKey:kDetailEnableInvitationMessagingForAdmins fromDictionary:dict] boolValue];
            self.motto = [self objectOrNilForKey:kDetailMotto fromDictionary:dict];
            self.allowChat = [[self objectOrNilForKey:kDetailAllowChat fromDictionary:dict] boolValue];
            self.defaultPublicity = [[self objectOrNilForKey:kDetailDefaultPublicity fromDictionary:dict] doubleValue];
            self.isDefaultPostPublic = [[self objectOrNilForKey:kDetailIsDefaultPostPublic fromDictionary:dict] boolValue];
            self.bannerPath = [self objectOrNilForKey:kDetailBannerPath fromDictionary:dict];
            self.clanInfo = [ClanInfo modelObjectWithDictionary:[dict objectForKey:kDetailClanInfo]];
            self.isPublicTopicAdminOnly = [[self objectOrNilForKey:kDetailIsPublicTopicAdminOnly fromDictionary:dict] boolValue];
            self.avatarPath = [self objectOrNilForKey:kDetailAvatarPath fromDictionary:dict];
            self.locale = [self objectOrNilForKey:kDetailLocale fromDictionary:dict];
            self.homepage = [[self objectOrNilForKey:kDetailHomepage fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kDetailName fromDictionary:dict];
            self.avatarImageIndex = [[self objectOrNilForKey:kDetailAvatarImageIndex fromDictionary:dict] doubleValue];
            self.groupType = [[self objectOrNilForKey:kDetailGroupType fromDictionary:dict] doubleValue];
            self.memberCount = [[self objectOrNilForKey:kDetailMemberCount fromDictionary:dict] doubleValue];
            self.chatSecurity = [[self objectOrNilForKey:kDetailChatSecurity fromDictionary:dict] doubleValue];
            self.modificationDate = [self objectOrNilForKey:kDetailModificationDate fromDictionary:dict];
            self.about = [self objectOrNilForKey:kDetailAbout fromDictionary:dict];
            self.theme = [self objectOrNilForKey:kDetailTheme fromDictionary:dict];
            self.creationDate = [self objectOrNilForKey:kDetailCreationDate fromDictionary:dict];
            self.groupId = [self objectOrNilForKey:kDetailGroupId fromDictionary:dict];
            self.isPublic = [[self objectOrNilForKey:kDetailIsPublic fromDictionary:dict] boolValue];
            self.conversationId = [self objectOrNilForKey:kDetailConversationId fromDictionary:dict];
            self.features = [Features modelObjectWithDictionary:[dict objectForKey:kDetailFeatures]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipOption] forKey:kDetailMembershipOption];
    [mutableDict setValue:self.banExpireDate forKey:kDetailBanExpireDate];
    [mutableDict setValue:self.membershipIdCreated forKey:kDetailMembershipIdCreated];
    NSMutableArray *tempArrayForTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kDetailTags];
    [mutableDict setValue:[NSNumber numberWithBool:self.enableInvitationMessagingForAdmins] forKey:kDetailEnableInvitationMessagingForAdmins];
    [mutableDict setValue:self.motto forKey:kDetailMotto];
    [mutableDict setValue:[NSNumber numberWithBool:self.allowChat] forKey:kDetailAllowChat];
    [mutableDict setValue:[NSNumber numberWithDouble:self.defaultPublicity] forKey:kDetailDefaultPublicity];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDefaultPostPublic] forKey:kDetailIsDefaultPostPublic];
    [mutableDict setValue:self.bannerPath forKey:kDetailBannerPath];
    [mutableDict setValue:[self.clanInfo dictionaryRepresentation] forKey:kDetailClanInfo];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPublicTopicAdminOnly] forKey:kDetailIsPublicTopicAdminOnly];
    [mutableDict setValue:self.avatarPath forKey:kDetailAvatarPath];
    [mutableDict setValue:self.locale forKey:kDetailLocale];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homepage] forKey:kDetailHomepage];
    [mutableDict setValue:self.name forKey:kDetailName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.avatarImageIndex] forKey:kDetailAvatarImageIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupType] forKey:kDetailGroupType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.memberCount] forKey:kDetailMemberCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.chatSecurity] forKey:kDetailChatSecurity];
    [mutableDict setValue:self.modificationDate forKey:kDetailModificationDate];
    [mutableDict setValue:self.about forKey:kDetailAbout];
    [mutableDict setValue:self.theme forKey:kDetailTheme];
    [mutableDict setValue:self.creationDate forKey:kDetailCreationDate];
    [mutableDict setValue:self.groupId forKey:kDetailGroupId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPublic] forKey:kDetailIsPublic];
    [mutableDict setValue:self.conversationId forKey:kDetailConversationId];
    [mutableDict setValue:[self.features dictionaryRepresentation] forKey:kDetailFeatures];

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

    self.membershipOption = [aDecoder decodeDoubleForKey:kDetailMembershipOption];
    self.banExpireDate = [aDecoder decodeObjectForKey:kDetailBanExpireDate];
    self.membershipIdCreated = [aDecoder decodeObjectForKey:kDetailMembershipIdCreated];
    self.tags = [aDecoder decodeObjectForKey:kDetailTags];
    self.enableInvitationMessagingForAdmins = [aDecoder decodeBoolForKey:kDetailEnableInvitationMessagingForAdmins];
    self.motto = [aDecoder decodeObjectForKey:kDetailMotto];
    self.allowChat = [aDecoder decodeBoolForKey:kDetailAllowChat];
    self.defaultPublicity = [aDecoder decodeDoubleForKey:kDetailDefaultPublicity];
    self.isDefaultPostPublic = [aDecoder decodeBoolForKey:kDetailIsDefaultPostPublic];
    self.bannerPath = [aDecoder decodeObjectForKey:kDetailBannerPath];
    self.clanInfo = [aDecoder decodeObjectForKey:kDetailClanInfo];
    self.isPublicTopicAdminOnly = [aDecoder decodeBoolForKey:kDetailIsPublicTopicAdminOnly];
    self.avatarPath = [aDecoder decodeObjectForKey:kDetailAvatarPath];
    self.locale = [aDecoder decodeObjectForKey:kDetailLocale];
    self.homepage = [aDecoder decodeDoubleForKey:kDetailHomepage];
    self.name = [aDecoder decodeObjectForKey:kDetailName];
    self.avatarImageIndex = [aDecoder decodeDoubleForKey:kDetailAvatarImageIndex];
    self.groupType = [aDecoder decodeDoubleForKey:kDetailGroupType];
    self.memberCount = [aDecoder decodeDoubleForKey:kDetailMemberCount];
    self.chatSecurity = [aDecoder decodeDoubleForKey:kDetailChatSecurity];
    self.modificationDate = [aDecoder decodeObjectForKey:kDetailModificationDate];
    self.about = [aDecoder decodeObjectForKey:kDetailAbout];
    self.theme = [aDecoder decodeObjectForKey:kDetailTheme];
    self.creationDate = [aDecoder decodeObjectForKey:kDetailCreationDate];
    self.groupId = [aDecoder decodeObjectForKey:kDetailGroupId];
    self.isPublic = [aDecoder decodeBoolForKey:kDetailIsPublic];
    self.conversationId = [aDecoder decodeObjectForKey:kDetailConversationId];
    self.features = [aDecoder decodeObjectForKey:kDetailFeatures];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_membershipOption forKey:kDetailMembershipOption];
    [aCoder encodeObject:_banExpireDate forKey:kDetailBanExpireDate];
    [aCoder encodeObject:_membershipIdCreated forKey:kDetailMembershipIdCreated];
    [aCoder encodeObject:_tags forKey:kDetailTags];
    [aCoder encodeBool:_enableInvitationMessagingForAdmins forKey:kDetailEnableInvitationMessagingForAdmins];
    [aCoder encodeObject:_motto forKey:kDetailMotto];
    [aCoder encodeBool:_allowChat forKey:kDetailAllowChat];
    [aCoder encodeDouble:_defaultPublicity forKey:kDetailDefaultPublicity];
    [aCoder encodeBool:_isDefaultPostPublic forKey:kDetailIsDefaultPostPublic];
    [aCoder encodeObject:_bannerPath forKey:kDetailBannerPath];
    [aCoder encodeObject:_clanInfo forKey:kDetailClanInfo];
    [aCoder encodeBool:_isPublicTopicAdminOnly forKey:kDetailIsPublicTopicAdminOnly];
    [aCoder encodeObject:_avatarPath forKey:kDetailAvatarPath];
    [aCoder encodeObject:_locale forKey:kDetailLocale];
    [aCoder encodeDouble:_homepage forKey:kDetailHomepage];
    [aCoder encodeObject:_name forKey:kDetailName];
    [aCoder encodeDouble:_avatarImageIndex forKey:kDetailAvatarImageIndex];
    [aCoder encodeDouble:_groupType forKey:kDetailGroupType];
    [aCoder encodeDouble:_memberCount forKey:kDetailMemberCount];
    [aCoder encodeDouble:_chatSecurity forKey:kDetailChatSecurity];
    [aCoder encodeObject:_modificationDate forKey:kDetailModificationDate];
    [aCoder encodeObject:_about forKey:kDetailAbout];
    [aCoder encodeObject:_theme forKey:kDetailTheme];
    [aCoder encodeObject:_creationDate forKey:kDetailCreationDate];
    [aCoder encodeObject:_groupId forKey:kDetailGroupId];
    [aCoder encodeBool:_isPublic forKey:kDetailIsPublic];
    [aCoder encodeObject:_conversationId forKey:kDetailConversationId];
    [aCoder encodeObject:_features forKey:kDetailFeatures];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLNDetail *copy = [[CLNDetail alloc] init];
    
    if (copy) {

        copy.membershipOption = self.membershipOption;
        copy.banExpireDate = [self.banExpireDate copyWithZone:zone];
        copy.membershipIdCreated = [self.membershipIdCreated copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.enableInvitationMessagingForAdmins = self.enableInvitationMessagingForAdmins;
        copy.motto = [self.motto copyWithZone:zone];
        copy.allowChat = self.allowChat;
        copy.defaultPublicity = self.defaultPublicity;
        copy.isDefaultPostPublic = self.isDefaultPostPublic;
        copy.bannerPath = [self.bannerPath copyWithZone:zone];
        copy.clanInfo = [self.clanInfo copyWithZone:zone];
        copy.isPublicTopicAdminOnly = self.isPublicTopicAdminOnly;
        copy.avatarPath = [self.avatarPath copyWithZone:zone];
        copy.locale = [self.locale copyWithZone:zone];
        copy.homepage = self.homepage;
        copy.name = [self.name copyWithZone:zone];
        copy.avatarImageIndex = self.avatarImageIndex;
        copy.groupType = self.groupType;
        copy.memberCount = self.memberCount;
        copy.chatSecurity = self.chatSecurity;
        copy.modificationDate = [self.modificationDate copyWithZone:zone];
        copy.about = [self.about copyWithZone:zone];
        copy.theme = [self.theme copyWithZone:zone];
        copy.creationDate = [self.creationDate copyWithZone:zone];
        copy.groupId = [self.groupId copyWithZone:zone];
        copy.isPublic = self.isPublic;
        copy.conversationId = [self.conversationId copyWithZone:zone];
        copy.features = [self.features copyWithZone:zone];
    }
    
    return copy;
}


@end
