//
//  Fr.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "Fr.h"


NSString *const kFrDestinyCharacterCustomizationOptionDefinition = @"DestinyCharacterCustomizationOptionDefinition";
NSString *const kFrDestinyProgressionDefinition = @"DestinyProgressionDefinition";
NSString *const kFrDestinyItemTierTypeDefinition = @"DestinyItemTierTypeDefinition";
NSString *const kFrDestinyActivityInteractableDefinition = @"DestinyActivityInteractableDefinition";
NSString *const kFrDestinyUnlockExpressionMappingDefinition = @"DestinyUnlockExpressionMappingDefinition";
NSString *const kFrDestinyEquipmentSlotDefinition = @"DestinyEquipmentSlotDefinition";
NSString *const kFrDestinyStatGroupDefinition = @"DestinyStatGroupDefinition";
NSString *const kFrDestinySeasonDefinition = @"DestinySeasonDefinition";
NSString *const kFrDestinyFactionDefinition = @"DestinyFactionDefinition";
NSString *const kFrDestinyUnlockValueDefinition = @"DestinyUnlockValueDefinition";
NSString *const kFrDestinyActivityDefinition = @"DestinyActivityDefinition";
NSString *const kFrDestinyEnemyRaceDefinition = @"DestinyEnemyRaceDefinition";
NSString *const kFrDestinySeasonPassDefinition = @"DestinySeasonPassDefinition";
NSString *const kFrDestinyVendorDefinition = @"DestinyVendorDefinition";
NSString *const kFrDestinyActivityGraphDefinition = @"DestinyActivityGraphDefinition";
NSString *const kFrDestinyProgressionMappingDefinition = @"DestinyProgressionMappingDefinition";
NSString *const kFrDestinyPlatformBucketMappingDefinition = @"DestinyPlatformBucketMappingDefinition";
NSString *const kFrDestinyAchievementDefinition = @"DestinyAchievementDefinition";
NSString *const kFrDestinyRewardAdjusterPointerDefinition = @"DestinyRewardAdjusterPointerDefinition";
NSString *const kFrDestinyRewardAdjusterProgressionMapDefinition = @"DestinyRewardAdjusterProgressionMapDefinition";
NSString *const kFrDestinyInventoryItemDefinition = @"DestinyInventoryItemDefinition";
NSString *const kFrDestinyPlaceDefinition = @"DestinyPlaceDefinition";
NSString *const kFrDestinyVendorGroupDefinition = @"DestinyVendorGroupDefinition";
NSString *const kFrDestinyTraitDefinition = @"DestinyTraitDefinition";
NSString *const kFrDestinyLoreDefinition = @"DestinyLoreDefinition";
NSString *const kFrDestinyDamageTypeDefinition = @"DestinyDamageTypeDefinition";
NSString *const kFrDestinyArtDyeReferenceDefinition = @"DestinyArtDyeReferenceDefinition";
NSString *const kFrDestinyMedalTierDefinition = @"DestinyMedalTierDefinition";
NSString *const kFrDestinyActivityModifierDefinition = @"DestinyActivityModifierDefinition";
NSString *const kFrDestinyInventoryBucketDefinition = @"DestinyInventoryBucketDefinition";
NSString *const kFrDestinyGenderDefinition = @"DestinyGenderDefinition";
NSString *const kFrDestinyBondDefinition = @"DestinyBondDefinition";
NSString *const kFrDestinyRecordDefinition = @"DestinyRecordDefinition";
NSString *const kFrDestinyRewardSourceDefinition = @"DestinyRewardSourceDefinition";
NSString *const kFrDestinyBreakerTypeDefinition = @"DestinyBreakerTypeDefinition";
NSString *const kFrDestinyCollectibleDefinition = @"DestinyCollectibleDefinition";
NSString *const kFrDestinyCharacterCustomizationCategoryDefinition = @"DestinyCharacterCustomizationCategoryDefinition";
NSString *const kFrDestinySandboxPatternDefinition = @"DestinySandboxPatternDefinition";
NSString *const kFrDestinyProgressionLevelRequirementDefinition = @"DestinyProgressionLevelRequirementDefinition";
NSString *const kFrDestinyRewardMappingDefinition = @"DestinyRewardMappingDefinition";
NSString *const kFrDestinyReportReasonCategoryDefinition = @"DestinyReportReasonCategoryDefinition";
NSString *const kFrDestinyPlugSetDefinition = @"DestinyPlugSetDefinition";
NSString *const kFrDestinyNodeStepSummaryDefinition = @"DestinyNodeStepSummaryDefinition";
NSString *const kFrDestinyUnlockCountMappingDefinition = @"DestinyUnlockCountMappingDefinition";
NSString *const kFrDestinySocketTypeDefinition = @"DestinySocketTypeDefinition";
NSString *const kFrDestinyMilestoneDefinition = @"DestinyMilestoneDefinition";
NSString *const kFrDestinyPresentationNodeDefinition = @"DestinyPresentationNodeDefinition";
NSString *const kFrDestinyPowerCapDefinition = @"DestinyPowerCapDefinition";
NSString *const kFrDestinyDestinationDefinition = @"DestinyDestinationDefinition";
NSString *const kFrDestinyInventoryItemLiteDefinition = @"DestinyInventoryItemLiteDefinition";
NSString *const kFrDestinyMetricDefinition = @"DestinyMetricDefinition";
NSString *const kFrDestinyRewardSheetDefinition = @"DestinyRewardSheetDefinition";
NSString *const kFrDestinyStatDefinition = @"DestinyStatDefinition";
NSString *const kFrDestinySackRewardItemListDefinition = @"DestinySackRewardItemListDefinition";
NSString *const kFrDestinyUnlockEventDefinition = @"DestinyUnlockEventDefinition";
NSString *const kFrDestinyMaterialRequirementSetDefinition = @"DestinyMaterialRequirementSetDefinition";
NSString *const kFrDestinyRaceDefinition = @"DestinyRaceDefinition";
NSString *const kFrDestinyClassDefinition = @"DestinyClassDefinition";
NSString *const kFrDestinyTalentGridDefinition = @"DestinyTalentGridDefinition";
NSString *const kFrDestinyUnlockDefinition = @"DestinyUnlockDefinition";
NSString *const kFrDestinyActivityTypeDefinition = @"DestinyActivityTypeDefinition";
NSString *const kFrDestinyEntitlementOfferDefinition = @"DestinyEntitlementOfferDefinition";
NSString *const kFrDestinyObjectiveDefinition = @"DestinyObjectiveDefinition";
NSString *const kFrDestinySocketCategoryDefinition = @"DestinySocketCategoryDefinition";
NSString *const kFrDestinyItemCategoryDefinition = @"DestinyItemCategoryDefinition";
NSString *const kFrDestinyArtifactDefinition = @"DestinyArtifactDefinition";
NSString *const kFrDestinyLocationDefinition = @"DestinyLocationDefinition";
NSString *const kFrDestinyChecklistDefinition = @"DestinyChecklistDefinition";
NSString *const kFrDestinySandboxPerkDefinition = @"DestinySandboxPerkDefinition";
NSString *const kFrDestinyPresentationNodeBaseDefinition = @"DestinyPresentationNodeBaseDefinition";
NSString *const kFrDestinyEnergyTypeDefinition = @"DestinyEnergyTypeDefinition";
NSString *const kFrDestinyActivityModeDefinition = @"DestinyActivityModeDefinition";
NSString *const kFrDestinyTraitCategoryDefinition = @"DestinyTraitCategoryDefinition";
NSString *const kFrDestinyArtDyeChannelDefinition = @"DestinyArtDyeChannelDefinition";
NSString *const kFrDestinyRewardItemListDefinition = @"DestinyRewardItemListDefinition";


@interface Fr ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Fr

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
            self.destinyCharacterCustomizationOptionDefinition = [self objectOrNilForKey:kFrDestinyCharacterCustomizationOptionDefinition fromDictionary:dict];
            self.destinyProgressionDefinition = [self objectOrNilForKey:kFrDestinyProgressionDefinition fromDictionary:dict];
            self.destinyItemTierTypeDefinition = [self objectOrNilForKey:kFrDestinyItemTierTypeDefinition fromDictionary:dict];
            self.destinyActivityInteractableDefinition = [self objectOrNilForKey:kFrDestinyActivityInteractableDefinition fromDictionary:dict];
            self.destinyUnlockExpressionMappingDefinition = [self objectOrNilForKey:kFrDestinyUnlockExpressionMappingDefinition fromDictionary:dict];
            self.destinyEquipmentSlotDefinition = [self objectOrNilForKey:kFrDestinyEquipmentSlotDefinition fromDictionary:dict];
            self.destinyStatGroupDefinition = [self objectOrNilForKey:kFrDestinyStatGroupDefinition fromDictionary:dict];
            self.destinySeasonDefinition = [self objectOrNilForKey:kFrDestinySeasonDefinition fromDictionary:dict];
            self.destinyFactionDefinition = [self objectOrNilForKey:kFrDestinyFactionDefinition fromDictionary:dict];
            self.destinyUnlockValueDefinition = [self objectOrNilForKey:kFrDestinyUnlockValueDefinition fromDictionary:dict];
            self.destinyActivityDefinition = [self objectOrNilForKey:kFrDestinyActivityDefinition fromDictionary:dict];
            self.destinyEnemyRaceDefinition = [self objectOrNilForKey:kFrDestinyEnemyRaceDefinition fromDictionary:dict];
            self.destinySeasonPassDefinition = [self objectOrNilForKey:kFrDestinySeasonPassDefinition fromDictionary:dict];
            self.destinyVendorDefinition = [self objectOrNilForKey:kFrDestinyVendorDefinition fromDictionary:dict];
            self.destinyActivityGraphDefinition = [self objectOrNilForKey:kFrDestinyActivityGraphDefinition fromDictionary:dict];
            self.destinyProgressionMappingDefinition = [self objectOrNilForKey:kFrDestinyProgressionMappingDefinition fromDictionary:dict];
            self.destinyPlatformBucketMappingDefinition = [self objectOrNilForKey:kFrDestinyPlatformBucketMappingDefinition fromDictionary:dict];
            self.destinyAchievementDefinition = [self objectOrNilForKey:kFrDestinyAchievementDefinition fromDictionary:dict];
            self.destinyRewardAdjusterPointerDefinition = [self objectOrNilForKey:kFrDestinyRewardAdjusterPointerDefinition fromDictionary:dict];
            self.destinyRewardAdjusterProgressionMapDefinition = [self objectOrNilForKey:kFrDestinyRewardAdjusterProgressionMapDefinition fromDictionary:dict];
            self.destinyInventoryItemDefinition = [self objectOrNilForKey:kFrDestinyInventoryItemDefinition fromDictionary:dict];
            self.destinyPlaceDefinition = [self objectOrNilForKey:kFrDestinyPlaceDefinition fromDictionary:dict];
            self.destinyVendorGroupDefinition = [self objectOrNilForKey:kFrDestinyVendorGroupDefinition fromDictionary:dict];
            self.destinyTraitDefinition = [self objectOrNilForKey:kFrDestinyTraitDefinition fromDictionary:dict];
            self.destinyLoreDefinition = [self objectOrNilForKey:kFrDestinyLoreDefinition fromDictionary:dict];
            self.destinyDamageTypeDefinition = [self objectOrNilForKey:kFrDestinyDamageTypeDefinition fromDictionary:dict];
            self.destinyArtDyeReferenceDefinition = [self objectOrNilForKey:kFrDestinyArtDyeReferenceDefinition fromDictionary:dict];
            self.destinyMedalTierDefinition = [self objectOrNilForKey:kFrDestinyMedalTierDefinition fromDictionary:dict];
            self.destinyActivityModifierDefinition = [self objectOrNilForKey:kFrDestinyActivityModifierDefinition fromDictionary:dict];
            self.destinyInventoryBucketDefinition = [self objectOrNilForKey:kFrDestinyInventoryBucketDefinition fromDictionary:dict];
            self.destinyGenderDefinition = [self objectOrNilForKey:kFrDestinyGenderDefinition fromDictionary:dict];
            self.destinyBondDefinition = [self objectOrNilForKey:kFrDestinyBondDefinition fromDictionary:dict];
            self.destinyRecordDefinition = [self objectOrNilForKey:kFrDestinyRecordDefinition fromDictionary:dict];
            self.destinyRewardSourceDefinition = [self objectOrNilForKey:kFrDestinyRewardSourceDefinition fromDictionary:dict];
            self.destinyBreakerTypeDefinition = [self objectOrNilForKey:kFrDestinyBreakerTypeDefinition fromDictionary:dict];
            self.destinyCollectibleDefinition = [self objectOrNilForKey:kFrDestinyCollectibleDefinition fromDictionary:dict];
            self.destinyCharacterCustomizationCategoryDefinition = [self objectOrNilForKey:kFrDestinyCharacterCustomizationCategoryDefinition fromDictionary:dict];
            self.destinySandboxPatternDefinition = [self objectOrNilForKey:kFrDestinySandboxPatternDefinition fromDictionary:dict];
            self.destinyProgressionLevelRequirementDefinition = [self objectOrNilForKey:kFrDestinyProgressionLevelRequirementDefinition fromDictionary:dict];
            self.destinyRewardMappingDefinition = [self objectOrNilForKey:kFrDestinyRewardMappingDefinition fromDictionary:dict];
            self.destinyReportReasonCategoryDefinition = [self objectOrNilForKey:kFrDestinyReportReasonCategoryDefinition fromDictionary:dict];
            self.destinyPlugSetDefinition = [self objectOrNilForKey:kFrDestinyPlugSetDefinition fromDictionary:dict];
            self.destinyNodeStepSummaryDefinition = [self objectOrNilForKey:kFrDestinyNodeStepSummaryDefinition fromDictionary:dict];
            self.destinyUnlockCountMappingDefinition = [self objectOrNilForKey:kFrDestinyUnlockCountMappingDefinition fromDictionary:dict];
            self.destinySocketTypeDefinition = [self objectOrNilForKey:kFrDestinySocketTypeDefinition fromDictionary:dict];
            self.destinyMilestoneDefinition = [self objectOrNilForKey:kFrDestinyMilestoneDefinition fromDictionary:dict];
            self.destinyPresentationNodeDefinition = [self objectOrNilForKey:kFrDestinyPresentationNodeDefinition fromDictionary:dict];
            self.destinyPowerCapDefinition = [self objectOrNilForKey:kFrDestinyPowerCapDefinition fromDictionary:dict];
            self.destinyDestinationDefinition = [self objectOrNilForKey:kFrDestinyDestinationDefinition fromDictionary:dict];
            self.destinyInventoryItemLiteDefinition = [self objectOrNilForKey:kFrDestinyInventoryItemLiteDefinition fromDictionary:dict];
            self.destinyMetricDefinition = [self objectOrNilForKey:kFrDestinyMetricDefinition fromDictionary:dict];
            self.destinyRewardSheetDefinition = [self objectOrNilForKey:kFrDestinyRewardSheetDefinition fromDictionary:dict];
            self.destinyStatDefinition = [self objectOrNilForKey:kFrDestinyStatDefinition fromDictionary:dict];
            self.destinySackRewardItemListDefinition = [self objectOrNilForKey:kFrDestinySackRewardItemListDefinition fromDictionary:dict];
            self.destinyUnlockEventDefinition = [self objectOrNilForKey:kFrDestinyUnlockEventDefinition fromDictionary:dict];
            self.destinyMaterialRequirementSetDefinition = [self objectOrNilForKey:kFrDestinyMaterialRequirementSetDefinition fromDictionary:dict];
            self.destinyRaceDefinition = [self objectOrNilForKey:kFrDestinyRaceDefinition fromDictionary:dict];
            self.destinyClassDefinition = [self objectOrNilForKey:kFrDestinyClassDefinition fromDictionary:dict];
            self.destinyTalentGridDefinition = [self objectOrNilForKey:kFrDestinyTalentGridDefinition fromDictionary:dict];
            self.destinyUnlockDefinition = [self objectOrNilForKey:kFrDestinyUnlockDefinition fromDictionary:dict];
            self.destinyActivityTypeDefinition = [self objectOrNilForKey:kFrDestinyActivityTypeDefinition fromDictionary:dict];
            self.destinyEntitlementOfferDefinition = [self objectOrNilForKey:kFrDestinyEntitlementOfferDefinition fromDictionary:dict];
            self.destinyObjectiveDefinition = [self objectOrNilForKey:kFrDestinyObjectiveDefinition fromDictionary:dict];
            self.destinySocketCategoryDefinition = [self objectOrNilForKey:kFrDestinySocketCategoryDefinition fromDictionary:dict];
            self.destinyItemCategoryDefinition = [self objectOrNilForKey:kFrDestinyItemCategoryDefinition fromDictionary:dict];
            self.destinyArtifactDefinition = [self objectOrNilForKey:kFrDestinyArtifactDefinition fromDictionary:dict];
            self.destinyLocationDefinition = [self objectOrNilForKey:kFrDestinyLocationDefinition fromDictionary:dict];
            self.destinyChecklistDefinition = [self objectOrNilForKey:kFrDestinyChecklistDefinition fromDictionary:dict];
            self.destinySandboxPerkDefinition = [self objectOrNilForKey:kFrDestinySandboxPerkDefinition fromDictionary:dict];
            self.destinyPresentationNodeBaseDefinition = [self objectOrNilForKey:kFrDestinyPresentationNodeBaseDefinition fromDictionary:dict];
            self.destinyEnergyTypeDefinition = [self objectOrNilForKey:kFrDestinyEnergyTypeDefinition fromDictionary:dict];
            self.destinyActivityModeDefinition = [self objectOrNilForKey:kFrDestinyActivityModeDefinition fromDictionary:dict];
            self.destinyTraitCategoryDefinition = [self objectOrNilForKey:kFrDestinyTraitCategoryDefinition fromDictionary:dict];
            self.destinyArtDyeChannelDefinition = [self objectOrNilForKey:kFrDestinyArtDyeChannelDefinition fromDictionary:dict];
            self.destinyRewardItemListDefinition = [self objectOrNilForKey:kFrDestinyRewardItemListDefinition fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.destinyCharacterCustomizationOptionDefinition forKey:kFrDestinyCharacterCustomizationOptionDefinition];
    [mutableDict setValue:self.destinyProgressionDefinition forKey:kFrDestinyProgressionDefinition];
    [mutableDict setValue:self.destinyItemTierTypeDefinition forKey:kFrDestinyItemTierTypeDefinition];
    [mutableDict setValue:self.destinyActivityInteractableDefinition forKey:kFrDestinyActivityInteractableDefinition];
    [mutableDict setValue:self.destinyUnlockExpressionMappingDefinition forKey:kFrDestinyUnlockExpressionMappingDefinition];
    [mutableDict setValue:self.destinyEquipmentSlotDefinition forKey:kFrDestinyEquipmentSlotDefinition];
    [mutableDict setValue:self.destinyStatGroupDefinition forKey:kFrDestinyStatGroupDefinition];
    [mutableDict setValue:self.destinySeasonDefinition forKey:kFrDestinySeasonDefinition];
    [mutableDict setValue:self.destinyFactionDefinition forKey:kFrDestinyFactionDefinition];
    [mutableDict setValue:self.destinyUnlockValueDefinition forKey:kFrDestinyUnlockValueDefinition];
    [mutableDict setValue:self.destinyActivityDefinition forKey:kFrDestinyActivityDefinition];
    [mutableDict setValue:self.destinyEnemyRaceDefinition forKey:kFrDestinyEnemyRaceDefinition];
    [mutableDict setValue:self.destinySeasonPassDefinition forKey:kFrDestinySeasonPassDefinition];
    [mutableDict setValue:self.destinyVendorDefinition forKey:kFrDestinyVendorDefinition];
    [mutableDict setValue:self.destinyActivityGraphDefinition forKey:kFrDestinyActivityGraphDefinition];
    [mutableDict setValue:self.destinyProgressionMappingDefinition forKey:kFrDestinyProgressionMappingDefinition];
    [mutableDict setValue:self.destinyPlatformBucketMappingDefinition forKey:kFrDestinyPlatformBucketMappingDefinition];
    [mutableDict setValue:self.destinyAchievementDefinition forKey:kFrDestinyAchievementDefinition];
    [mutableDict setValue:self.destinyRewardAdjusterPointerDefinition forKey:kFrDestinyRewardAdjusterPointerDefinition];
    [mutableDict setValue:self.destinyRewardAdjusterProgressionMapDefinition forKey:kFrDestinyRewardAdjusterProgressionMapDefinition];
    [mutableDict setValue:self.destinyInventoryItemDefinition forKey:kFrDestinyInventoryItemDefinition];
    [mutableDict setValue:self.destinyPlaceDefinition forKey:kFrDestinyPlaceDefinition];
    [mutableDict setValue:self.destinyVendorGroupDefinition forKey:kFrDestinyVendorGroupDefinition];
    [mutableDict setValue:self.destinyTraitDefinition forKey:kFrDestinyTraitDefinition];
    [mutableDict setValue:self.destinyLoreDefinition forKey:kFrDestinyLoreDefinition];
    [mutableDict setValue:self.destinyDamageTypeDefinition forKey:kFrDestinyDamageTypeDefinition];
    [mutableDict setValue:self.destinyArtDyeReferenceDefinition forKey:kFrDestinyArtDyeReferenceDefinition];
    [mutableDict setValue:self.destinyMedalTierDefinition forKey:kFrDestinyMedalTierDefinition];
    [mutableDict setValue:self.destinyActivityModifierDefinition forKey:kFrDestinyActivityModifierDefinition];
    [mutableDict setValue:self.destinyInventoryBucketDefinition forKey:kFrDestinyInventoryBucketDefinition];
    [mutableDict setValue:self.destinyGenderDefinition forKey:kFrDestinyGenderDefinition];
    [mutableDict setValue:self.destinyBondDefinition forKey:kFrDestinyBondDefinition];
    [mutableDict setValue:self.destinyRecordDefinition forKey:kFrDestinyRecordDefinition];
    [mutableDict setValue:self.destinyRewardSourceDefinition forKey:kFrDestinyRewardSourceDefinition];
    [mutableDict setValue:self.destinyBreakerTypeDefinition forKey:kFrDestinyBreakerTypeDefinition];
    [mutableDict setValue:self.destinyCollectibleDefinition forKey:kFrDestinyCollectibleDefinition];
    [mutableDict setValue:self.destinyCharacterCustomizationCategoryDefinition forKey:kFrDestinyCharacterCustomizationCategoryDefinition];
    [mutableDict setValue:self.destinySandboxPatternDefinition forKey:kFrDestinySandboxPatternDefinition];
    [mutableDict setValue:self.destinyProgressionLevelRequirementDefinition forKey:kFrDestinyProgressionLevelRequirementDefinition];
    [mutableDict setValue:self.destinyRewardMappingDefinition forKey:kFrDestinyRewardMappingDefinition];
    [mutableDict setValue:self.destinyReportReasonCategoryDefinition forKey:kFrDestinyReportReasonCategoryDefinition];
    [mutableDict setValue:self.destinyPlugSetDefinition forKey:kFrDestinyPlugSetDefinition];
    [mutableDict setValue:self.destinyNodeStepSummaryDefinition forKey:kFrDestinyNodeStepSummaryDefinition];
    [mutableDict setValue:self.destinyUnlockCountMappingDefinition forKey:kFrDestinyUnlockCountMappingDefinition];
    [mutableDict setValue:self.destinySocketTypeDefinition forKey:kFrDestinySocketTypeDefinition];
    [mutableDict setValue:self.destinyMilestoneDefinition forKey:kFrDestinyMilestoneDefinition];
    [mutableDict setValue:self.destinyPresentationNodeDefinition forKey:kFrDestinyPresentationNodeDefinition];
    [mutableDict setValue:self.destinyPowerCapDefinition forKey:kFrDestinyPowerCapDefinition];
    [mutableDict setValue:self.destinyDestinationDefinition forKey:kFrDestinyDestinationDefinition];
    [mutableDict setValue:self.destinyInventoryItemLiteDefinition forKey:kFrDestinyInventoryItemLiteDefinition];
    [mutableDict setValue:self.destinyMetricDefinition forKey:kFrDestinyMetricDefinition];
    [mutableDict setValue:self.destinyRewardSheetDefinition forKey:kFrDestinyRewardSheetDefinition];
    [mutableDict setValue:self.destinyStatDefinition forKey:kFrDestinyStatDefinition];
    [mutableDict setValue:self.destinySackRewardItemListDefinition forKey:kFrDestinySackRewardItemListDefinition];
    [mutableDict setValue:self.destinyUnlockEventDefinition forKey:kFrDestinyUnlockEventDefinition];
    [mutableDict setValue:self.destinyMaterialRequirementSetDefinition forKey:kFrDestinyMaterialRequirementSetDefinition];
    [mutableDict setValue:self.destinyRaceDefinition forKey:kFrDestinyRaceDefinition];
    [mutableDict setValue:self.destinyClassDefinition forKey:kFrDestinyClassDefinition];
    [mutableDict setValue:self.destinyTalentGridDefinition forKey:kFrDestinyTalentGridDefinition];
    [mutableDict setValue:self.destinyUnlockDefinition forKey:kFrDestinyUnlockDefinition];
    [mutableDict setValue:self.destinyActivityTypeDefinition forKey:kFrDestinyActivityTypeDefinition];
    [mutableDict setValue:self.destinyEntitlementOfferDefinition forKey:kFrDestinyEntitlementOfferDefinition];
    [mutableDict setValue:self.destinyObjectiveDefinition forKey:kFrDestinyObjectiveDefinition];
    [mutableDict setValue:self.destinySocketCategoryDefinition forKey:kFrDestinySocketCategoryDefinition];
    [mutableDict setValue:self.destinyItemCategoryDefinition forKey:kFrDestinyItemCategoryDefinition];
    [mutableDict setValue:self.destinyArtifactDefinition forKey:kFrDestinyArtifactDefinition];
    [mutableDict setValue:self.destinyLocationDefinition forKey:kFrDestinyLocationDefinition];
    [mutableDict setValue:self.destinyChecklistDefinition forKey:kFrDestinyChecklistDefinition];
    [mutableDict setValue:self.destinySandboxPerkDefinition forKey:kFrDestinySandboxPerkDefinition];
    [mutableDict setValue:self.destinyPresentationNodeBaseDefinition forKey:kFrDestinyPresentationNodeBaseDefinition];
    [mutableDict setValue:self.destinyEnergyTypeDefinition forKey:kFrDestinyEnergyTypeDefinition];
    [mutableDict setValue:self.destinyActivityModeDefinition forKey:kFrDestinyActivityModeDefinition];
    [mutableDict setValue:self.destinyTraitCategoryDefinition forKey:kFrDestinyTraitCategoryDefinition];
    [mutableDict setValue:self.destinyArtDyeChannelDefinition forKey:kFrDestinyArtDyeChannelDefinition];
    [mutableDict setValue:self.destinyRewardItemListDefinition forKey:kFrDestinyRewardItemListDefinition];

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

    self.destinyCharacterCustomizationOptionDefinition = [aDecoder decodeObjectForKey:kFrDestinyCharacterCustomizationOptionDefinition];
    self.destinyProgressionDefinition = [aDecoder decodeObjectForKey:kFrDestinyProgressionDefinition];
    self.destinyItemTierTypeDefinition = [aDecoder decodeObjectForKey:kFrDestinyItemTierTypeDefinition];
    self.destinyActivityInteractableDefinition = [aDecoder decodeObjectForKey:kFrDestinyActivityInteractableDefinition];
    self.destinyUnlockExpressionMappingDefinition = [aDecoder decodeObjectForKey:kFrDestinyUnlockExpressionMappingDefinition];
    self.destinyEquipmentSlotDefinition = [aDecoder decodeObjectForKey:kFrDestinyEquipmentSlotDefinition];
    self.destinyStatGroupDefinition = [aDecoder decodeObjectForKey:kFrDestinyStatGroupDefinition];
    self.destinySeasonDefinition = [aDecoder decodeObjectForKey:kFrDestinySeasonDefinition];
    self.destinyFactionDefinition = [aDecoder decodeObjectForKey:kFrDestinyFactionDefinition];
    self.destinyUnlockValueDefinition = [aDecoder decodeObjectForKey:kFrDestinyUnlockValueDefinition];
    self.destinyActivityDefinition = [aDecoder decodeObjectForKey:kFrDestinyActivityDefinition];
    self.destinyEnemyRaceDefinition = [aDecoder decodeObjectForKey:kFrDestinyEnemyRaceDefinition];
    self.destinySeasonPassDefinition = [aDecoder decodeObjectForKey:kFrDestinySeasonPassDefinition];
    self.destinyVendorDefinition = [aDecoder decodeObjectForKey:kFrDestinyVendorDefinition];
    self.destinyActivityGraphDefinition = [aDecoder decodeObjectForKey:kFrDestinyActivityGraphDefinition];
    self.destinyProgressionMappingDefinition = [aDecoder decodeObjectForKey:kFrDestinyProgressionMappingDefinition];
    self.destinyPlatformBucketMappingDefinition = [aDecoder decodeObjectForKey:kFrDestinyPlatformBucketMappingDefinition];
    self.destinyAchievementDefinition = [aDecoder decodeObjectForKey:kFrDestinyAchievementDefinition];
    self.destinyRewardAdjusterPointerDefinition = [aDecoder decodeObjectForKey:kFrDestinyRewardAdjusterPointerDefinition];
    self.destinyRewardAdjusterProgressionMapDefinition = [aDecoder decodeObjectForKey:kFrDestinyRewardAdjusterProgressionMapDefinition];
    self.destinyInventoryItemDefinition = [aDecoder decodeObjectForKey:kFrDestinyInventoryItemDefinition];
    self.destinyPlaceDefinition = [aDecoder decodeObjectForKey:kFrDestinyPlaceDefinition];
    self.destinyVendorGroupDefinition = [aDecoder decodeObjectForKey:kFrDestinyVendorGroupDefinition];
    self.destinyTraitDefinition = [aDecoder decodeObjectForKey:kFrDestinyTraitDefinition];
    self.destinyLoreDefinition = [aDecoder decodeObjectForKey:kFrDestinyLoreDefinition];
    self.destinyDamageTypeDefinition = [aDecoder decodeObjectForKey:kFrDestinyDamageTypeDefinition];
    self.destinyArtDyeReferenceDefinition = [aDecoder decodeObjectForKey:kFrDestinyArtDyeReferenceDefinition];
    self.destinyMedalTierDefinition = [aDecoder decodeObjectForKey:kFrDestinyMedalTierDefinition];
    self.destinyActivityModifierDefinition = [aDecoder decodeObjectForKey:kFrDestinyActivityModifierDefinition];
    self.destinyInventoryBucketDefinition = [aDecoder decodeObjectForKey:kFrDestinyInventoryBucketDefinition];
    self.destinyGenderDefinition = [aDecoder decodeObjectForKey:kFrDestinyGenderDefinition];
    self.destinyBondDefinition = [aDecoder decodeObjectForKey:kFrDestinyBondDefinition];
    self.destinyRecordDefinition = [aDecoder decodeObjectForKey:kFrDestinyRecordDefinition];
    self.destinyRewardSourceDefinition = [aDecoder decodeObjectForKey:kFrDestinyRewardSourceDefinition];
    self.destinyBreakerTypeDefinition = [aDecoder decodeObjectForKey:kFrDestinyBreakerTypeDefinition];
    self.destinyCollectibleDefinition = [aDecoder decodeObjectForKey:kFrDestinyCollectibleDefinition];
    self.destinyCharacterCustomizationCategoryDefinition = [aDecoder decodeObjectForKey:kFrDestinyCharacterCustomizationCategoryDefinition];
    self.destinySandboxPatternDefinition = [aDecoder decodeObjectForKey:kFrDestinySandboxPatternDefinition];
    self.destinyProgressionLevelRequirementDefinition = [aDecoder decodeObjectForKey:kFrDestinyProgressionLevelRequirementDefinition];
    self.destinyRewardMappingDefinition = [aDecoder decodeObjectForKey:kFrDestinyRewardMappingDefinition];
    self.destinyReportReasonCategoryDefinition = [aDecoder decodeObjectForKey:kFrDestinyReportReasonCategoryDefinition];
    self.destinyPlugSetDefinition = [aDecoder decodeObjectForKey:kFrDestinyPlugSetDefinition];
    self.destinyNodeStepSummaryDefinition = [aDecoder decodeObjectForKey:kFrDestinyNodeStepSummaryDefinition];
    self.destinyUnlockCountMappingDefinition = [aDecoder decodeObjectForKey:kFrDestinyUnlockCountMappingDefinition];
    self.destinySocketTypeDefinition = [aDecoder decodeObjectForKey:kFrDestinySocketTypeDefinition];
    self.destinyMilestoneDefinition = [aDecoder decodeObjectForKey:kFrDestinyMilestoneDefinition];
    self.destinyPresentationNodeDefinition = [aDecoder decodeObjectForKey:kFrDestinyPresentationNodeDefinition];
    self.destinyPowerCapDefinition = [aDecoder decodeObjectForKey:kFrDestinyPowerCapDefinition];
    self.destinyDestinationDefinition = [aDecoder decodeObjectForKey:kFrDestinyDestinationDefinition];
    self.destinyInventoryItemLiteDefinition = [aDecoder decodeObjectForKey:kFrDestinyInventoryItemLiteDefinition];
    self.destinyMetricDefinition = [aDecoder decodeObjectForKey:kFrDestinyMetricDefinition];
    self.destinyRewardSheetDefinition = [aDecoder decodeObjectForKey:kFrDestinyRewardSheetDefinition];
    self.destinyStatDefinition = [aDecoder decodeObjectForKey:kFrDestinyStatDefinition];
    self.destinySackRewardItemListDefinition = [aDecoder decodeObjectForKey:kFrDestinySackRewardItemListDefinition];
    self.destinyUnlockEventDefinition = [aDecoder decodeObjectForKey:kFrDestinyUnlockEventDefinition];
    self.destinyMaterialRequirementSetDefinition = [aDecoder decodeObjectForKey:kFrDestinyMaterialRequirementSetDefinition];
    self.destinyRaceDefinition = [aDecoder decodeObjectForKey:kFrDestinyRaceDefinition];
    self.destinyClassDefinition = [aDecoder decodeObjectForKey:kFrDestinyClassDefinition];
    self.destinyTalentGridDefinition = [aDecoder decodeObjectForKey:kFrDestinyTalentGridDefinition];
    self.destinyUnlockDefinition = [aDecoder decodeObjectForKey:kFrDestinyUnlockDefinition];
    self.destinyActivityTypeDefinition = [aDecoder decodeObjectForKey:kFrDestinyActivityTypeDefinition];
    self.destinyEntitlementOfferDefinition = [aDecoder decodeObjectForKey:kFrDestinyEntitlementOfferDefinition];
    self.destinyObjectiveDefinition = [aDecoder decodeObjectForKey:kFrDestinyObjectiveDefinition];
    self.destinySocketCategoryDefinition = [aDecoder decodeObjectForKey:kFrDestinySocketCategoryDefinition];
    self.destinyItemCategoryDefinition = [aDecoder decodeObjectForKey:kFrDestinyItemCategoryDefinition];
    self.destinyArtifactDefinition = [aDecoder decodeObjectForKey:kFrDestinyArtifactDefinition];
    self.destinyLocationDefinition = [aDecoder decodeObjectForKey:kFrDestinyLocationDefinition];
    self.destinyChecklistDefinition = [aDecoder decodeObjectForKey:kFrDestinyChecklistDefinition];
    self.destinySandboxPerkDefinition = [aDecoder decodeObjectForKey:kFrDestinySandboxPerkDefinition];
    self.destinyPresentationNodeBaseDefinition = [aDecoder decodeObjectForKey:kFrDestinyPresentationNodeBaseDefinition];
    self.destinyEnergyTypeDefinition = [aDecoder decodeObjectForKey:kFrDestinyEnergyTypeDefinition];
    self.destinyActivityModeDefinition = [aDecoder decodeObjectForKey:kFrDestinyActivityModeDefinition];
    self.destinyTraitCategoryDefinition = [aDecoder decodeObjectForKey:kFrDestinyTraitCategoryDefinition];
    self.destinyArtDyeChannelDefinition = [aDecoder decodeObjectForKey:kFrDestinyArtDyeChannelDefinition];
    self.destinyRewardItemListDefinition = [aDecoder decodeObjectForKey:kFrDestinyRewardItemListDefinition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_destinyCharacterCustomizationOptionDefinition forKey:kFrDestinyCharacterCustomizationOptionDefinition];
    [aCoder encodeObject:_destinyProgressionDefinition forKey:kFrDestinyProgressionDefinition];
    [aCoder encodeObject:_destinyItemTierTypeDefinition forKey:kFrDestinyItemTierTypeDefinition];
    [aCoder encodeObject:_destinyActivityInteractableDefinition forKey:kFrDestinyActivityInteractableDefinition];
    [aCoder encodeObject:_destinyUnlockExpressionMappingDefinition forKey:kFrDestinyUnlockExpressionMappingDefinition];
    [aCoder encodeObject:_destinyEquipmentSlotDefinition forKey:kFrDestinyEquipmentSlotDefinition];
    [aCoder encodeObject:_destinyStatGroupDefinition forKey:kFrDestinyStatGroupDefinition];
    [aCoder encodeObject:_destinySeasonDefinition forKey:kFrDestinySeasonDefinition];
    [aCoder encodeObject:_destinyFactionDefinition forKey:kFrDestinyFactionDefinition];
    [aCoder encodeObject:_destinyUnlockValueDefinition forKey:kFrDestinyUnlockValueDefinition];
    [aCoder encodeObject:_destinyActivityDefinition forKey:kFrDestinyActivityDefinition];
    [aCoder encodeObject:_destinyEnemyRaceDefinition forKey:kFrDestinyEnemyRaceDefinition];
    [aCoder encodeObject:_destinySeasonPassDefinition forKey:kFrDestinySeasonPassDefinition];
    [aCoder encodeObject:_destinyVendorDefinition forKey:kFrDestinyVendorDefinition];
    [aCoder encodeObject:_destinyActivityGraphDefinition forKey:kFrDestinyActivityGraphDefinition];
    [aCoder encodeObject:_destinyProgressionMappingDefinition forKey:kFrDestinyProgressionMappingDefinition];
    [aCoder encodeObject:_destinyPlatformBucketMappingDefinition forKey:kFrDestinyPlatformBucketMappingDefinition];
    [aCoder encodeObject:_destinyAchievementDefinition forKey:kFrDestinyAchievementDefinition];
    [aCoder encodeObject:_destinyRewardAdjusterPointerDefinition forKey:kFrDestinyRewardAdjusterPointerDefinition];
    [aCoder encodeObject:_destinyRewardAdjusterProgressionMapDefinition forKey:kFrDestinyRewardAdjusterProgressionMapDefinition];
    [aCoder encodeObject:_destinyInventoryItemDefinition forKey:kFrDestinyInventoryItemDefinition];
    [aCoder encodeObject:_destinyPlaceDefinition forKey:kFrDestinyPlaceDefinition];
    [aCoder encodeObject:_destinyVendorGroupDefinition forKey:kFrDestinyVendorGroupDefinition];
    [aCoder encodeObject:_destinyTraitDefinition forKey:kFrDestinyTraitDefinition];
    [aCoder encodeObject:_destinyLoreDefinition forKey:kFrDestinyLoreDefinition];
    [aCoder encodeObject:_destinyDamageTypeDefinition forKey:kFrDestinyDamageTypeDefinition];
    [aCoder encodeObject:_destinyArtDyeReferenceDefinition forKey:kFrDestinyArtDyeReferenceDefinition];
    [aCoder encodeObject:_destinyMedalTierDefinition forKey:kFrDestinyMedalTierDefinition];
    [aCoder encodeObject:_destinyActivityModifierDefinition forKey:kFrDestinyActivityModifierDefinition];
    [aCoder encodeObject:_destinyInventoryBucketDefinition forKey:kFrDestinyInventoryBucketDefinition];
    [aCoder encodeObject:_destinyGenderDefinition forKey:kFrDestinyGenderDefinition];
    [aCoder encodeObject:_destinyBondDefinition forKey:kFrDestinyBondDefinition];
    [aCoder encodeObject:_destinyRecordDefinition forKey:kFrDestinyRecordDefinition];
    [aCoder encodeObject:_destinyRewardSourceDefinition forKey:kFrDestinyRewardSourceDefinition];
    [aCoder encodeObject:_destinyBreakerTypeDefinition forKey:kFrDestinyBreakerTypeDefinition];
    [aCoder encodeObject:_destinyCollectibleDefinition forKey:kFrDestinyCollectibleDefinition];
    [aCoder encodeObject:_destinyCharacterCustomizationCategoryDefinition forKey:kFrDestinyCharacterCustomizationCategoryDefinition];
    [aCoder encodeObject:_destinySandboxPatternDefinition forKey:kFrDestinySandboxPatternDefinition];
    [aCoder encodeObject:_destinyProgressionLevelRequirementDefinition forKey:kFrDestinyProgressionLevelRequirementDefinition];
    [aCoder encodeObject:_destinyRewardMappingDefinition forKey:kFrDestinyRewardMappingDefinition];
    [aCoder encodeObject:_destinyReportReasonCategoryDefinition forKey:kFrDestinyReportReasonCategoryDefinition];
    [aCoder encodeObject:_destinyPlugSetDefinition forKey:kFrDestinyPlugSetDefinition];
    [aCoder encodeObject:_destinyNodeStepSummaryDefinition forKey:kFrDestinyNodeStepSummaryDefinition];
    [aCoder encodeObject:_destinyUnlockCountMappingDefinition forKey:kFrDestinyUnlockCountMappingDefinition];
    [aCoder encodeObject:_destinySocketTypeDefinition forKey:kFrDestinySocketTypeDefinition];
    [aCoder encodeObject:_destinyMilestoneDefinition forKey:kFrDestinyMilestoneDefinition];
    [aCoder encodeObject:_destinyPresentationNodeDefinition forKey:kFrDestinyPresentationNodeDefinition];
    [aCoder encodeObject:_destinyPowerCapDefinition forKey:kFrDestinyPowerCapDefinition];
    [aCoder encodeObject:_destinyDestinationDefinition forKey:kFrDestinyDestinationDefinition];
    [aCoder encodeObject:_destinyInventoryItemLiteDefinition forKey:kFrDestinyInventoryItemLiteDefinition];
    [aCoder encodeObject:_destinyMetricDefinition forKey:kFrDestinyMetricDefinition];
    [aCoder encodeObject:_destinyRewardSheetDefinition forKey:kFrDestinyRewardSheetDefinition];
    [aCoder encodeObject:_destinyStatDefinition forKey:kFrDestinyStatDefinition];
    [aCoder encodeObject:_destinySackRewardItemListDefinition forKey:kFrDestinySackRewardItemListDefinition];
    [aCoder encodeObject:_destinyUnlockEventDefinition forKey:kFrDestinyUnlockEventDefinition];
    [aCoder encodeObject:_destinyMaterialRequirementSetDefinition forKey:kFrDestinyMaterialRequirementSetDefinition];
    [aCoder encodeObject:_destinyRaceDefinition forKey:kFrDestinyRaceDefinition];
    [aCoder encodeObject:_destinyClassDefinition forKey:kFrDestinyClassDefinition];
    [aCoder encodeObject:_destinyTalentGridDefinition forKey:kFrDestinyTalentGridDefinition];
    [aCoder encodeObject:_destinyUnlockDefinition forKey:kFrDestinyUnlockDefinition];
    [aCoder encodeObject:_destinyActivityTypeDefinition forKey:kFrDestinyActivityTypeDefinition];
    [aCoder encodeObject:_destinyEntitlementOfferDefinition forKey:kFrDestinyEntitlementOfferDefinition];
    [aCoder encodeObject:_destinyObjectiveDefinition forKey:kFrDestinyObjectiveDefinition];
    [aCoder encodeObject:_destinySocketCategoryDefinition forKey:kFrDestinySocketCategoryDefinition];
    [aCoder encodeObject:_destinyItemCategoryDefinition forKey:kFrDestinyItemCategoryDefinition];
    [aCoder encodeObject:_destinyArtifactDefinition forKey:kFrDestinyArtifactDefinition];
    [aCoder encodeObject:_destinyLocationDefinition forKey:kFrDestinyLocationDefinition];
    [aCoder encodeObject:_destinyChecklistDefinition forKey:kFrDestinyChecklistDefinition];
    [aCoder encodeObject:_destinySandboxPerkDefinition forKey:kFrDestinySandboxPerkDefinition];
    [aCoder encodeObject:_destinyPresentationNodeBaseDefinition forKey:kFrDestinyPresentationNodeBaseDefinition];
    [aCoder encodeObject:_destinyEnergyTypeDefinition forKey:kFrDestinyEnergyTypeDefinition];
    [aCoder encodeObject:_destinyActivityModeDefinition forKey:kFrDestinyActivityModeDefinition];
    [aCoder encodeObject:_destinyTraitCategoryDefinition forKey:kFrDestinyTraitCategoryDefinition];
    [aCoder encodeObject:_destinyArtDyeChannelDefinition forKey:kFrDestinyArtDyeChannelDefinition];
    [aCoder encodeObject:_destinyRewardItemListDefinition forKey:kFrDestinyRewardItemListDefinition];
}

- (id)copyWithZone:(NSZone *)zone
{
    Fr *copy = [[Fr alloc] init];
    
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
