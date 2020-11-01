//
//  ZhCht.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "ZhCht.h"


NSString *const kZhChtDestinyCharacterCustomizationOptionDefinition = @"DestinyCharacterCustomizationOptionDefinition";
NSString *const kZhChtDestinyProgressionDefinition = @"DestinyProgressionDefinition";
NSString *const kZhChtDestinyItemTierTypeDefinition = @"DestinyItemTierTypeDefinition";
NSString *const kZhChtDestinyActivityInteractableDefinition = @"DestinyActivityInteractableDefinition";
NSString *const kZhChtDestinyUnlockExpressionMappingDefinition = @"DestinyUnlockExpressionMappingDefinition";
NSString *const kZhChtDestinyEquipmentSlotDefinition = @"DestinyEquipmentSlotDefinition";
NSString *const kZhChtDestinyStatGroupDefinition = @"DestinyStatGroupDefinition";
NSString *const kZhChtDestinySeasonDefinition = @"DestinySeasonDefinition";
NSString *const kZhChtDestinyFactionDefinition = @"DestinyFactionDefinition";
NSString *const kZhChtDestinyUnlockValueDefinition = @"DestinyUnlockValueDefinition";
NSString *const kZhChtDestinyActivityDefinition = @"DestinyActivityDefinition";
NSString *const kZhChtDestinyEnemyRaceDefinition = @"DestinyEnemyRaceDefinition";
NSString *const kZhChtDestinySeasonPassDefinition = @"DestinySeasonPassDefinition";
NSString *const kZhChtDestinyVendorDefinition = @"DestinyVendorDefinition";
NSString *const kZhChtDestinyActivityGraphDefinition = @"DestinyActivityGraphDefinition";
NSString *const kZhChtDestinyProgressionMappingDefinition = @"DestinyProgressionMappingDefinition";
NSString *const kZhChtDestinyPlatformBucketMappingDefinition = @"DestinyPlatformBucketMappingDefinition";
NSString *const kZhChtDestinyAchievementDefinition = @"DestinyAchievementDefinition";
NSString *const kZhChtDestinyRewardAdjusterPointerDefinition = @"DestinyRewardAdjusterPointerDefinition";
NSString *const kZhChtDestinyRewardAdjusterProgressionMapDefinition = @"DestinyRewardAdjusterProgressionMapDefinition";
NSString *const kZhChtDestinyInventoryItemDefinition = @"DestinyInventoryItemDefinition";
NSString *const kZhChtDestinyPlaceDefinition = @"DestinyPlaceDefinition";
NSString *const kZhChtDestinyVendorGroupDefinition = @"DestinyVendorGroupDefinition";
NSString *const kZhChtDestinyTraitDefinition = @"DestinyTraitDefinition";
NSString *const kZhChtDestinyLoreDefinition = @"DestinyLoreDefinition";
NSString *const kZhChtDestinyDamageTypeDefinition = @"DestinyDamageTypeDefinition";
NSString *const kZhChtDestinyArtDyeReferenceDefinition = @"DestinyArtDyeReferenceDefinition";
NSString *const kZhChtDestinyMedalTierDefinition = @"DestinyMedalTierDefinition";
NSString *const kZhChtDestinyActivityModifierDefinition = @"DestinyActivityModifierDefinition";
NSString *const kZhChtDestinyInventoryBucketDefinition = @"DestinyInventoryBucketDefinition";
NSString *const kZhChtDestinyGenderDefinition = @"DestinyGenderDefinition";
NSString *const kZhChtDestinyBondDefinition = @"DestinyBondDefinition";
NSString *const kZhChtDestinyRecordDefinition = @"DestinyRecordDefinition";
NSString *const kZhChtDestinyRewardSourceDefinition = @"DestinyRewardSourceDefinition";
NSString *const kZhChtDestinyBreakerTypeDefinition = @"DestinyBreakerTypeDefinition";
NSString *const kZhChtDestinyCollectibleDefinition = @"DestinyCollectibleDefinition";
NSString *const kZhChtDestinyCharacterCustomizationCategoryDefinition = @"DestinyCharacterCustomizationCategoryDefinition";
NSString *const kZhChtDestinySandboxPatternDefinition = @"DestinySandboxPatternDefinition";
NSString *const kZhChtDestinyProgressionLevelRequirementDefinition = @"DestinyProgressionLevelRequirementDefinition";
NSString *const kZhChtDestinyRewardMappingDefinition = @"DestinyRewardMappingDefinition";
NSString *const kZhChtDestinyReportReasonCategoryDefinition = @"DestinyReportReasonCategoryDefinition";
NSString *const kZhChtDestinyPlugSetDefinition = @"DestinyPlugSetDefinition";
NSString *const kZhChtDestinyNodeStepSummaryDefinition = @"DestinyNodeStepSummaryDefinition";
NSString *const kZhChtDestinyUnlockCountMappingDefinition = @"DestinyUnlockCountMappingDefinition";
NSString *const kZhChtDestinySocketTypeDefinition = @"DestinySocketTypeDefinition";
NSString *const kZhChtDestinyMilestoneDefinition = @"DestinyMilestoneDefinition";
NSString *const kZhChtDestinyPresentationNodeDefinition = @"DestinyPresentationNodeDefinition";
NSString *const kZhChtDestinyPowerCapDefinition = @"DestinyPowerCapDefinition";
NSString *const kZhChtDestinyDestinationDefinition = @"DestinyDestinationDefinition";
NSString *const kZhChtDestinyInventoryItemLiteDefinition = @"DestinyInventoryItemLiteDefinition";
NSString *const kZhChtDestinyMetricDefinition = @"DestinyMetricDefinition";
NSString *const kZhChtDestinyRewardSheetDefinition = @"DestinyRewardSheetDefinition";
NSString *const kZhChtDestinyStatDefinition = @"DestinyStatDefinition";
NSString *const kZhChtDestinySackRewardItemListDefinition = @"DestinySackRewardItemListDefinition";
NSString *const kZhChtDestinyUnlockEventDefinition = @"DestinyUnlockEventDefinition";
NSString *const kZhChtDestinyMaterialRequirementSetDefinition = @"DestinyMaterialRequirementSetDefinition";
NSString *const kZhChtDestinyRaceDefinition = @"DestinyRaceDefinition";
NSString *const kZhChtDestinyClassDefinition = @"DestinyClassDefinition";
NSString *const kZhChtDestinyTalentGridDefinition = @"DestinyTalentGridDefinition";
NSString *const kZhChtDestinyUnlockDefinition = @"DestinyUnlockDefinition";
NSString *const kZhChtDestinyActivityTypeDefinition = @"DestinyActivityTypeDefinition";
NSString *const kZhChtDestinyEntitlementOfferDefinition = @"DestinyEntitlementOfferDefinition";
NSString *const kZhChtDestinyObjectiveDefinition = @"DestinyObjectiveDefinition";
NSString *const kZhChtDestinySocketCategoryDefinition = @"DestinySocketCategoryDefinition";
NSString *const kZhChtDestinyItemCategoryDefinition = @"DestinyItemCategoryDefinition";
NSString *const kZhChtDestinyArtifactDefinition = @"DestinyArtifactDefinition";
NSString *const kZhChtDestinyLocationDefinition = @"DestinyLocationDefinition";
NSString *const kZhChtDestinyChecklistDefinition = @"DestinyChecklistDefinition";
NSString *const kZhChtDestinySandboxPerkDefinition = @"DestinySandboxPerkDefinition";
NSString *const kZhChtDestinyPresentationNodeBaseDefinition = @"DestinyPresentationNodeBaseDefinition";
NSString *const kZhChtDestinyEnergyTypeDefinition = @"DestinyEnergyTypeDefinition";
NSString *const kZhChtDestinyActivityModeDefinition = @"DestinyActivityModeDefinition";
NSString *const kZhChtDestinyTraitCategoryDefinition = @"DestinyTraitCategoryDefinition";
NSString *const kZhChtDestinyArtDyeChannelDefinition = @"DestinyArtDyeChannelDefinition";
NSString *const kZhChtDestinyRewardItemListDefinition = @"DestinyRewardItemListDefinition";


@interface ZhCht ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZhCht

@synthesize destinyCharacterCustomizationOptionDefinition = _destinyCharacterCustomizationOptionDefinition;
@synthesize destinyProgressionDefinition = _destinyProgressionDefinition;
@synthesize destinyItemTierTypeDefinition = _destinyItemTierTypeDefinition;
@synthesize destinyActivityInteractableDefinition = _destinyActivityInteractableDefinition;
@synthesize destinyUnlockExpressionMappingDefinition = _destinyUnlockExpressionMappingDefinition;
@synthesize destinyEquipmentSlotDefinition = _destinyEquipmentSlotDefinition;
@synthesize destinyStatGroupDefinition = _destinyStatGroupDefinition;
@synthesize destinySeasonDefinition = _destinySeasonDefinition;
@synthesize destinyFactionDefinition = _destinyFactionDefinition;
@synthesize destinyUnlockValueDefinition = _destinyUnlockValueDefinition;
@synthesize destinyActivityDefinition = _destinyActivityDefinition;
@synthesize destinyEnemyRaceDefinition = _destinyEnemyRaceDefinition;
@synthesize destinySeasonPassDefinition = _destinySeasonPassDefinition;
@synthesize destinyVendorDefinition = _destinyVendorDefinition;
@synthesize destinyActivityGraphDefinition = _destinyActivityGraphDefinition;
@synthesize destinyProgressionMappingDefinition = _destinyProgressionMappingDefinition;
@synthesize destinyPlatformBucketMappingDefinition = _destinyPlatformBucketMappingDefinition;
@synthesize destinyAchievementDefinition = _destinyAchievementDefinition;
@synthesize destinyRewardAdjusterPointerDefinition = _destinyRewardAdjusterPointerDefinition;
@synthesize destinyRewardAdjusterProgressionMapDefinition = _destinyRewardAdjusterProgressionMapDefinition;
@synthesize destinyInventoryItemDefinition = _destinyInventoryItemDefinition;
@synthesize destinyPlaceDefinition = _destinyPlaceDefinition;
@synthesize destinyVendorGroupDefinition = _destinyVendorGroupDefinition;
@synthesize destinyTraitDefinition = _destinyTraitDefinition;
@synthesize destinyLoreDefinition = _destinyLoreDefinition;
@synthesize destinyDamageTypeDefinition = _destinyDamageTypeDefinition;
@synthesize destinyArtDyeReferenceDefinition = _destinyArtDyeReferenceDefinition;
@synthesize destinyMedalTierDefinition = _destinyMedalTierDefinition;
@synthesize destinyActivityModifierDefinition = _destinyActivityModifierDefinition;
@synthesize destinyInventoryBucketDefinition = _destinyInventoryBucketDefinition;
@synthesize destinyGenderDefinition = _destinyGenderDefinition;
@synthesize destinyBondDefinition = _destinyBondDefinition;
@synthesize destinyRecordDefinition = _destinyRecordDefinition;
@synthesize destinyRewardSourceDefinition = _destinyRewardSourceDefinition;
@synthesize destinyBreakerTypeDefinition = _destinyBreakerTypeDefinition;
@synthesize destinyCollectibleDefinition = _destinyCollectibleDefinition;
@synthesize destinyCharacterCustomizationCategoryDefinition = _destinyCharacterCustomizationCategoryDefinition;
@synthesize destinySandboxPatternDefinition = _destinySandboxPatternDefinition;
@synthesize destinyProgressionLevelRequirementDefinition = _destinyProgressionLevelRequirementDefinition;
@synthesize destinyRewardMappingDefinition = _destinyRewardMappingDefinition;
@synthesize destinyReportReasonCategoryDefinition = _destinyReportReasonCategoryDefinition;
@synthesize destinyPlugSetDefinition = _destinyPlugSetDefinition;
@synthesize destinyNodeStepSummaryDefinition = _destinyNodeStepSummaryDefinition;
@synthesize destinyUnlockCountMappingDefinition = _destinyUnlockCountMappingDefinition;
@synthesize destinySocketTypeDefinition = _destinySocketTypeDefinition;
@synthesize destinyMilestoneDefinition = _destinyMilestoneDefinition;
@synthesize destinyPresentationNodeDefinition = _destinyPresentationNodeDefinition;
@synthesize destinyPowerCapDefinition = _destinyPowerCapDefinition;
@synthesize destinyDestinationDefinition = _destinyDestinationDefinition;
@synthesize destinyInventoryItemLiteDefinition = _destinyInventoryItemLiteDefinition;
@synthesize destinyMetricDefinition = _destinyMetricDefinition;
@synthesize destinyRewardSheetDefinition = _destinyRewardSheetDefinition;
@synthesize destinyStatDefinition = _destinyStatDefinition;
@synthesize destinySackRewardItemListDefinition = _destinySackRewardItemListDefinition;
@synthesize destinyUnlockEventDefinition = _destinyUnlockEventDefinition;
@synthesize destinyMaterialRequirementSetDefinition = _destinyMaterialRequirementSetDefinition;
@synthesize destinyRaceDefinition = _destinyRaceDefinition;
@synthesize destinyClassDefinition = _destinyClassDefinition;
@synthesize destinyTalentGridDefinition = _destinyTalentGridDefinition;
@synthesize destinyUnlockDefinition = _destinyUnlockDefinition;
@synthesize destinyActivityTypeDefinition = _destinyActivityTypeDefinition;
@synthesize destinyEntitlementOfferDefinition = _destinyEntitlementOfferDefinition;
@synthesize destinyObjectiveDefinition = _destinyObjectiveDefinition;
@synthesize destinySocketCategoryDefinition = _destinySocketCategoryDefinition;
@synthesize destinyItemCategoryDefinition = _destinyItemCategoryDefinition;
@synthesize destinyArtifactDefinition = _destinyArtifactDefinition;
@synthesize destinyLocationDefinition = _destinyLocationDefinition;
@synthesize destinyChecklistDefinition = _destinyChecklistDefinition;
@synthesize destinySandboxPerkDefinition = _destinySandboxPerkDefinition;
@synthesize destinyPresentationNodeBaseDefinition = _destinyPresentationNodeBaseDefinition;
@synthesize destinyEnergyTypeDefinition = _destinyEnergyTypeDefinition;
@synthesize destinyActivityModeDefinition = _destinyActivityModeDefinition;
@synthesize destinyTraitCategoryDefinition = _destinyTraitCategoryDefinition;
@synthesize destinyArtDyeChannelDefinition = _destinyArtDyeChannelDefinition;
@synthesize destinyRewardItemListDefinition = _destinyRewardItemListDefinition;


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
            self.destinyCharacterCustomizationOptionDefinition = [self objectOrNilForKey:kZhChtDestinyCharacterCustomizationOptionDefinition fromDictionary:dict];
            self.destinyProgressionDefinition = [self objectOrNilForKey:kZhChtDestinyProgressionDefinition fromDictionary:dict];
            self.destinyItemTierTypeDefinition = [self objectOrNilForKey:kZhChtDestinyItemTierTypeDefinition fromDictionary:dict];
            self.destinyActivityInteractableDefinition = [self objectOrNilForKey:kZhChtDestinyActivityInteractableDefinition fromDictionary:dict];
            self.destinyUnlockExpressionMappingDefinition = [self objectOrNilForKey:kZhChtDestinyUnlockExpressionMappingDefinition fromDictionary:dict];
            self.destinyEquipmentSlotDefinition = [self objectOrNilForKey:kZhChtDestinyEquipmentSlotDefinition fromDictionary:dict];
            self.destinyStatGroupDefinition = [self objectOrNilForKey:kZhChtDestinyStatGroupDefinition fromDictionary:dict];
            self.destinySeasonDefinition = [self objectOrNilForKey:kZhChtDestinySeasonDefinition fromDictionary:dict];
            self.destinyFactionDefinition = [self objectOrNilForKey:kZhChtDestinyFactionDefinition fromDictionary:dict];
            self.destinyUnlockValueDefinition = [self objectOrNilForKey:kZhChtDestinyUnlockValueDefinition fromDictionary:dict];
            self.destinyActivityDefinition = [self objectOrNilForKey:kZhChtDestinyActivityDefinition fromDictionary:dict];
            self.destinyEnemyRaceDefinition = [self objectOrNilForKey:kZhChtDestinyEnemyRaceDefinition fromDictionary:dict];
            self.destinySeasonPassDefinition = [self objectOrNilForKey:kZhChtDestinySeasonPassDefinition fromDictionary:dict];
            self.destinyVendorDefinition = [self objectOrNilForKey:kZhChtDestinyVendorDefinition fromDictionary:dict];
            self.destinyActivityGraphDefinition = [self objectOrNilForKey:kZhChtDestinyActivityGraphDefinition fromDictionary:dict];
            self.destinyProgressionMappingDefinition = [self objectOrNilForKey:kZhChtDestinyProgressionMappingDefinition fromDictionary:dict];
            self.destinyPlatformBucketMappingDefinition = [self objectOrNilForKey:kZhChtDestinyPlatformBucketMappingDefinition fromDictionary:dict];
            self.destinyAchievementDefinition = [self objectOrNilForKey:kZhChtDestinyAchievementDefinition fromDictionary:dict];
            self.destinyRewardAdjusterPointerDefinition = [self objectOrNilForKey:kZhChtDestinyRewardAdjusterPointerDefinition fromDictionary:dict];
            self.destinyRewardAdjusterProgressionMapDefinition = [self objectOrNilForKey:kZhChtDestinyRewardAdjusterProgressionMapDefinition fromDictionary:dict];
            self.destinyInventoryItemDefinition = [self objectOrNilForKey:kZhChtDestinyInventoryItemDefinition fromDictionary:dict];
            self.destinyPlaceDefinition = [self objectOrNilForKey:kZhChtDestinyPlaceDefinition fromDictionary:dict];
            self.destinyVendorGroupDefinition = [self objectOrNilForKey:kZhChtDestinyVendorGroupDefinition fromDictionary:dict];
            self.destinyTraitDefinition = [self objectOrNilForKey:kZhChtDestinyTraitDefinition fromDictionary:dict];
            self.destinyLoreDefinition = [self objectOrNilForKey:kZhChtDestinyLoreDefinition fromDictionary:dict];
            self.destinyDamageTypeDefinition = [self objectOrNilForKey:kZhChtDestinyDamageTypeDefinition fromDictionary:dict];
            self.destinyArtDyeReferenceDefinition = [self objectOrNilForKey:kZhChtDestinyArtDyeReferenceDefinition fromDictionary:dict];
            self.destinyMedalTierDefinition = [self objectOrNilForKey:kZhChtDestinyMedalTierDefinition fromDictionary:dict];
            self.destinyActivityModifierDefinition = [self objectOrNilForKey:kZhChtDestinyActivityModifierDefinition fromDictionary:dict];
            self.destinyInventoryBucketDefinition = [self objectOrNilForKey:kZhChtDestinyInventoryBucketDefinition fromDictionary:dict];
            self.destinyGenderDefinition = [self objectOrNilForKey:kZhChtDestinyGenderDefinition fromDictionary:dict];
            self.destinyBondDefinition = [self objectOrNilForKey:kZhChtDestinyBondDefinition fromDictionary:dict];
            self.destinyRecordDefinition = [self objectOrNilForKey:kZhChtDestinyRecordDefinition fromDictionary:dict];
            self.destinyRewardSourceDefinition = [self objectOrNilForKey:kZhChtDestinyRewardSourceDefinition fromDictionary:dict];
            self.destinyBreakerTypeDefinition = [self objectOrNilForKey:kZhChtDestinyBreakerTypeDefinition fromDictionary:dict];
            self.destinyCollectibleDefinition = [self objectOrNilForKey:kZhChtDestinyCollectibleDefinition fromDictionary:dict];
            self.destinyCharacterCustomizationCategoryDefinition = [self objectOrNilForKey:kZhChtDestinyCharacterCustomizationCategoryDefinition fromDictionary:dict];
            self.destinySandboxPatternDefinition = [self objectOrNilForKey:kZhChtDestinySandboxPatternDefinition fromDictionary:dict];
            self.destinyProgressionLevelRequirementDefinition = [self objectOrNilForKey:kZhChtDestinyProgressionLevelRequirementDefinition fromDictionary:dict];
            self.destinyRewardMappingDefinition = [self objectOrNilForKey:kZhChtDestinyRewardMappingDefinition fromDictionary:dict];
            self.destinyReportReasonCategoryDefinition = [self objectOrNilForKey:kZhChtDestinyReportReasonCategoryDefinition fromDictionary:dict];
            self.destinyPlugSetDefinition = [self objectOrNilForKey:kZhChtDestinyPlugSetDefinition fromDictionary:dict];
            self.destinyNodeStepSummaryDefinition = [self objectOrNilForKey:kZhChtDestinyNodeStepSummaryDefinition fromDictionary:dict];
            self.destinyUnlockCountMappingDefinition = [self objectOrNilForKey:kZhChtDestinyUnlockCountMappingDefinition fromDictionary:dict];
            self.destinySocketTypeDefinition = [self objectOrNilForKey:kZhChtDestinySocketTypeDefinition fromDictionary:dict];
            self.destinyMilestoneDefinition = [self objectOrNilForKey:kZhChtDestinyMilestoneDefinition fromDictionary:dict];
            self.destinyPresentationNodeDefinition = [self objectOrNilForKey:kZhChtDestinyPresentationNodeDefinition fromDictionary:dict];
            self.destinyPowerCapDefinition = [self objectOrNilForKey:kZhChtDestinyPowerCapDefinition fromDictionary:dict];
            self.destinyDestinationDefinition = [self objectOrNilForKey:kZhChtDestinyDestinationDefinition fromDictionary:dict];
            self.destinyInventoryItemLiteDefinition = [self objectOrNilForKey:kZhChtDestinyInventoryItemLiteDefinition fromDictionary:dict];
            self.destinyMetricDefinition = [self objectOrNilForKey:kZhChtDestinyMetricDefinition fromDictionary:dict];
            self.destinyRewardSheetDefinition = [self objectOrNilForKey:kZhChtDestinyRewardSheetDefinition fromDictionary:dict];
            self.destinyStatDefinition = [self objectOrNilForKey:kZhChtDestinyStatDefinition fromDictionary:dict];
            self.destinySackRewardItemListDefinition = [self objectOrNilForKey:kZhChtDestinySackRewardItemListDefinition fromDictionary:dict];
            self.destinyUnlockEventDefinition = [self objectOrNilForKey:kZhChtDestinyUnlockEventDefinition fromDictionary:dict];
            self.destinyMaterialRequirementSetDefinition = [self objectOrNilForKey:kZhChtDestinyMaterialRequirementSetDefinition fromDictionary:dict];
            self.destinyRaceDefinition = [self objectOrNilForKey:kZhChtDestinyRaceDefinition fromDictionary:dict];
            self.destinyClassDefinition = [self objectOrNilForKey:kZhChtDestinyClassDefinition fromDictionary:dict];
            self.destinyTalentGridDefinition = [self objectOrNilForKey:kZhChtDestinyTalentGridDefinition fromDictionary:dict];
            self.destinyUnlockDefinition = [self objectOrNilForKey:kZhChtDestinyUnlockDefinition fromDictionary:dict];
            self.destinyActivityTypeDefinition = [self objectOrNilForKey:kZhChtDestinyActivityTypeDefinition fromDictionary:dict];
            self.destinyEntitlementOfferDefinition = [self objectOrNilForKey:kZhChtDestinyEntitlementOfferDefinition fromDictionary:dict];
            self.destinyObjectiveDefinition = [self objectOrNilForKey:kZhChtDestinyObjectiveDefinition fromDictionary:dict];
            self.destinySocketCategoryDefinition = [self objectOrNilForKey:kZhChtDestinySocketCategoryDefinition fromDictionary:dict];
            self.destinyItemCategoryDefinition = [self objectOrNilForKey:kZhChtDestinyItemCategoryDefinition fromDictionary:dict];
            self.destinyArtifactDefinition = [self objectOrNilForKey:kZhChtDestinyArtifactDefinition fromDictionary:dict];
            self.destinyLocationDefinition = [self objectOrNilForKey:kZhChtDestinyLocationDefinition fromDictionary:dict];
            self.destinyChecklistDefinition = [self objectOrNilForKey:kZhChtDestinyChecklistDefinition fromDictionary:dict];
            self.destinySandboxPerkDefinition = [self objectOrNilForKey:kZhChtDestinySandboxPerkDefinition fromDictionary:dict];
            self.destinyPresentationNodeBaseDefinition = [self objectOrNilForKey:kZhChtDestinyPresentationNodeBaseDefinition fromDictionary:dict];
            self.destinyEnergyTypeDefinition = [self objectOrNilForKey:kZhChtDestinyEnergyTypeDefinition fromDictionary:dict];
            self.destinyActivityModeDefinition = [self objectOrNilForKey:kZhChtDestinyActivityModeDefinition fromDictionary:dict];
            self.destinyTraitCategoryDefinition = [self objectOrNilForKey:kZhChtDestinyTraitCategoryDefinition fromDictionary:dict];
            self.destinyArtDyeChannelDefinition = [self objectOrNilForKey:kZhChtDestinyArtDyeChannelDefinition fromDictionary:dict];
            self.destinyRewardItemListDefinition = [self objectOrNilForKey:kZhChtDestinyRewardItemListDefinition fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.destinyCharacterCustomizationOptionDefinition forKey:kZhChtDestinyCharacterCustomizationOptionDefinition];
    [mutableDict setValue:self.destinyProgressionDefinition forKey:kZhChtDestinyProgressionDefinition];
    [mutableDict setValue:self.destinyItemTierTypeDefinition forKey:kZhChtDestinyItemTierTypeDefinition];
    [mutableDict setValue:self.destinyActivityInteractableDefinition forKey:kZhChtDestinyActivityInteractableDefinition];
    [mutableDict setValue:self.destinyUnlockExpressionMappingDefinition forKey:kZhChtDestinyUnlockExpressionMappingDefinition];
    [mutableDict setValue:self.destinyEquipmentSlotDefinition forKey:kZhChtDestinyEquipmentSlotDefinition];
    [mutableDict setValue:self.destinyStatGroupDefinition forKey:kZhChtDestinyStatGroupDefinition];
    [mutableDict setValue:self.destinySeasonDefinition forKey:kZhChtDestinySeasonDefinition];
    [mutableDict setValue:self.destinyFactionDefinition forKey:kZhChtDestinyFactionDefinition];
    [mutableDict setValue:self.destinyUnlockValueDefinition forKey:kZhChtDestinyUnlockValueDefinition];
    [mutableDict setValue:self.destinyActivityDefinition forKey:kZhChtDestinyActivityDefinition];
    [mutableDict setValue:self.destinyEnemyRaceDefinition forKey:kZhChtDestinyEnemyRaceDefinition];
    [mutableDict setValue:self.destinySeasonPassDefinition forKey:kZhChtDestinySeasonPassDefinition];
    [mutableDict setValue:self.destinyVendorDefinition forKey:kZhChtDestinyVendorDefinition];
    [mutableDict setValue:self.destinyActivityGraphDefinition forKey:kZhChtDestinyActivityGraphDefinition];
    [mutableDict setValue:self.destinyProgressionMappingDefinition forKey:kZhChtDestinyProgressionMappingDefinition];
    [mutableDict setValue:self.destinyPlatformBucketMappingDefinition forKey:kZhChtDestinyPlatformBucketMappingDefinition];
    [mutableDict setValue:self.destinyAchievementDefinition forKey:kZhChtDestinyAchievementDefinition];
    [mutableDict setValue:self.destinyRewardAdjusterPointerDefinition forKey:kZhChtDestinyRewardAdjusterPointerDefinition];
    [mutableDict setValue:self.destinyRewardAdjusterProgressionMapDefinition forKey:kZhChtDestinyRewardAdjusterProgressionMapDefinition];
    [mutableDict setValue:self.destinyInventoryItemDefinition forKey:kZhChtDestinyInventoryItemDefinition];
    [mutableDict setValue:self.destinyPlaceDefinition forKey:kZhChtDestinyPlaceDefinition];
    [mutableDict setValue:self.destinyVendorGroupDefinition forKey:kZhChtDestinyVendorGroupDefinition];
    [mutableDict setValue:self.destinyTraitDefinition forKey:kZhChtDestinyTraitDefinition];
    [mutableDict setValue:self.destinyLoreDefinition forKey:kZhChtDestinyLoreDefinition];
    [mutableDict setValue:self.destinyDamageTypeDefinition forKey:kZhChtDestinyDamageTypeDefinition];
    [mutableDict setValue:self.destinyArtDyeReferenceDefinition forKey:kZhChtDestinyArtDyeReferenceDefinition];
    [mutableDict setValue:self.destinyMedalTierDefinition forKey:kZhChtDestinyMedalTierDefinition];
    [mutableDict setValue:self.destinyActivityModifierDefinition forKey:kZhChtDestinyActivityModifierDefinition];
    [mutableDict setValue:self.destinyInventoryBucketDefinition forKey:kZhChtDestinyInventoryBucketDefinition];
    [mutableDict setValue:self.destinyGenderDefinition forKey:kZhChtDestinyGenderDefinition];
    [mutableDict setValue:self.destinyBondDefinition forKey:kZhChtDestinyBondDefinition];
    [mutableDict setValue:self.destinyRecordDefinition forKey:kZhChtDestinyRecordDefinition];
    [mutableDict setValue:self.destinyRewardSourceDefinition forKey:kZhChtDestinyRewardSourceDefinition];
    [mutableDict setValue:self.destinyBreakerTypeDefinition forKey:kZhChtDestinyBreakerTypeDefinition];
    [mutableDict setValue:self.destinyCollectibleDefinition forKey:kZhChtDestinyCollectibleDefinition];
    [mutableDict setValue:self.destinyCharacterCustomizationCategoryDefinition forKey:kZhChtDestinyCharacterCustomizationCategoryDefinition];
    [mutableDict setValue:self.destinySandboxPatternDefinition forKey:kZhChtDestinySandboxPatternDefinition];
    [mutableDict setValue:self.destinyProgressionLevelRequirementDefinition forKey:kZhChtDestinyProgressionLevelRequirementDefinition];
    [mutableDict setValue:self.destinyRewardMappingDefinition forKey:kZhChtDestinyRewardMappingDefinition];
    [mutableDict setValue:self.destinyReportReasonCategoryDefinition forKey:kZhChtDestinyReportReasonCategoryDefinition];
    [mutableDict setValue:self.destinyPlugSetDefinition forKey:kZhChtDestinyPlugSetDefinition];
    [mutableDict setValue:self.destinyNodeStepSummaryDefinition forKey:kZhChtDestinyNodeStepSummaryDefinition];
    [mutableDict setValue:self.destinyUnlockCountMappingDefinition forKey:kZhChtDestinyUnlockCountMappingDefinition];
    [mutableDict setValue:self.destinySocketTypeDefinition forKey:kZhChtDestinySocketTypeDefinition];
    [mutableDict setValue:self.destinyMilestoneDefinition forKey:kZhChtDestinyMilestoneDefinition];
    [mutableDict setValue:self.destinyPresentationNodeDefinition forKey:kZhChtDestinyPresentationNodeDefinition];
    [mutableDict setValue:self.destinyPowerCapDefinition forKey:kZhChtDestinyPowerCapDefinition];
    [mutableDict setValue:self.destinyDestinationDefinition forKey:kZhChtDestinyDestinationDefinition];
    [mutableDict setValue:self.destinyInventoryItemLiteDefinition forKey:kZhChtDestinyInventoryItemLiteDefinition];
    [mutableDict setValue:self.destinyMetricDefinition forKey:kZhChtDestinyMetricDefinition];
    [mutableDict setValue:self.destinyRewardSheetDefinition forKey:kZhChtDestinyRewardSheetDefinition];
    [mutableDict setValue:self.destinyStatDefinition forKey:kZhChtDestinyStatDefinition];
    [mutableDict setValue:self.destinySackRewardItemListDefinition forKey:kZhChtDestinySackRewardItemListDefinition];
    [mutableDict setValue:self.destinyUnlockEventDefinition forKey:kZhChtDestinyUnlockEventDefinition];
    [mutableDict setValue:self.destinyMaterialRequirementSetDefinition forKey:kZhChtDestinyMaterialRequirementSetDefinition];
    [mutableDict setValue:self.destinyRaceDefinition forKey:kZhChtDestinyRaceDefinition];
    [mutableDict setValue:self.destinyClassDefinition forKey:kZhChtDestinyClassDefinition];
    [mutableDict setValue:self.destinyTalentGridDefinition forKey:kZhChtDestinyTalentGridDefinition];
    [mutableDict setValue:self.destinyUnlockDefinition forKey:kZhChtDestinyUnlockDefinition];
    [mutableDict setValue:self.destinyActivityTypeDefinition forKey:kZhChtDestinyActivityTypeDefinition];
    [mutableDict setValue:self.destinyEntitlementOfferDefinition forKey:kZhChtDestinyEntitlementOfferDefinition];
    [mutableDict setValue:self.destinyObjectiveDefinition forKey:kZhChtDestinyObjectiveDefinition];
    [mutableDict setValue:self.destinySocketCategoryDefinition forKey:kZhChtDestinySocketCategoryDefinition];
    [mutableDict setValue:self.destinyItemCategoryDefinition forKey:kZhChtDestinyItemCategoryDefinition];
    [mutableDict setValue:self.destinyArtifactDefinition forKey:kZhChtDestinyArtifactDefinition];
    [mutableDict setValue:self.destinyLocationDefinition forKey:kZhChtDestinyLocationDefinition];
    [mutableDict setValue:self.destinyChecklistDefinition forKey:kZhChtDestinyChecklistDefinition];
    [mutableDict setValue:self.destinySandboxPerkDefinition forKey:kZhChtDestinySandboxPerkDefinition];
    [mutableDict setValue:self.destinyPresentationNodeBaseDefinition forKey:kZhChtDestinyPresentationNodeBaseDefinition];
    [mutableDict setValue:self.destinyEnergyTypeDefinition forKey:kZhChtDestinyEnergyTypeDefinition];
    [mutableDict setValue:self.destinyActivityModeDefinition forKey:kZhChtDestinyActivityModeDefinition];
    [mutableDict setValue:self.destinyTraitCategoryDefinition forKey:kZhChtDestinyTraitCategoryDefinition];
    [mutableDict setValue:self.destinyArtDyeChannelDefinition forKey:kZhChtDestinyArtDyeChannelDefinition];
    [mutableDict setValue:self.destinyRewardItemListDefinition forKey:kZhChtDestinyRewardItemListDefinition];

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

    self.destinyCharacterCustomizationOptionDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyCharacterCustomizationOptionDefinition];
    self.destinyProgressionDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyProgressionDefinition];
    self.destinyItemTierTypeDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyItemTierTypeDefinition];
    self.destinyActivityInteractableDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyActivityInteractableDefinition];
    self.destinyUnlockExpressionMappingDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyUnlockExpressionMappingDefinition];
    self.destinyEquipmentSlotDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyEquipmentSlotDefinition];
    self.destinyStatGroupDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyStatGroupDefinition];
    self.destinySeasonDefinition = [aDecoder decodeObjectForKey:kZhChtDestinySeasonDefinition];
    self.destinyFactionDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyFactionDefinition];
    self.destinyUnlockValueDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyUnlockValueDefinition];
    self.destinyActivityDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyActivityDefinition];
    self.destinyEnemyRaceDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyEnemyRaceDefinition];
    self.destinySeasonPassDefinition = [aDecoder decodeObjectForKey:kZhChtDestinySeasonPassDefinition];
    self.destinyVendorDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyVendorDefinition];
    self.destinyActivityGraphDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyActivityGraphDefinition];
    self.destinyProgressionMappingDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyProgressionMappingDefinition];
    self.destinyPlatformBucketMappingDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyPlatformBucketMappingDefinition];
    self.destinyAchievementDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyAchievementDefinition];
    self.destinyRewardAdjusterPointerDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyRewardAdjusterPointerDefinition];
    self.destinyRewardAdjusterProgressionMapDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyRewardAdjusterProgressionMapDefinition];
    self.destinyInventoryItemDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyInventoryItemDefinition];
    self.destinyPlaceDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyPlaceDefinition];
    self.destinyVendorGroupDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyVendorGroupDefinition];
    self.destinyTraitDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyTraitDefinition];
    self.destinyLoreDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyLoreDefinition];
    self.destinyDamageTypeDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyDamageTypeDefinition];
    self.destinyArtDyeReferenceDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyArtDyeReferenceDefinition];
    self.destinyMedalTierDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyMedalTierDefinition];
    self.destinyActivityModifierDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyActivityModifierDefinition];
    self.destinyInventoryBucketDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyInventoryBucketDefinition];
    self.destinyGenderDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyGenderDefinition];
    self.destinyBondDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyBondDefinition];
    self.destinyRecordDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyRecordDefinition];
    self.destinyRewardSourceDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyRewardSourceDefinition];
    self.destinyBreakerTypeDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyBreakerTypeDefinition];
    self.destinyCollectibleDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyCollectibleDefinition];
    self.destinyCharacterCustomizationCategoryDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyCharacterCustomizationCategoryDefinition];
    self.destinySandboxPatternDefinition = [aDecoder decodeObjectForKey:kZhChtDestinySandboxPatternDefinition];
    self.destinyProgressionLevelRequirementDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyProgressionLevelRequirementDefinition];
    self.destinyRewardMappingDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyRewardMappingDefinition];
    self.destinyReportReasonCategoryDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyReportReasonCategoryDefinition];
    self.destinyPlugSetDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyPlugSetDefinition];
    self.destinyNodeStepSummaryDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyNodeStepSummaryDefinition];
    self.destinyUnlockCountMappingDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyUnlockCountMappingDefinition];
    self.destinySocketTypeDefinition = [aDecoder decodeObjectForKey:kZhChtDestinySocketTypeDefinition];
    self.destinyMilestoneDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyMilestoneDefinition];
    self.destinyPresentationNodeDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyPresentationNodeDefinition];
    self.destinyPowerCapDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyPowerCapDefinition];
    self.destinyDestinationDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyDestinationDefinition];
    self.destinyInventoryItemLiteDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyInventoryItemLiteDefinition];
    self.destinyMetricDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyMetricDefinition];
    self.destinyRewardSheetDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyRewardSheetDefinition];
    self.destinyStatDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyStatDefinition];
    self.destinySackRewardItemListDefinition = [aDecoder decodeObjectForKey:kZhChtDestinySackRewardItemListDefinition];
    self.destinyUnlockEventDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyUnlockEventDefinition];
    self.destinyMaterialRequirementSetDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyMaterialRequirementSetDefinition];
    self.destinyRaceDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyRaceDefinition];
    self.destinyClassDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyClassDefinition];
    self.destinyTalentGridDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyTalentGridDefinition];
    self.destinyUnlockDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyUnlockDefinition];
    self.destinyActivityTypeDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyActivityTypeDefinition];
    self.destinyEntitlementOfferDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyEntitlementOfferDefinition];
    self.destinyObjectiveDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyObjectiveDefinition];
    self.destinySocketCategoryDefinition = [aDecoder decodeObjectForKey:kZhChtDestinySocketCategoryDefinition];
    self.destinyItemCategoryDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyItemCategoryDefinition];
    self.destinyArtifactDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyArtifactDefinition];
    self.destinyLocationDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyLocationDefinition];
    self.destinyChecklistDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyChecklistDefinition];
    self.destinySandboxPerkDefinition = [aDecoder decodeObjectForKey:kZhChtDestinySandboxPerkDefinition];
    self.destinyPresentationNodeBaseDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyPresentationNodeBaseDefinition];
    self.destinyEnergyTypeDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyEnergyTypeDefinition];
    self.destinyActivityModeDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyActivityModeDefinition];
    self.destinyTraitCategoryDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyTraitCategoryDefinition];
    self.destinyArtDyeChannelDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyArtDyeChannelDefinition];
    self.destinyRewardItemListDefinition = [aDecoder decodeObjectForKey:kZhChtDestinyRewardItemListDefinition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_destinyCharacterCustomizationOptionDefinition forKey:kZhChtDestinyCharacterCustomizationOptionDefinition];
    [aCoder encodeObject:_destinyProgressionDefinition forKey:kZhChtDestinyProgressionDefinition];
    [aCoder encodeObject:_destinyItemTierTypeDefinition forKey:kZhChtDestinyItemTierTypeDefinition];
    [aCoder encodeObject:_destinyActivityInteractableDefinition forKey:kZhChtDestinyActivityInteractableDefinition];
    [aCoder encodeObject:_destinyUnlockExpressionMappingDefinition forKey:kZhChtDestinyUnlockExpressionMappingDefinition];
    [aCoder encodeObject:_destinyEquipmentSlotDefinition forKey:kZhChtDestinyEquipmentSlotDefinition];
    [aCoder encodeObject:_destinyStatGroupDefinition forKey:kZhChtDestinyStatGroupDefinition];
    [aCoder encodeObject:_destinySeasonDefinition forKey:kZhChtDestinySeasonDefinition];
    [aCoder encodeObject:_destinyFactionDefinition forKey:kZhChtDestinyFactionDefinition];
    [aCoder encodeObject:_destinyUnlockValueDefinition forKey:kZhChtDestinyUnlockValueDefinition];
    [aCoder encodeObject:_destinyActivityDefinition forKey:kZhChtDestinyActivityDefinition];
    [aCoder encodeObject:_destinyEnemyRaceDefinition forKey:kZhChtDestinyEnemyRaceDefinition];
    [aCoder encodeObject:_destinySeasonPassDefinition forKey:kZhChtDestinySeasonPassDefinition];
    [aCoder encodeObject:_destinyVendorDefinition forKey:kZhChtDestinyVendorDefinition];
    [aCoder encodeObject:_destinyActivityGraphDefinition forKey:kZhChtDestinyActivityGraphDefinition];
    [aCoder encodeObject:_destinyProgressionMappingDefinition forKey:kZhChtDestinyProgressionMappingDefinition];
    [aCoder encodeObject:_destinyPlatformBucketMappingDefinition forKey:kZhChtDestinyPlatformBucketMappingDefinition];
    [aCoder encodeObject:_destinyAchievementDefinition forKey:kZhChtDestinyAchievementDefinition];
    [aCoder encodeObject:_destinyRewardAdjusterPointerDefinition forKey:kZhChtDestinyRewardAdjusterPointerDefinition];
    [aCoder encodeObject:_destinyRewardAdjusterProgressionMapDefinition forKey:kZhChtDestinyRewardAdjusterProgressionMapDefinition];
    [aCoder encodeObject:_destinyInventoryItemDefinition forKey:kZhChtDestinyInventoryItemDefinition];
    [aCoder encodeObject:_destinyPlaceDefinition forKey:kZhChtDestinyPlaceDefinition];
    [aCoder encodeObject:_destinyVendorGroupDefinition forKey:kZhChtDestinyVendorGroupDefinition];
    [aCoder encodeObject:_destinyTraitDefinition forKey:kZhChtDestinyTraitDefinition];
    [aCoder encodeObject:_destinyLoreDefinition forKey:kZhChtDestinyLoreDefinition];
    [aCoder encodeObject:_destinyDamageTypeDefinition forKey:kZhChtDestinyDamageTypeDefinition];
    [aCoder encodeObject:_destinyArtDyeReferenceDefinition forKey:kZhChtDestinyArtDyeReferenceDefinition];
    [aCoder encodeObject:_destinyMedalTierDefinition forKey:kZhChtDestinyMedalTierDefinition];
    [aCoder encodeObject:_destinyActivityModifierDefinition forKey:kZhChtDestinyActivityModifierDefinition];
    [aCoder encodeObject:_destinyInventoryBucketDefinition forKey:kZhChtDestinyInventoryBucketDefinition];
    [aCoder encodeObject:_destinyGenderDefinition forKey:kZhChtDestinyGenderDefinition];
    [aCoder encodeObject:_destinyBondDefinition forKey:kZhChtDestinyBondDefinition];
    [aCoder encodeObject:_destinyRecordDefinition forKey:kZhChtDestinyRecordDefinition];
    [aCoder encodeObject:_destinyRewardSourceDefinition forKey:kZhChtDestinyRewardSourceDefinition];
    [aCoder encodeObject:_destinyBreakerTypeDefinition forKey:kZhChtDestinyBreakerTypeDefinition];
    [aCoder encodeObject:_destinyCollectibleDefinition forKey:kZhChtDestinyCollectibleDefinition];
    [aCoder encodeObject:_destinyCharacterCustomizationCategoryDefinition forKey:kZhChtDestinyCharacterCustomizationCategoryDefinition];
    [aCoder encodeObject:_destinySandboxPatternDefinition forKey:kZhChtDestinySandboxPatternDefinition];
    [aCoder encodeObject:_destinyProgressionLevelRequirementDefinition forKey:kZhChtDestinyProgressionLevelRequirementDefinition];
    [aCoder encodeObject:_destinyRewardMappingDefinition forKey:kZhChtDestinyRewardMappingDefinition];
    [aCoder encodeObject:_destinyReportReasonCategoryDefinition forKey:kZhChtDestinyReportReasonCategoryDefinition];
    [aCoder encodeObject:_destinyPlugSetDefinition forKey:kZhChtDestinyPlugSetDefinition];
    [aCoder encodeObject:_destinyNodeStepSummaryDefinition forKey:kZhChtDestinyNodeStepSummaryDefinition];
    [aCoder encodeObject:_destinyUnlockCountMappingDefinition forKey:kZhChtDestinyUnlockCountMappingDefinition];
    [aCoder encodeObject:_destinySocketTypeDefinition forKey:kZhChtDestinySocketTypeDefinition];
    [aCoder encodeObject:_destinyMilestoneDefinition forKey:kZhChtDestinyMilestoneDefinition];
    [aCoder encodeObject:_destinyPresentationNodeDefinition forKey:kZhChtDestinyPresentationNodeDefinition];
    [aCoder encodeObject:_destinyPowerCapDefinition forKey:kZhChtDestinyPowerCapDefinition];
    [aCoder encodeObject:_destinyDestinationDefinition forKey:kZhChtDestinyDestinationDefinition];
    [aCoder encodeObject:_destinyInventoryItemLiteDefinition forKey:kZhChtDestinyInventoryItemLiteDefinition];
    [aCoder encodeObject:_destinyMetricDefinition forKey:kZhChtDestinyMetricDefinition];
    [aCoder encodeObject:_destinyRewardSheetDefinition forKey:kZhChtDestinyRewardSheetDefinition];
    [aCoder encodeObject:_destinyStatDefinition forKey:kZhChtDestinyStatDefinition];
    [aCoder encodeObject:_destinySackRewardItemListDefinition forKey:kZhChtDestinySackRewardItemListDefinition];
    [aCoder encodeObject:_destinyUnlockEventDefinition forKey:kZhChtDestinyUnlockEventDefinition];
    [aCoder encodeObject:_destinyMaterialRequirementSetDefinition forKey:kZhChtDestinyMaterialRequirementSetDefinition];
    [aCoder encodeObject:_destinyRaceDefinition forKey:kZhChtDestinyRaceDefinition];
    [aCoder encodeObject:_destinyClassDefinition forKey:kZhChtDestinyClassDefinition];
    [aCoder encodeObject:_destinyTalentGridDefinition forKey:kZhChtDestinyTalentGridDefinition];
    [aCoder encodeObject:_destinyUnlockDefinition forKey:kZhChtDestinyUnlockDefinition];
    [aCoder encodeObject:_destinyActivityTypeDefinition forKey:kZhChtDestinyActivityTypeDefinition];
    [aCoder encodeObject:_destinyEntitlementOfferDefinition forKey:kZhChtDestinyEntitlementOfferDefinition];
    [aCoder encodeObject:_destinyObjectiveDefinition forKey:kZhChtDestinyObjectiveDefinition];
    [aCoder encodeObject:_destinySocketCategoryDefinition forKey:kZhChtDestinySocketCategoryDefinition];
    [aCoder encodeObject:_destinyItemCategoryDefinition forKey:kZhChtDestinyItemCategoryDefinition];
    [aCoder encodeObject:_destinyArtifactDefinition forKey:kZhChtDestinyArtifactDefinition];
    [aCoder encodeObject:_destinyLocationDefinition forKey:kZhChtDestinyLocationDefinition];
    [aCoder encodeObject:_destinyChecklistDefinition forKey:kZhChtDestinyChecklistDefinition];
    [aCoder encodeObject:_destinySandboxPerkDefinition forKey:kZhChtDestinySandboxPerkDefinition];
    [aCoder encodeObject:_destinyPresentationNodeBaseDefinition forKey:kZhChtDestinyPresentationNodeBaseDefinition];
    [aCoder encodeObject:_destinyEnergyTypeDefinition forKey:kZhChtDestinyEnergyTypeDefinition];
    [aCoder encodeObject:_destinyActivityModeDefinition forKey:kZhChtDestinyActivityModeDefinition];
    [aCoder encodeObject:_destinyTraitCategoryDefinition forKey:kZhChtDestinyTraitCategoryDefinition];
    [aCoder encodeObject:_destinyArtDyeChannelDefinition forKey:kZhChtDestinyArtDyeChannelDefinition];
    [aCoder encodeObject:_destinyRewardItemListDefinition forKey:kZhChtDestinyRewardItemListDefinition];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZhCht *copy = [[ZhCht alloc] init];
    
    if (copy) {

        copy.destinyCharacterCustomizationOptionDefinition = [self.destinyCharacterCustomizationOptionDefinition copyWithZone:zone];
        copy.destinyProgressionDefinition = [self.destinyProgressionDefinition copyWithZone:zone];
        copy.destinyItemTierTypeDefinition = [self.destinyItemTierTypeDefinition copyWithZone:zone];
        copy.destinyActivityInteractableDefinition = [self.destinyActivityInteractableDefinition copyWithZone:zone];
        copy.destinyUnlockExpressionMappingDefinition = [self.destinyUnlockExpressionMappingDefinition copyWithZone:zone];
        copy.destinyEquipmentSlotDefinition = [self.destinyEquipmentSlotDefinition copyWithZone:zone];
        copy.destinyStatGroupDefinition = [self.destinyStatGroupDefinition copyWithZone:zone];
        copy.destinySeasonDefinition = [self.destinySeasonDefinition copyWithZone:zone];
        copy.destinyFactionDefinition = [self.destinyFactionDefinition copyWithZone:zone];
        copy.destinyUnlockValueDefinition = [self.destinyUnlockValueDefinition copyWithZone:zone];
        copy.destinyActivityDefinition = [self.destinyActivityDefinition copyWithZone:zone];
        copy.destinyEnemyRaceDefinition = [self.destinyEnemyRaceDefinition copyWithZone:zone];
        copy.destinySeasonPassDefinition = [self.destinySeasonPassDefinition copyWithZone:zone];
        copy.destinyVendorDefinition = [self.destinyVendorDefinition copyWithZone:zone];
        copy.destinyActivityGraphDefinition = [self.destinyActivityGraphDefinition copyWithZone:zone];
        copy.destinyProgressionMappingDefinition = [self.destinyProgressionMappingDefinition copyWithZone:zone];
        copy.destinyPlatformBucketMappingDefinition = [self.destinyPlatformBucketMappingDefinition copyWithZone:zone];
        copy.destinyAchievementDefinition = [self.destinyAchievementDefinition copyWithZone:zone];
        copy.destinyRewardAdjusterPointerDefinition = [self.destinyRewardAdjusterPointerDefinition copyWithZone:zone];
        copy.destinyRewardAdjusterProgressionMapDefinition = [self.destinyRewardAdjusterProgressionMapDefinition copyWithZone:zone];
        copy.destinyInventoryItemDefinition = [self.destinyInventoryItemDefinition copyWithZone:zone];
        copy.destinyPlaceDefinition = [self.destinyPlaceDefinition copyWithZone:zone];
        copy.destinyVendorGroupDefinition = [self.destinyVendorGroupDefinition copyWithZone:zone];
        copy.destinyTraitDefinition = [self.destinyTraitDefinition copyWithZone:zone];
        copy.destinyLoreDefinition = [self.destinyLoreDefinition copyWithZone:zone];
        copy.destinyDamageTypeDefinition = [self.destinyDamageTypeDefinition copyWithZone:zone];
        copy.destinyArtDyeReferenceDefinition = [self.destinyArtDyeReferenceDefinition copyWithZone:zone];
        copy.destinyMedalTierDefinition = [self.destinyMedalTierDefinition copyWithZone:zone];
        copy.destinyActivityModifierDefinition = [self.destinyActivityModifierDefinition copyWithZone:zone];
        copy.destinyInventoryBucketDefinition = [self.destinyInventoryBucketDefinition copyWithZone:zone];
        copy.destinyGenderDefinition = [self.destinyGenderDefinition copyWithZone:zone];
        copy.destinyBondDefinition = [self.destinyBondDefinition copyWithZone:zone];
        copy.destinyRecordDefinition = [self.destinyRecordDefinition copyWithZone:zone];
        copy.destinyRewardSourceDefinition = [self.destinyRewardSourceDefinition copyWithZone:zone];
        copy.destinyBreakerTypeDefinition = [self.destinyBreakerTypeDefinition copyWithZone:zone];
        copy.destinyCollectibleDefinition = [self.destinyCollectibleDefinition copyWithZone:zone];
        copy.destinyCharacterCustomizationCategoryDefinition = [self.destinyCharacterCustomizationCategoryDefinition copyWithZone:zone];
        copy.destinySandboxPatternDefinition = [self.destinySandboxPatternDefinition copyWithZone:zone];
        copy.destinyProgressionLevelRequirementDefinition = [self.destinyProgressionLevelRequirementDefinition copyWithZone:zone];
        copy.destinyRewardMappingDefinition = [self.destinyRewardMappingDefinition copyWithZone:zone];
        copy.destinyReportReasonCategoryDefinition = [self.destinyReportReasonCategoryDefinition copyWithZone:zone];
        copy.destinyPlugSetDefinition = [self.destinyPlugSetDefinition copyWithZone:zone];
        copy.destinyNodeStepSummaryDefinition = [self.destinyNodeStepSummaryDefinition copyWithZone:zone];
        copy.destinyUnlockCountMappingDefinition = [self.destinyUnlockCountMappingDefinition copyWithZone:zone];
        copy.destinySocketTypeDefinition = [self.destinySocketTypeDefinition copyWithZone:zone];
        copy.destinyMilestoneDefinition = [self.destinyMilestoneDefinition copyWithZone:zone];
        copy.destinyPresentationNodeDefinition = [self.destinyPresentationNodeDefinition copyWithZone:zone];
        copy.destinyPowerCapDefinition = [self.destinyPowerCapDefinition copyWithZone:zone];
        copy.destinyDestinationDefinition = [self.destinyDestinationDefinition copyWithZone:zone];
        copy.destinyInventoryItemLiteDefinition = [self.destinyInventoryItemLiteDefinition copyWithZone:zone];
        copy.destinyMetricDefinition = [self.destinyMetricDefinition copyWithZone:zone];
        copy.destinyRewardSheetDefinition = [self.destinyRewardSheetDefinition copyWithZone:zone];
        copy.destinyStatDefinition = [self.destinyStatDefinition copyWithZone:zone];
        copy.destinySackRewardItemListDefinition = [self.destinySackRewardItemListDefinition copyWithZone:zone];
        copy.destinyUnlockEventDefinition = [self.destinyUnlockEventDefinition copyWithZone:zone];
        copy.destinyMaterialRequirementSetDefinition = [self.destinyMaterialRequirementSetDefinition copyWithZone:zone];
        copy.destinyRaceDefinition = [self.destinyRaceDefinition copyWithZone:zone];
        copy.destinyClassDefinition = [self.destinyClassDefinition copyWithZone:zone];
        copy.destinyTalentGridDefinition = [self.destinyTalentGridDefinition copyWithZone:zone];
        copy.destinyUnlockDefinition = [self.destinyUnlockDefinition copyWithZone:zone];
        copy.destinyActivityTypeDefinition = [self.destinyActivityTypeDefinition copyWithZone:zone];
        copy.destinyEntitlementOfferDefinition = [self.destinyEntitlementOfferDefinition copyWithZone:zone];
        copy.destinyObjectiveDefinition = [self.destinyObjectiveDefinition copyWithZone:zone];
        copy.destinySocketCategoryDefinition = [self.destinySocketCategoryDefinition copyWithZone:zone];
        copy.destinyItemCategoryDefinition = [self.destinyItemCategoryDefinition copyWithZone:zone];
        copy.destinyArtifactDefinition = [self.destinyArtifactDefinition copyWithZone:zone];
        copy.destinyLocationDefinition = [self.destinyLocationDefinition copyWithZone:zone];
        copy.destinyChecklistDefinition = [self.destinyChecklistDefinition copyWithZone:zone];
        copy.destinySandboxPerkDefinition = [self.destinySandboxPerkDefinition copyWithZone:zone];
        copy.destinyPresentationNodeBaseDefinition = [self.destinyPresentationNodeBaseDefinition copyWithZone:zone];
        copy.destinyEnergyTypeDefinition = [self.destinyEnergyTypeDefinition copyWithZone:zone];
        copy.destinyActivityModeDefinition = [self.destinyActivityModeDefinition copyWithZone:zone];
        copy.destinyTraitCategoryDefinition = [self.destinyTraitCategoryDefinition copyWithZone:zone];
        copy.destinyArtDyeChannelDefinition = [self.destinyArtDyeChannelDefinition copyWithZone:zone];
        copy.destinyRewardItemListDefinition = [self.destinyRewardItemListDefinition copyWithZone:zone];
    }
    
    return copy;
}


@end
