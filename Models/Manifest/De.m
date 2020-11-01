//
//  De.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "De.h"


NSString *const kDeDestinyCharacterCustomizationOptionDefinition = @"DestinyCharacterCustomizationOptionDefinition";
NSString *const kDeDestinyProgressionDefinition = @"DestinyProgressionDefinition";
NSString *const kDeDestinyItemTierTypeDefinition = @"DestinyItemTierTypeDefinition";
NSString *const kDeDestinyActivityInteractableDefinition = @"DestinyActivityInteractableDefinition";
NSString *const kDeDestinyUnlockExpressionMappingDefinition = @"DestinyUnlockExpressionMappingDefinition";
NSString *const kDeDestinyEquipmentSlotDefinition = @"DestinyEquipmentSlotDefinition";
NSString *const kDeDestinyStatGroupDefinition = @"DestinyStatGroupDefinition";
NSString *const kDeDestinySeasonDefinition = @"DestinySeasonDefinition";
NSString *const kDeDestinyFactionDefinition = @"DestinyFactionDefinition";
NSString *const kDeDestinyUnlockValueDefinition = @"DestinyUnlockValueDefinition";
NSString *const kDeDestinyActivityDefinition = @"DestinyActivityDefinition";
NSString *const kDeDestinyEnemyRaceDefinition = @"DestinyEnemyRaceDefinition";
NSString *const kDeDestinySeasonPassDefinition = @"DestinySeasonPassDefinition";
NSString *const kDeDestinyVendorDefinition = @"DestinyVendorDefinition";
NSString *const kDeDestinyActivityGraphDefinition = @"DestinyActivityGraphDefinition";
NSString *const kDeDestinyProgressionMappingDefinition = @"DestinyProgressionMappingDefinition";
NSString *const kDeDestinyPlatformBucketMappingDefinition = @"DestinyPlatformBucketMappingDefinition";
NSString *const kDeDestinyAchievementDefinition = @"DestinyAchievementDefinition";
NSString *const kDeDestinyRewardAdjusterPointerDefinition = @"DestinyRewardAdjusterPointerDefinition";
NSString *const kDeDestinyRewardAdjusterProgressionMapDefinition = @"DestinyRewardAdjusterProgressionMapDefinition";
NSString *const kDeDestinyInventoryItemDefinition = @"DestinyInventoryItemDefinition";
NSString *const kDeDestinyPlaceDefinition = @"DestinyPlaceDefinition";
NSString *const kDeDestinyVendorGroupDefinition = @"DestinyVendorGroupDefinition";
NSString *const kDeDestinyTraitDefinition = @"DestinyTraitDefinition";
NSString *const kDeDestinyLoreDefinition = @"DestinyLoreDefinition";
NSString *const kDeDestinyDamageTypeDefinition = @"DestinyDamageTypeDefinition";
NSString *const kDeDestinyArtDyeReferenceDefinition = @"DestinyArtDyeReferenceDefinition";
NSString *const kDeDestinyMedalTierDefinition = @"DestinyMedalTierDefinition";
NSString *const kDeDestinyActivityModifierDefinition = @"DestinyActivityModifierDefinition";
NSString *const kDeDestinyInventoryBucketDefinition = @"DestinyInventoryBucketDefinition";
NSString *const kDeDestinyGenderDefinition = @"DestinyGenderDefinition";
NSString *const kDeDestinyBondDefinition = @"DestinyBondDefinition";
NSString *const kDeDestinyRecordDefinition = @"DestinyRecordDefinition";
NSString *const kDeDestinyRewardSourceDefinition = @"DestinyRewardSourceDefinition";
NSString *const kDeDestinyBreakerTypeDefinition = @"DestinyBreakerTypeDefinition";
NSString *const kDeDestinyCollectibleDefinition = @"DestinyCollectibleDefinition";
NSString *const kDeDestinyCharacterCustomizationCategoryDefinition = @"DestinyCharacterCustomizationCategoryDefinition";
NSString *const kDeDestinySandboxPatternDefinition = @"DestinySandboxPatternDefinition";
NSString *const kDeDestinyProgressionLevelRequirementDefinition = @"DestinyProgressionLevelRequirementDefinition";
NSString *const kDeDestinyRewardMappingDefinition = @"DestinyRewardMappingDefinition";
NSString *const kDeDestinyReportReasonCategoryDefinition = @"DestinyReportReasonCategoryDefinition";
NSString *const kDeDestinyPlugSetDefinition = @"DestinyPlugSetDefinition";
NSString *const kDeDestinyNodeStepSummaryDefinition = @"DestinyNodeStepSummaryDefinition";
NSString *const kDeDestinyUnlockCountMappingDefinition = @"DestinyUnlockCountMappingDefinition";
NSString *const kDeDestinySocketTypeDefinition = @"DestinySocketTypeDefinition";
NSString *const kDeDestinyMilestoneDefinition = @"DestinyMilestoneDefinition";
NSString *const kDeDestinyPresentationNodeDefinition = @"DestinyPresentationNodeDefinition";
NSString *const kDeDestinyPowerCapDefinition = @"DestinyPowerCapDefinition";
NSString *const kDeDestinyDestinationDefinition = @"DestinyDestinationDefinition";
NSString *const kDeDestinyInventoryItemLiteDefinition = @"DestinyInventoryItemLiteDefinition";
NSString *const kDeDestinyMetricDefinition = @"DestinyMetricDefinition";
NSString *const kDeDestinyRewardSheetDefinition = @"DestinyRewardSheetDefinition";
NSString *const kDeDestinyStatDefinition = @"DestinyStatDefinition";
NSString *const kDeDestinySackRewardItemListDefinition = @"DestinySackRewardItemListDefinition";
NSString *const kDeDestinyUnlockEventDefinition = @"DestinyUnlockEventDefinition";
NSString *const kDeDestinyMaterialRequirementSetDefinition = @"DestinyMaterialRequirementSetDefinition";
NSString *const kDeDestinyRaceDefinition = @"DestinyRaceDefinition";
NSString *const kDeDestinyClassDefinition = @"DestinyClassDefinition";
NSString *const kDeDestinyTalentGridDefinition = @"DestinyTalentGridDefinition";
NSString *const kDeDestinyUnlockDefinition = @"DestinyUnlockDefinition";
NSString *const kDeDestinyActivityTypeDefinition = @"DestinyActivityTypeDefinition";
NSString *const kDeDestinyEntitlementOfferDefinition = @"DestinyEntitlementOfferDefinition";
NSString *const kDeDestinyObjectiveDefinition = @"DestinyObjectiveDefinition";
NSString *const kDeDestinySocketCategoryDefinition = @"DestinySocketCategoryDefinition";
NSString *const kDeDestinyItemCategoryDefinition = @"DestinyItemCategoryDefinition";
NSString *const kDeDestinyArtifactDefinition = @"DestinyArtifactDefinition";
NSString *const kDeDestinyLocationDefinition = @"DestinyLocationDefinition";
NSString *const kDeDestinyChecklistDefinition = @"DestinyChecklistDefinition";
NSString *const kDeDestinySandboxPerkDefinition = @"DestinySandboxPerkDefinition";
NSString *const kDeDestinyPresentationNodeBaseDefinition = @"DestinyPresentationNodeBaseDefinition";
NSString *const kDeDestinyEnergyTypeDefinition = @"DestinyEnergyTypeDefinition";
NSString *const kDeDestinyActivityModeDefinition = @"DestinyActivityModeDefinition";
NSString *const kDeDestinyTraitCategoryDefinition = @"DestinyTraitCategoryDefinition";
NSString *const kDeDestinyArtDyeChannelDefinition = @"DestinyArtDyeChannelDefinition";
NSString *const kDeDestinyRewardItemListDefinition = @"DestinyRewardItemListDefinition";


@interface De ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation De

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
            self.destinyCharacterCustomizationOptionDefinition = [self objectOrNilForKey:kDeDestinyCharacterCustomizationOptionDefinition fromDictionary:dict];
            self.destinyProgressionDefinition = [self objectOrNilForKey:kDeDestinyProgressionDefinition fromDictionary:dict];
            self.destinyItemTierTypeDefinition = [self objectOrNilForKey:kDeDestinyItemTierTypeDefinition fromDictionary:dict];
            self.destinyActivityInteractableDefinition = [self objectOrNilForKey:kDeDestinyActivityInteractableDefinition fromDictionary:dict];
            self.destinyUnlockExpressionMappingDefinition = [self objectOrNilForKey:kDeDestinyUnlockExpressionMappingDefinition fromDictionary:dict];
            self.destinyEquipmentSlotDefinition = [self objectOrNilForKey:kDeDestinyEquipmentSlotDefinition fromDictionary:dict];
            self.destinyStatGroupDefinition = [self objectOrNilForKey:kDeDestinyStatGroupDefinition fromDictionary:dict];
            self.destinySeasonDefinition = [self objectOrNilForKey:kDeDestinySeasonDefinition fromDictionary:dict];
            self.destinyFactionDefinition = [self objectOrNilForKey:kDeDestinyFactionDefinition fromDictionary:dict];
            self.destinyUnlockValueDefinition = [self objectOrNilForKey:kDeDestinyUnlockValueDefinition fromDictionary:dict];
            self.destinyActivityDefinition = [self objectOrNilForKey:kDeDestinyActivityDefinition fromDictionary:dict];
            self.destinyEnemyRaceDefinition = [self objectOrNilForKey:kDeDestinyEnemyRaceDefinition fromDictionary:dict];
            self.destinySeasonPassDefinition = [self objectOrNilForKey:kDeDestinySeasonPassDefinition fromDictionary:dict];
            self.destinyVendorDefinition = [self objectOrNilForKey:kDeDestinyVendorDefinition fromDictionary:dict];
            self.destinyActivityGraphDefinition = [self objectOrNilForKey:kDeDestinyActivityGraphDefinition fromDictionary:dict];
            self.destinyProgressionMappingDefinition = [self objectOrNilForKey:kDeDestinyProgressionMappingDefinition fromDictionary:dict];
            self.destinyPlatformBucketMappingDefinition = [self objectOrNilForKey:kDeDestinyPlatformBucketMappingDefinition fromDictionary:dict];
            self.destinyAchievementDefinition = [self objectOrNilForKey:kDeDestinyAchievementDefinition fromDictionary:dict];
            self.destinyRewardAdjusterPointerDefinition = [self objectOrNilForKey:kDeDestinyRewardAdjusterPointerDefinition fromDictionary:dict];
            self.destinyRewardAdjusterProgressionMapDefinition = [self objectOrNilForKey:kDeDestinyRewardAdjusterProgressionMapDefinition fromDictionary:dict];
            self.destinyInventoryItemDefinition = [self objectOrNilForKey:kDeDestinyInventoryItemDefinition fromDictionary:dict];
            self.destinyPlaceDefinition = [self objectOrNilForKey:kDeDestinyPlaceDefinition fromDictionary:dict];
            self.destinyVendorGroupDefinition = [self objectOrNilForKey:kDeDestinyVendorGroupDefinition fromDictionary:dict];
            self.destinyTraitDefinition = [self objectOrNilForKey:kDeDestinyTraitDefinition fromDictionary:dict];
            self.destinyLoreDefinition = [self objectOrNilForKey:kDeDestinyLoreDefinition fromDictionary:dict];
            self.destinyDamageTypeDefinition = [self objectOrNilForKey:kDeDestinyDamageTypeDefinition fromDictionary:dict];
            self.destinyArtDyeReferenceDefinition = [self objectOrNilForKey:kDeDestinyArtDyeReferenceDefinition fromDictionary:dict];
            self.destinyMedalTierDefinition = [self objectOrNilForKey:kDeDestinyMedalTierDefinition fromDictionary:dict];
            self.destinyActivityModifierDefinition = [self objectOrNilForKey:kDeDestinyActivityModifierDefinition fromDictionary:dict];
            self.destinyInventoryBucketDefinition = [self objectOrNilForKey:kDeDestinyInventoryBucketDefinition fromDictionary:dict];
            self.destinyGenderDefinition = [self objectOrNilForKey:kDeDestinyGenderDefinition fromDictionary:dict];
            self.destinyBondDefinition = [self objectOrNilForKey:kDeDestinyBondDefinition fromDictionary:dict];
            self.destinyRecordDefinition = [self objectOrNilForKey:kDeDestinyRecordDefinition fromDictionary:dict];
            self.destinyRewardSourceDefinition = [self objectOrNilForKey:kDeDestinyRewardSourceDefinition fromDictionary:dict];
            self.destinyBreakerTypeDefinition = [self objectOrNilForKey:kDeDestinyBreakerTypeDefinition fromDictionary:dict];
            self.destinyCollectibleDefinition = [self objectOrNilForKey:kDeDestinyCollectibleDefinition fromDictionary:dict];
            self.destinyCharacterCustomizationCategoryDefinition = [self objectOrNilForKey:kDeDestinyCharacterCustomizationCategoryDefinition fromDictionary:dict];
            self.destinySandboxPatternDefinition = [self objectOrNilForKey:kDeDestinySandboxPatternDefinition fromDictionary:dict];
            self.destinyProgressionLevelRequirementDefinition = [self objectOrNilForKey:kDeDestinyProgressionLevelRequirementDefinition fromDictionary:dict];
            self.destinyRewardMappingDefinition = [self objectOrNilForKey:kDeDestinyRewardMappingDefinition fromDictionary:dict];
            self.destinyReportReasonCategoryDefinition = [self objectOrNilForKey:kDeDestinyReportReasonCategoryDefinition fromDictionary:dict];
            self.destinyPlugSetDefinition = [self objectOrNilForKey:kDeDestinyPlugSetDefinition fromDictionary:dict];
            self.destinyNodeStepSummaryDefinition = [self objectOrNilForKey:kDeDestinyNodeStepSummaryDefinition fromDictionary:dict];
            self.destinyUnlockCountMappingDefinition = [self objectOrNilForKey:kDeDestinyUnlockCountMappingDefinition fromDictionary:dict];
            self.destinySocketTypeDefinition = [self objectOrNilForKey:kDeDestinySocketTypeDefinition fromDictionary:dict];
            self.destinyMilestoneDefinition = [self objectOrNilForKey:kDeDestinyMilestoneDefinition fromDictionary:dict];
            self.destinyPresentationNodeDefinition = [self objectOrNilForKey:kDeDestinyPresentationNodeDefinition fromDictionary:dict];
            self.destinyPowerCapDefinition = [self objectOrNilForKey:kDeDestinyPowerCapDefinition fromDictionary:dict];
            self.destinyDestinationDefinition = [self objectOrNilForKey:kDeDestinyDestinationDefinition fromDictionary:dict];
            self.destinyInventoryItemLiteDefinition = [self objectOrNilForKey:kDeDestinyInventoryItemLiteDefinition fromDictionary:dict];
            self.destinyMetricDefinition = [self objectOrNilForKey:kDeDestinyMetricDefinition fromDictionary:dict];
            self.destinyRewardSheetDefinition = [self objectOrNilForKey:kDeDestinyRewardSheetDefinition fromDictionary:dict];
            self.destinyStatDefinition = [self objectOrNilForKey:kDeDestinyStatDefinition fromDictionary:dict];
            self.destinySackRewardItemListDefinition = [self objectOrNilForKey:kDeDestinySackRewardItemListDefinition fromDictionary:dict];
            self.destinyUnlockEventDefinition = [self objectOrNilForKey:kDeDestinyUnlockEventDefinition fromDictionary:dict];
            self.destinyMaterialRequirementSetDefinition = [self objectOrNilForKey:kDeDestinyMaterialRequirementSetDefinition fromDictionary:dict];
            self.destinyRaceDefinition = [self objectOrNilForKey:kDeDestinyRaceDefinition fromDictionary:dict];
            self.destinyClassDefinition = [self objectOrNilForKey:kDeDestinyClassDefinition fromDictionary:dict];
            self.destinyTalentGridDefinition = [self objectOrNilForKey:kDeDestinyTalentGridDefinition fromDictionary:dict];
            self.destinyUnlockDefinition = [self objectOrNilForKey:kDeDestinyUnlockDefinition fromDictionary:dict];
            self.destinyActivityTypeDefinition = [self objectOrNilForKey:kDeDestinyActivityTypeDefinition fromDictionary:dict];
            self.destinyEntitlementOfferDefinition = [self objectOrNilForKey:kDeDestinyEntitlementOfferDefinition fromDictionary:dict];
            self.destinyObjectiveDefinition = [self objectOrNilForKey:kDeDestinyObjectiveDefinition fromDictionary:dict];
            self.destinySocketCategoryDefinition = [self objectOrNilForKey:kDeDestinySocketCategoryDefinition fromDictionary:dict];
            self.destinyItemCategoryDefinition = [self objectOrNilForKey:kDeDestinyItemCategoryDefinition fromDictionary:dict];
            self.destinyArtifactDefinition = [self objectOrNilForKey:kDeDestinyArtifactDefinition fromDictionary:dict];
            self.destinyLocationDefinition = [self objectOrNilForKey:kDeDestinyLocationDefinition fromDictionary:dict];
            self.destinyChecklistDefinition = [self objectOrNilForKey:kDeDestinyChecklistDefinition fromDictionary:dict];
            self.destinySandboxPerkDefinition = [self objectOrNilForKey:kDeDestinySandboxPerkDefinition fromDictionary:dict];
            self.destinyPresentationNodeBaseDefinition = [self objectOrNilForKey:kDeDestinyPresentationNodeBaseDefinition fromDictionary:dict];
            self.destinyEnergyTypeDefinition = [self objectOrNilForKey:kDeDestinyEnergyTypeDefinition fromDictionary:dict];
            self.destinyActivityModeDefinition = [self objectOrNilForKey:kDeDestinyActivityModeDefinition fromDictionary:dict];
            self.destinyTraitCategoryDefinition = [self objectOrNilForKey:kDeDestinyTraitCategoryDefinition fromDictionary:dict];
            self.destinyArtDyeChannelDefinition = [self objectOrNilForKey:kDeDestinyArtDyeChannelDefinition fromDictionary:dict];
            self.destinyRewardItemListDefinition = [self objectOrNilForKey:kDeDestinyRewardItemListDefinition fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.destinyCharacterCustomizationOptionDefinition forKey:kDeDestinyCharacterCustomizationOptionDefinition];
    [mutableDict setValue:self.destinyProgressionDefinition forKey:kDeDestinyProgressionDefinition];
    [mutableDict setValue:self.destinyItemTierTypeDefinition forKey:kDeDestinyItemTierTypeDefinition];
    [mutableDict setValue:self.destinyActivityInteractableDefinition forKey:kDeDestinyActivityInteractableDefinition];
    [mutableDict setValue:self.destinyUnlockExpressionMappingDefinition forKey:kDeDestinyUnlockExpressionMappingDefinition];
    [mutableDict setValue:self.destinyEquipmentSlotDefinition forKey:kDeDestinyEquipmentSlotDefinition];
    [mutableDict setValue:self.destinyStatGroupDefinition forKey:kDeDestinyStatGroupDefinition];
    [mutableDict setValue:self.destinySeasonDefinition forKey:kDeDestinySeasonDefinition];
    [mutableDict setValue:self.destinyFactionDefinition forKey:kDeDestinyFactionDefinition];
    [mutableDict setValue:self.destinyUnlockValueDefinition forKey:kDeDestinyUnlockValueDefinition];
    [mutableDict setValue:self.destinyActivityDefinition forKey:kDeDestinyActivityDefinition];
    [mutableDict setValue:self.destinyEnemyRaceDefinition forKey:kDeDestinyEnemyRaceDefinition];
    [mutableDict setValue:self.destinySeasonPassDefinition forKey:kDeDestinySeasonPassDefinition];
    [mutableDict setValue:self.destinyVendorDefinition forKey:kDeDestinyVendorDefinition];
    [mutableDict setValue:self.destinyActivityGraphDefinition forKey:kDeDestinyActivityGraphDefinition];
    [mutableDict setValue:self.destinyProgressionMappingDefinition forKey:kDeDestinyProgressionMappingDefinition];
    [mutableDict setValue:self.destinyPlatformBucketMappingDefinition forKey:kDeDestinyPlatformBucketMappingDefinition];
    [mutableDict setValue:self.destinyAchievementDefinition forKey:kDeDestinyAchievementDefinition];
    [mutableDict setValue:self.destinyRewardAdjusterPointerDefinition forKey:kDeDestinyRewardAdjusterPointerDefinition];
    [mutableDict setValue:self.destinyRewardAdjusterProgressionMapDefinition forKey:kDeDestinyRewardAdjusterProgressionMapDefinition];
    [mutableDict setValue:self.destinyInventoryItemDefinition forKey:kDeDestinyInventoryItemDefinition];
    [mutableDict setValue:self.destinyPlaceDefinition forKey:kDeDestinyPlaceDefinition];
    [mutableDict setValue:self.destinyVendorGroupDefinition forKey:kDeDestinyVendorGroupDefinition];
    [mutableDict setValue:self.destinyTraitDefinition forKey:kDeDestinyTraitDefinition];
    [mutableDict setValue:self.destinyLoreDefinition forKey:kDeDestinyLoreDefinition];
    [mutableDict setValue:self.destinyDamageTypeDefinition forKey:kDeDestinyDamageTypeDefinition];
    [mutableDict setValue:self.destinyArtDyeReferenceDefinition forKey:kDeDestinyArtDyeReferenceDefinition];
    [mutableDict setValue:self.destinyMedalTierDefinition forKey:kDeDestinyMedalTierDefinition];
    [mutableDict setValue:self.destinyActivityModifierDefinition forKey:kDeDestinyActivityModifierDefinition];
    [mutableDict setValue:self.destinyInventoryBucketDefinition forKey:kDeDestinyInventoryBucketDefinition];
    [mutableDict setValue:self.destinyGenderDefinition forKey:kDeDestinyGenderDefinition];
    [mutableDict setValue:self.destinyBondDefinition forKey:kDeDestinyBondDefinition];
    [mutableDict setValue:self.destinyRecordDefinition forKey:kDeDestinyRecordDefinition];
    [mutableDict setValue:self.destinyRewardSourceDefinition forKey:kDeDestinyRewardSourceDefinition];
    [mutableDict setValue:self.destinyBreakerTypeDefinition forKey:kDeDestinyBreakerTypeDefinition];
    [mutableDict setValue:self.destinyCollectibleDefinition forKey:kDeDestinyCollectibleDefinition];
    [mutableDict setValue:self.destinyCharacterCustomizationCategoryDefinition forKey:kDeDestinyCharacterCustomizationCategoryDefinition];
    [mutableDict setValue:self.destinySandboxPatternDefinition forKey:kDeDestinySandboxPatternDefinition];
    [mutableDict setValue:self.destinyProgressionLevelRequirementDefinition forKey:kDeDestinyProgressionLevelRequirementDefinition];
    [mutableDict setValue:self.destinyRewardMappingDefinition forKey:kDeDestinyRewardMappingDefinition];
    [mutableDict setValue:self.destinyReportReasonCategoryDefinition forKey:kDeDestinyReportReasonCategoryDefinition];
    [mutableDict setValue:self.destinyPlugSetDefinition forKey:kDeDestinyPlugSetDefinition];
    [mutableDict setValue:self.destinyNodeStepSummaryDefinition forKey:kDeDestinyNodeStepSummaryDefinition];
    [mutableDict setValue:self.destinyUnlockCountMappingDefinition forKey:kDeDestinyUnlockCountMappingDefinition];
    [mutableDict setValue:self.destinySocketTypeDefinition forKey:kDeDestinySocketTypeDefinition];
    [mutableDict setValue:self.destinyMilestoneDefinition forKey:kDeDestinyMilestoneDefinition];
    [mutableDict setValue:self.destinyPresentationNodeDefinition forKey:kDeDestinyPresentationNodeDefinition];
    [mutableDict setValue:self.destinyPowerCapDefinition forKey:kDeDestinyPowerCapDefinition];
    [mutableDict setValue:self.destinyDestinationDefinition forKey:kDeDestinyDestinationDefinition];
    [mutableDict setValue:self.destinyInventoryItemLiteDefinition forKey:kDeDestinyInventoryItemLiteDefinition];
    [mutableDict setValue:self.destinyMetricDefinition forKey:kDeDestinyMetricDefinition];
    [mutableDict setValue:self.destinyRewardSheetDefinition forKey:kDeDestinyRewardSheetDefinition];
    [mutableDict setValue:self.destinyStatDefinition forKey:kDeDestinyStatDefinition];
    [mutableDict setValue:self.destinySackRewardItemListDefinition forKey:kDeDestinySackRewardItemListDefinition];
    [mutableDict setValue:self.destinyUnlockEventDefinition forKey:kDeDestinyUnlockEventDefinition];
    [mutableDict setValue:self.destinyMaterialRequirementSetDefinition forKey:kDeDestinyMaterialRequirementSetDefinition];
    [mutableDict setValue:self.destinyRaceDefinition forKey:kDeDestinyRaceDefinition];
    [mutableDict setValue:self.destinyClassDefinition forKey:kDeDestinyClassDefinition];
    [mutableDict setValue:self.destinyTalentGridDefinition forKey:kDeDestinyTalentGridDefinition];
    [mutableDict setValue:self.destinyUnlockDefinition forKey:kDeDestinyUnlockDefinition];
    [mutableDict setValue:self.destinyActivityTypeDefinition forKey:kDeDestinyActivityTypeDefinition];
    [mutableDict setValue:self.destinyEntitlementOfferDefinition forKey:kDeDestinyEntitlementOfferDefinition];
    [mutableDict setValue:self.destinyObjectiveDefinition forKey:kDeDestinyObjectiveDefinition];
    [mutableDict setValue:self.destinySocketCategoryDefinition forKey:kDeDestinySocketCategoryDefinition];
    [mutableDict setValue:self.destinyItemCategoryDefinition forKey:kDeDestinyItemCategoryDefinition];
    [mutableDict setValue:self.destinyArtifactDefinition forKey:kDeDestinyArtifactDefinition];
    [mutableDict setValue:self.destinyLocationDefinition forKey:kDeDestinyLocationDefinition];
    [mutableDict setValue:self.destinyChecklistDefinition forKey:kDeDestinyChecklistDefinition];
    [mutableDict setValue:self.destinySandboxPerkDefinition forKey:kDeDestinySandboxPerkDefinition];
    [mutableDict setValue:self.destinyPresentationNodeBaseDefinition forKey:kDeDestinyPresentationNodeBaseDefinition];
    [mutableDict setValue:self.destinyEnergyTypeDefinition forKey:kDeDestinyEnergyTypeDefinition];
    [mutableDict setValue:self.destinyActivityModeDefinition forKey:kDeDestinyActivityModeDefinition];
    [mutableDict setValue:self.destinyTraitCategoryDefinition forKey:kDeDestinyTraitCategoryDefinition];
    [mutableDict setValue:self.destinyArtDyeChannelDefinition forKey:kDeDestinyArtDyeChannelDefinition];
    [mutableDict setValue:self.destinyRewardItemListDefinition forKey:kDeDestinyRewardItemListDefinition];

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

    self.destinyCharacterCustomizationOptionDefinition = [aDecoder decodeObjectForKey:kDeDestinyCharacterCustomizationOptionDefinition];
    self.destinyProgressionDefinition = [aDecoder decodeObjectForKey:kDeDestinyProgressionDefinition];
    self.destinyItemTierTypeDefinition = [aDecoder decodeObjectForKey:kDeDestinyItemTierTypeDefinition];
    self.destinyActivityInteractableDefinition = [aDecoder decodeObjectForKey:kDeDestinyActivityInteractableDefinition];
    self.destinyUnlockExpressionMappingDefinition = [aDecoder decodeObjectForKey:kDeDestinyUnlockExpressionMappingDefinition];
    self.destinyEquipmentSlotDefinition = [aDecoder decodeObjectForKey:kDeDestinyEquipmentSlotDefinition];
    self.destinyStatGroupDefinition = [aDecoder decodeObjectForKey:kDeDestinyStatGroupDefinition];
    self.destinySeasonDefinition = [aDecoder decodeObjectForKey:kDeDestinySeasonDefinition];
    self.destinyFactionDefinition = [aDecoder decodeObjectForKey:kDeDestinyFactionDefinition];
    self.destinyUnlockValueDefinition = [aDecoder decodeObjectForKey:kDeDestinyUnlockValueDefinition];
    self.destinyActivityDefinition = [aDecoder decodeObjectForKey:kDeDestinyActivityDefinition];
    self.destinyEnemyRaceDefinition = [aDecoder decodeObjectForKey:kDeDestinyEnemyRaceDefinition];
    self.destinySeasonPassDefinition = [aDecoder decodeObjectForKey:kDeDestinySeasonPassDefinition];
    self.destinyVendorDefinition = [aDecoder decodeObjectForKey:kDeDestinyVendorDefinition];
    self.destinyActivityGraphDefinition = [aDecoder decodeObjectForKey:kDeDestinyActivityGraphDefinition];
    self.destinyProgressionMappingDefinition = [aDecoder decodeObjectForKey:kDeDestinyProgressionMappingDefinition];
    self.destinyPlatformBucketMappingDefinition = [aDecoder decodeObjectForKey:kDeDestinyPlatformBucketMappingDefinition];
    self.destinyAchievementDefinition = [aDecoder decodeObjectForKey:kDeDestinyAchievementDefinition];
    self.destinyRewardAdjusterPointerDefinition = [aDecoder decodeObjectForKey:kDeDestinyRewardAdjusterPointerDefinition];
    self.destinyRewardAdjusterProgressionMapDefinition = [aDecoder decodeObjectForKey:kDeDestinyRewardAdjusterProgressionMapDefinition];
    self.destinyInventoryItemDefinition = [aDecoder decodeObjectForKey:kDeDestinyInventoryItemDefinition];
    self.destinyPlaceDefinition = [aDecoder decodeObjectForKey:kDeDestinyPlaceDefinition];
    self.destinyVendorGroupDefinition = [aDecoder decodeObjectForKey:kDeDestinyVendorGroupDefinition];
    self.destinyTraitDefinition = [aDecoder decodeObjectForKey:kDeDestinyTraitDefinition];
    self.destinyLoreDefinition = [aDecoder decodeObjectForKey:kDeDestinyLoreDefinition];
    self.destinyDamageTypeDefinition = [aDecoder decodeObjectForKey:kDeDestinyDamageTypeDefinition];
    self.destinyArtDyeReferenceDefinition = [aDecoder decodeObjectForKey:kDeDestinyArtDyeReferenceDefinition];
    self.destinyMedalTierDefinition = [aDecoder decodeObjectForKey:kDeDestinyMedalTierDefinition];
    self.destinyActivityModifierDefinition = [aDecoder decodeObjectForKey:kDeDestinyActivityModifierDefinition];
    self.destinyInventoryBucketDefinition = [aDecoder decodeObjectForKey:kDeDestinyInventoryBucketDefinition];
    self.destinyGenderDefinition = [aDecoder decodeObjectForKey:kDeDestinyGenderDefinition];
    self.destinyBondDefinition = [aDecoder decodeObjectForKey:kDeDestinyBondDefinition];
    self.destinyRecordDefinition = [aDecoder decodeObjectForKey:kDeDestinyRecordDefinition];
    self.destinyRewardSourceDefinition = [aDecoder decodeObjectForKey:kDeDestinyRewardSourceDefinition];
    self.destinyBreakerTypeDefinition = [aDecoder decodeObjectForKey:kDeDestinyBreakerTypeDefinition];
    self.destinyCollectibleDefinition = [aDecoder decodeObjectForKey:kDeDestinyCollectibleDefinition];
    self.destinyCharacterCustomizationCategoryDefinition = [aDecoder decodeObjectForKey:kDeDestinyCharacterCustomizationCategoryDefinition];
    self.destinySandboxPatternDefinition = [aDecoder decodeObjectForKey:kDeDestinySandboxPatternDefinition];
    self.destinyProgressionLevelRequirementDefinition = [aDecoder decodeObjectForKey:kDeDestinyProgressionLevelRequirementDefinition];
    self.destinyRewardMappingDefinition = [aDecoder decodeObjectForKey:kDeDestinyRewardMappingDefinition];
    self.destinyReportReasonCategoryDefinition = [aDecoder decodeObjectForKey:kDeDestinyReportReasonCategoryDefinition];
    self.destinyPlugSetDefinition = [aDecoder decodeObjectForKey:kDeDestinyPlugSetDefinition];
    self.destinyNodeStepSummaryDefinition = [aDecoder decodeObjectForKey:kDeDestinyNodeStepSummaryDefinition];
    self.destinyUnlockCountMappingDefinition = [aDecoder decodeObjectForKey:kDeDestinyUnlockCountMappingDefinition];
    self.destinySocketTypeDefinition = [aDecoder decodeObjectForKey:kDeDestinySocketTypeDefinition];
    self.destinyMilestoneDefinition = [aDecoder decodeObjectForKey:kDeDestinyMilestoneDefinition];
    self.destinyPresentationNodeDefinition = [aDecoder decodeObjectForKey:kDeDestinyPresentationNodeDefinition];
    self.destinyPowerCapDefinition = [aDecoder decodeObjectForKey:kDeDestinyPowerCapDefinition];
    self.destinyDestinationDefinition = [aDecoder decodeObjectForKey:kDeDestinyDestinationDefinition];
    self.destinyInventoryItemLiteDefinition = [aDecoder decodeObjectForKey:kDeDestinyInventoryItemLiteDefinition];
    self.destinyMetricDefinition = [aDecoder decodeObjectForKey:kDeDestinyMetricDefinition];
    self.destinyRewardSheetDefinition = [aDecoder decodeObjectForKey:kDeDestinyRewardSheetDefinition];
    self.destinyStatDefinition = [aDecoder decodeObjectForKey:kDeDestinyStatDefinition];
    self.destinySackRewardItemListDefinition = [aDecoder decodeObjectForKey:kDeDestinySackRewardItemListDefinition];
    self.destinyUnlockEventDefinition = [aDecoder decodeObjectForKey:kDeDestinyUnlockEventDefinition];
    self.destinyMaterialRequirementSetDefinition = [aDecoder decodeObjectForKey:kDeDestinyMaterialRequirementSetDefinition];
    self.destinyRaceDefinition = [aDecoder decodeObjectForKey:kDeDestinyRaceDefinition];
    self.destinyClassDefinition = [aDecoder decodeObjectForKey:kDeDestinyClassDefinition];
    self.destinyTalentGridDefinition = [aDecoder decodeObjectForKey:kDeDestinyTalentGridDefinition];
    self.destinyUnlockDefinition = [aDecoder decodeObjectForKey:kDeDestinyUnlockDefinition];
    self.destinyActivityTypeDefinition = [aDecoder decodeObjectForKey:kDeDestinyActivityTypeDefinition];
    self.destinyEntitlementOfferDefinition = [aDecoder decodeObjectForKey:kDeDestinyEntitlementOfferDefinition];
    self.destinyObjectiveDefinition = [aDecoder decodeObjectForKey:kDeDestinyObjectiveDefinition];
    self.destinySocketCategoryDefinition = [aDecoder decodeObjectForKey:kDeDestinySocketCategoryDefinition];
    self.destinyItemCategoryDefinition = [aDecoder decodeObjectForKey:kDeDestinyItemCategoryDefinition];
    self.destinyArtifactDefinition = [aDecoder decodeObjectForKey:kDeDestinyArtifactDefinition];
    self.destinyLocationDefinition = [aDecoder decodeObjectForKey:kDeDestinyLocationDefinition];
    self.destinyChecklistDefinition = [aDecoder decodeObjectForKey:kDeDestinyChecklistDefinition];
    self.destinySandboxPerkDefinition = [aDecoder decodeObjectForKey:kDeDestinySandboxPerkDefinition];
    self.destinyPresentationNodeBaseDefinition = [aDecoder decodeObjectForKey:kDeDestinyPresentationNodeBaseDefinition];
    self.destinyEnergyTypeDefinition = [aDecoder decodeObjectForKey:kDeDestinyEnergyTypeDefinition];
    self.destinyActivityModeDefinition = [aDecoder decodeObjectForKey:kDeDestinyActivityModeDefinition];
    self.destinyTraitCategoryDefinition = [aDecoder decodeObjectForKey:kDeDestinyTraitCategoryDefinition];
    self.destinyArtDyeChannelDefinition = [aDecoder decodeObjectForKey:kDeDestinyArtDyeChannelDefinition];
    self.destinyRewardItemListDefinition = [aDecoder decodeObjectForKey:kDeDestinyRewardItemListDefinition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_destinyCharacterCustomizationOptionDefinition forKey:kDeDestinyCharacterCustomizationOptionDefinition];
    [aCoder encodeObject:_destinyProgressionDefinition forKey:kDeDestinyProgressionDefinition];
    [aCoder encodeObject:_destinyItemTierTypeDefinition forKey:kDeDestinyItemTierTypeDefinition];
    [aCoder encodeObject:_destinyActivityInteractableDefinition forKey:kDeDestinyActivityInteractableDefinition];
    [aCoder encodeObject:_destinyUnlockExpressionMappingDefinition forKey:kDeDestinyUnlockExpressionMappingDefinition];
    [aCoder encodeObject:_destinyEquipmentSlotDefinition forKey:kDeDestinyEquipmentSlotDefinition];
    [aCoder encodeObject:_destinyStatGroupDefinition forKey:kDeDestinyStatGroupDefinition];
    [aCoder encodeObject:_destinySeasonDefinition forKey:kDeDestinySeasonDefinition];
    [aCoder encodeObject:_destinyFactionDefinition forKey:kDeDestinyFactionDefinition];
    [aCoder encodeObject:_destinyUnlockValueDefinition forKey:kDeDestinyUnlockValueDefinition];
    [aCoder encodeObject:_destinyActivityDefinition forKey:kDeDestinyActivityDefinition];
    [aCoder encodeObject:_destinyEnemyRaceDefinition forKey:kDeDestinyEnemyRaceDefinition];
    [aCoder encodeObject:_destinySeasonPassDefinition forKey:kDeDestinySeasonPassDefinition];
    [aCoder encodeObject:_destinyVendorDefinition forKey:kDeDestinyVendorDefinition];
    [aCoder encodeObject:_destinyActivityGraphDefinition forKey:kDeDestinyActivityGraphDefinition];
    [aCoder encodeObject:_destinyProgressionMappingDefinition forKey:kDeDestinyProgressionMappingDefinition];
    [aCoder encodeObject:_destinyPlatformBucketMappingDefinition forKey:kDeDestinyPlatformBucketMappingDefinition];
    [aCoder encodeObject:_destinyAchievementDefinition forKey:kDeDestinyAchievementDefinition];
    [aCoder encodeObject:_destinyRewardAdjusterPointerDefinition forKey:kDeDestinyRewardAdjusterPointerDefinition];
    [aCoder encodeObject:_destinyRewardAdjusterProgressionMapDefinition forKey:kDeDestinyRewardAdjusterProgressionMapDefinition];
    [aCoder encodeObject:_destinyInventoryItemDefinition forKey:kDeDestinyInventoryItemDefinition];
    [aCoder encodeObject:_destinyPlaceDefinition forKey:kDeDestinyPlaceDefinition];
    [aCoder encodeObject:_destinyVendorGroupDefinition forKey:kDeDestinyVendorGroupDefinition];
    [aCoder encodeObject:_destinyTraitDefinition forKey:kDeDestinyTraitDefinition];
    [aCoder encodeObject:_destinyLoreDefinition forKey:kDeDestinyLoreDefinition];
    [aCoder encodeObject:_destinyDamageTypeDefinition forKey:kDeDestinyDamageTypeDefinition];
    [aCoder encodeObject:_destinyArtDyeReferenceDefinition forKey:kDeDestinyArtDyeReferenceDefinition];
    [aCoder encodeObject:_destinyMedalTierDefinition forKey:kDeDestinyMedalTierDefinition];
    [aCoder encodeObject:_destinyActivityModifierDefinition forKey:kDeDestinyActivityModifierDefinition];
    [aCoder encodeObject:_destinyInventoryBucketDefinition forKey:kDeDestinyInventoryBucketDefinition];
    [aCoder encodeObject:_destinyGenderDefinition forKey:kDeDestinyGenderDefinition];
    [aCoder encodeObject:_destinyBondDefinition forKey:kDeDestinyBondDefinition];
    [aCoder encodeObject:_destinyRecordDefinition forKey:kDeDestinyRecordDefinition];
    [aCoder encodeObject:_destinyRewardSourceDefinition forKey:kDeDestinyRewardSourceDefinition];
    [aCoder encodeObject:_destinyBreakerTypeDefinition forKey:kDeDestinyBreakerTypeDefinition];
    [aCoder encodeObject:_destinyCollectibleDefinition forKey:kDeDestinyCollectibleDefinition];
    [aCoder encodeObject:_destinyCharacterCustomizationCategoryDefinition forKey:kDeDestinyCharacterCustomizationCategoryDefinition];
    [aCoder encodeObject:_destinySandboxPatternDefinition forKey:kDeDestinySandboxPatternDefinition];
    [aCoder encodeObject:_destinyProgressionLevelRequirementDefinition forKey:kDeDestinyProgressionLevelRequirementDefinition];
    [aCoder encodeObject:_destinyRewardMappingDefinition forKey:kDeDestinyRewardMappingDefinition];
    [aCoder encodeObject:_destinyReportReasonCategoryDefinition forKey:kDeDestinyReportReasonCategoryDefinition];
    [aCoder encodeObject:_destinyPlugSetDefinition forKey:kDeDestinyPlugSetDefinition];
    [aCoder encodeObject:_destinyNodeStepSummaryDefinition forKey:kDeDestinyNodeStepSummaryDefinition];
    [aCoder encodeObject:_destinyUnlockCountMappingDefinition forKey:kDeDestinyUnlockCountMappingDefinition];
    [aCoder encodeObject:_destinySocketTypeDefinition forKey:kDeDestinySocketTypeDefinition];
    [aCoder encodeObject:_destinyMilestoneDefinition forKey:kDeDestinyMilestoneDefinition];
    [aCoder encodeObject:_destinyPresentationNodeDefinition forKey:kDeDestinyPresentationNodeDefinition];
    [aCoder encodeObject:_destinyPowerCapDefinition forKey:kDeDestinyPowerCapDefinition];
    [aCoder encodeObject:_destinyDestinationDefinition forKey:kDeDestinyDestinationDefinition];
    [aCoder encodeObject:_destinyInventoryItemLiteDefinition forKey:kDeDestinyInventoryItemLiteDefinition];
    [aCoder encodeObject:_destinyMetricDefinition forKey:kDeDestinyMetricDefinition];
    [aCoder encodeObject:_destinyRewardSheetDefinition forKey:kDeDestinyRewardSheetDefinition];
    [aCoder encodeObject:_destinyStatDefinition forKey:kDeDestinyStatDefinition];
    [aCoder encodeObject:_destinySackRewardItemListDefinition forKey:kDeDestinySackRewardItemListDefinition];
    [aCoder encodeObject:_destinyUnlockEventDefinition forKey:kDeDestinyUnlockEventDefinition];
    [aCoder encodeObject:_destinyMaterialRequirementSetDefinition forKey:kDeDestinyMaterialRequirementSetDefinition];
    [aCoder encodeObject:_destinyRaceDefinition forKey:kDeDestinyRaceDefinition];
    [aCoder encodeObject:_destinyClassDefinition forKey:kDeDestinyClassDefinition];
    [aCoder encodeObject:_destinyTalentGridDefinition forKey:kDeDestinyTalentGridDefinition];
    [aCoder encodeObject:_destinyUnlockDefinition forKey:kDeDestinyUnlockDefinition];
    [aCoder encodeObject:_destinyActivityTypeDefinition forKey:kDeDestinyActivityTypeDefinition];
    [aCoder encodeObject:_destinyEntitlementOfferDefinition forKey:kDeDestinyEntitlementOfferDefinition];
    [aCoder encodeObject:_destinyObjectiveDefinition forKey:kDeDestinyObjectiveDefinition];
    [aCoder encodeObject:_destinySocketCategoryDefinition forKey:kDeDestinySocketCategoryDefinition];
    [aCoder encodeObject:_destinyItemCategoryDefinition forKey:kDeDestinyItemCategoryDefinition];
    [aCoder encodeObject:_destinyArtifactDefinition forKey:kDeDestinyArtifactDefinition];
    [aCoder encodeObject:_destinyLocationDefinition forKey:kDeDestinyLocationDefinition];
    [aCoder encodeObject:_destinyChecklistDefinition forKey:kDeDestinyChecklistDefinition];
    [aCoder encodeObject:_destinySandboxPerkDefinition forKey:kDeDestinySandboxPerkDefinition];
    [aCoder encodeObject:_destinyPresentationNodeBaseDefinition forKey:kDeDestinyPresentationNodeBaseDefinition];
    [aCoder encodeObject:_destinyEnergyTypeDefinition forKey:kDeDestinyEnergyTypeDefinition];
    [aCoder encodeObject:_destinyActivityModeDefinition forKey:kDeDestinyActivityModeDefinition];
    [aCoder encodeObject:_destinyTraitCategoryDefinition forKey:kDeDestinyTraitCategoryDefinition];
    [aCoder encodeObject:_destinyArtDyeChannelDefinition forKey:kDeDestinyArtDyeChannelDefinition];
    [aCoder encodeObject:_destinyRewardItemListDefinition forKey:kDeDestinyRewardItemListDefinition];
}

- (id)copyWithZone:(NSZone *)zone
{
    De *copy = [[De alloc] init];
    
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
