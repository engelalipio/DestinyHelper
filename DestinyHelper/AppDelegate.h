//
//  AppDelegate.h
//  DestinyHelper
//
//  Created by Bertle on 9/28/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkAPISingleClient+Auth.h"
#import "DataModels.h"

//1 = Xbox, 2 = Playstation, 4 = PC
enum Destiny2MembershipType{
     Xbox = 1,
     Playstation = 2,
     PC = 4
};

enum Destiny2RaceType{
    Human = 0,
    Awoken = 1,
    Exo = 2,
    RaceUnknown = 3
};

enum Destiny2GenderType{
    Male = 0,
    Female = 1,
    GenderUnknown = 2
};

enum Destiny2TierType{
    TierUnknown = 0,
    TierCurrency = 1,
    TierBasic = 2,
    Common =3,
    Rare = 4,
    Superior = 5,
    Exotic = 6
};

enum DestinyBucketScope{
    Character= 0,
    Account= 1
};

enum Destiny2BucketCategory{
    Invisible = 0,
    Item = 1,
    Currency = 2,
    Equippable = 3,
    Ignored = 4
};

enum Destiny2ItemLocation{
    LocationUnknown = 0,
    Inventory = 1,
    Vault = 2,
    Vendor = 3,
    Postmaster = 4
};

enum Destiny2StatAggregationType{
    StatCharacterAverage = 0,
    StatCharacter = 1,
    StatItem = 2
};

enum Destiny2StatCategory{
    Gameplay = 0,
    Weapon = 1,
    Defense = 2,
    Primary = 3
};


enum Destiny2AmmunitionType{
    None = 0,
    AmmoPrimary = 1,
    Special = 2,
    Heavy = 3,
    Unknown = 4
};

enum Destiny2ItemBindStatus{
    NotBound=0,
    BoundToCharacter= 1,
    BoundToAccount= 2,
    BoundToGuild= 3
};

enum Destiny2TransferStatus{
    CanTransfer= 0, //The item can be transferred.
    ItemIsEquipped= 1, //You can't transfer the item because it is equipped on a character.
    NotTransferrable= 2, //The item is defined as not transferrable in its DestinyInventoryItemDefinition.nonTransferrable property.
    NoRoomInDestination= 4//You could transfer the item, but the place you're trying to put it has run out of room! Check your remaining Vault and/or character space.
};

enum Destiny2ItemState{
    StateNone= 0,
    Locked= 1,//If this bit is set, the item has been "locked" by the user and cannot be deleted. You may want to represent this visually with a "lock" icon.
    Tracked= 2,//If this bit is set, the item is a quest that's being tracked by the user. You may want a visual indicator to show that this is a tracked quest.
    Masterwork= 4//If this bit is set, the item has a Masterwork plug inserted. This usually coincides with having a special "glowing" effect applied to the item's icon.
};

enum Destiny2PrivacyLevel{
    PrivacyNone= 0,
    Public= 1,
    Private= 2
};


enum Destiny2ActivityMode{
    ModeNone= 0, //Activities that are neither PVP nor PVE, such as social activities.
    PvE= 1,//PvE activities, where you shoot aliens in the face.
    PvP= 2,//PvP activities, where you shoot your "friends".
    PvECompetitive= 3//PVE competitive activities, where you shoot whoever you want whenever you want. Or run around collecting small glowing triangles.
};

enum Destiny2ActivityNavPointType{
    Inactive = 0,
    PrimaryObjective= 1,
    SecondaryObjective = 2,
    TravelObjective = 3,
    PublicEventObjective= 4,
    AmmoCache= 5,
    PointTypeFlag= 6,
    CapturePoint= 7,
    DefensiveEncounter= 8,
    GhostInteraction= 9,
    KillAi= 10,
    QuestItem= 11,
    PatrolMission= 12,
    Incoming= 13,
    ArenaObjective= 14,
    AutomationHint= 15,
    TrackedQuest= 16
};

enum Destiny2ActivityItemSubType{
    SubTypeNone= 0,
    Crucible= 1,//DEPRECATED. Items can be both "Crucible" and something else interesting.
    Vanguard= 2,//DEPRECATED. An item can both be "Vanguard" and something else.
    SubTypeExotic= 5,//DEPRECATED. An item can both be Exotic and something else.
    AutoRifle= 6,
    Shotgun= 7,
    Machinegun= 8,
    HandCannon= 9,
    RocketLauncher= 10,
    FusionRifle= 11,
    SniperRifle= 12,
    PulseRifle= 13,
    ScoutRifle= 14,
    Crm= 16,//DEPRECATED. An item can both be CRM and something else.
    Sidearm= 17,
    Sword= 18,
    Mask= 19,
    Shader= 20,
    Ornament= 21,
    FusionRifleLine= 22,
    GrenadeLauncher=23,
    SubmachineGun= 24,
    TraceRifle= 25,
    HelmetArmor= 26,
    GauntletsArmor= 27,
    ChestArmor= 28,
    LegArmor= 29,
    ClassArmor= 30,
    Bow= 31,
    DummyRepeatableBounty= 32
};

enum Destiny2GraphNodeState{
    Hidden= 0,
    Visible= 1,
    Teaser= 2,
    Incomplete= 3,
    Completed= 4
};

enum Destiny2RewardSourceCategory{
    SourceCatNone= 0,//The source doesn't fit well into any of the other types.
    Activity= 1,//The source is directly related to the rewards gained by playing an activity or set of activities. This currently includes Quests and other action in-game.
    SourceCatVendor= 2,//This source is directly related to items that Vendors sell.
    Aggregate= 3,//This source is a custom aggregation of items that can be earned in many ways, but that share some other property in common that is useful to share. For instance, in Destiny 1 we would make "Reward Sources" for every game expansion: that way, you could search reward sources to see what items became available with any given Expansion.
};

enum Destiny2PresentationDisplayStyle{
    Category= 0,//Display the item as a category, through which sub-items are filtered.
    Badge= 1,
    Medals= 2,
    Collectible= 3,
    Record= 4
};

enum Destiny2PlugUiStyles{
    PlugNone= 0,
    PlugMasterwork= 1
};

enum Destiny2PlugAvailabilityMode{
    Normal= 0,
    UnavailableIfSocketContainsMatchingPlugCategory= 1,
    AvailableIfSocketContainsMatchingPlugCategory= 2
};

enum Destiny2EnergyType{
    Any= 0,
    Arc= 1,
    Thermal= 2,
    Void= 3,
    Ghost= 4,
    Subclass= 5
};

enum Destiny2ItemPerkVisibility{
    PerkVisible= 0,
    PerkDisabled= 1,
    PerkHidden= 2
};

enum Destiny2BreakerType{
    BreakerNone= 0,
    ShieldPiercing= 1,
    Disruption= 2,
    Stagger= 3
};

enum Destiny2DamageType{
    DamageNone= 0,
    Kinetic= 1,
    DamageArc= 2,
    DamageThermal= 3,
    DamageVoid= 4,
    Raid= 5,
    Stasis= 6
};

enum Destiny2SocketCategoryStyle{
    SocketUnknown= 0,
    Reusable= 1,
    Consumable= 2,
    Unlockable= 3,
    Intrinsic= 4,
    EnergyMeter= 5,
    LargePerk= 6,
    Abilities= 7,
    Supers= 8
};

enum Destiny2SocketTypeActionType{
    InsertPlug= 0,
    InfuseItem= 1,
    ReinitializeSocket= 2
};

enum Destiny2ItemSortType{
    ItemId= 0,
    Timestamp= 1,
    StackSize= 2
};

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (assign,nonatomic) NSInteger interval;

@property (assign,nonatomic) BOOL isManifestLoaded;

@property (assign,nonatomic) BOOL isCharsLoaded;

@property (assign,nonatomic) BOOL isPublicVendorsLoaded;

@property (assign,nonatomic) BOOL isClanLoaded;

@property (assign,nonatomic) BOOL isOffLine;

@property (nonatomic,strong) NSArray *destinyMemberships;

@property (nonatomic,strong) NSArray *destinyCharacters;

@property (nonatomic,strong) NSArray *destinyVendors;

@property (nonatomic,strong) USRResponse *currentProfile;

@property (nonatomic,strong) CLNDetail *currentClan;

@property (nonatomic,strong) MBRResponse *currentMembership;

@property (nonatomic,assign) enum Destiny2MembershipType currentMembershipType;

@property (nonatomic,strong) VNDBaseClass *currentPublicVendors;

@property (nonatomic,strong) Response *currentAuthResponse;

@property (nonatomic,strong) AccessToken *currentAccessToken;

@property (nonatomic,strong) RefreshToken *currentRefreshToken;

@property (nonatomic,strong) NSDictionary *destinyManifest;

@property (nonatomic,strong) NSDictionary *destinyClassDefinitions;

@property (nonatomic,strong) NSDictionary *destinyGenderDefinitions;

@property (nonatomic,strong) NSDictionary *destinyInventoryBucketDefinitions;

@property (nonatomic,strong) NSMutableDictionary *destinyInventoryItemDefinitions;

@property (nonatomic,strong) NSDictionary *destinyItemCategoryDefinitions;

@property (nonatomic,strong) NSDictionary *destinyVendorGroupDefinitions;

@property (nonatomic,strong) NSDictionary *destinyItemVendorsDetailDefinitions;

@property (nonatomic,strong) NSDictionary *destinyActivityModeDefinitions;

@property (nonatomic,strong) NSString *currentLocale;

@property (nonatomic,strong) NSString *currentAccessTokenValue;

@property (nonatomic,strong) NSString *currentMembershipID;

@property (strong, nonatomic) NSUserDefaults *userSettings;

+(AppDelegate *) currentDelegate;

-(void) loadCharacters: (NSNotification *) anyMembership;

@end

