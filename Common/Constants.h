//  Constants.h
//  Created by Engel Alipio on 9/26/14.
//  Copyright (c) 2014 All rights reserved.
//  Testing TFS Git server

#define kBungieBaseURL @"https://www.bungie.net"

#define kBungieAPIBaseD2URL @"https://www.bungie.net/Platform/Destiny2"

#define kBungieAPIBaseURL @"https://www.bungie.net/Platform"

#define kBungieNeedsAuthenticateMessage @"Expected status code in (200-299), got 401"

#define kBungieAPIKey @"4842bb28dcf24563af2ae2eba9919cbd"

#define kBungieClientID @"5433"

#define kBungieDefaultMembership @"1"

#define kBungieThemeURL @"https://www.bungie.net/img/userThemes/"

#define kDefaultFontName @"Neue Hass Grotesk Medium"

//BEGIN OAuth Paths

#define kDestinyOAuthSFNotification @"Destiny2.SFOAuth"

//#define kamsDHRedirect @"amsdh://oauth/callback"
#define kamsDHRedirect @"amsdh"

#define kDestinyOriginHeader @"AMSDestinyHelper"

#define kDestinyOAuthAuthorize @"/{locale}/oauth/authorize?client_id={client_id}&response_type=code"

#define kDestinyOAuthRefreshToken @"/app/oauth/token/"

//END   OAuth Paths

//BEGIN Manifest Paths

#define kDestinyManifestNotification @"Destiny2.Manifest"
#define kDestinyLoadedDestinyItemsNotification @"Destiny2.Items"

#define kDestinyLoadedCharactersNotification @"Destiny2.Characters"
#define kDestinyLoadedCharacterNotification @"Destiny2.Character"

#define kDestinyLoadedCharacterInventoryNotification @"Destiny2.CharacterInventory"
#define kDestinyLoadedCharacterEquipmentNotification @"Destiny2.CharacterEquipment"
#define kDestinyLoadedProfileVaultNotification @"Destiny2.Vault"

#define kDestinyLoadedClanInfoNotification @"Destiny2.Clan"

#define kDestinyLoadedPublicVendorsNotification @"Destiny2.PublicVendors"
#define kDestinyLoadedPublicVendorsDetailsNotification @"Destiny2.PublicVendorsDetail"
#define kDestinyLoadedVendorsNotification @"Destiny2.Vendors"
#define kDestinyLoadedVendorNotification @"Destiny2.Vendor"

#define kDestinyLoadedUniqueWeaponsStatsNotification @"Destiny2.UniqueWeaponsStats"

#define kDestinyLoadedStaticItemNotification @"Destiny2.StaticItem"
#define kDestinyLoadedInstancedItemNotification @"Destiny2.InstancedItem"
#define kDestinySendToVaultNotification @"Destiny2.SendToVault"

#define kDestinyTransferItemNotification @"Destiny2.TransferItem"
#define kDestinyTransferToWarlockNotification @"Destiny2.TransferItemWarlock"
#define kDestinyTransferToTitanNotification @"Destiny2.TransferItemTitan"
#define kDestinyTransferToHunterNotification @"Destiny2.TransferItemHunter"

#define kDestinyPullFromPostMasterNotification @"Destiny2.PullFromPostMaster"

#define kDestinyEquipItemNotification @"Destiny2.EquipItem"

#define kDestinyLockItemStateNotification @"Destiny2.LockItemState"

#define kDestinyLoadedMembership @"Destiny2.Membership"

#define kDestinyWorldComponentContentPaths @"jsonWorldComponentContentPaths/{locale}/"

#define kDestinyAchievementDefinitionJSON @"jsonWorldComponentContentPaths/{locale}/DestinyAchievementDefinition"

#define kDestinyActivityDefinitionJSON @"jsonWorldComponentContentPaths/{locale}/DestinyActivityDefinition"

#define kDestinyGenderDefinitionJSON @"jsonWorldComponentContentPaths/{locale}/DestinyGenderDefinition"

#define kDestinyClassDefinitionJSON @"jsonWorldComponentContentPaths/{locale}/DestinyClassDefinition"

#define kDestinyRaceDefinitionJSON @"jsonWorldComponentContentPaths/{locale}/DestinyRaceDefinition"

#define kDestinyProgressionDefinitionJSON @"jsonWorldComponentContentPaths/{locale}/DestinyProgressionDefinition"

#define kDestinyVaultHash @"138197802"

//END Manifest Paths


