//
//  PtBr.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "PtBr.h"


NSString *const kPtBrDestinyCharacterCustomizationOptionDefinition = @"DestinyCharacterCustomizationOptionDefinition";
NSString *const kPtBrDestinyProgressionDefinition = @"DestinyProgressionDefinition";
NSString *const kPtBrDestinyItemTierTypeDefinition = @"DestinyItemTierTypeDefinition";
NSString *const kPtBrDestinyActivityInteractableDefinition = @"DestinyActivityInteractableDefinition";
NSString *const kPtBrDestinyUnlockExpressionMappingDefinition = @"DestinyUnlockExpressionMappingDefinition";
NSString *const kPtBrDestinyEquipmentSlotDefinition = @"DestinyEquipmentSlotDefinition";
NSString *const kPtBrDestinyStatGroupDefinition = @"DestinyStatGroupDefinition";
NSString *const kPtBrDestinySeasonDefinition = @"DestinySeasonDefinition";
NSString *const kPtBrDestinyFactionDefinition = @"DestinyFactionDefinition";
NSString *const kPtBrDestinyUnlockValueDefinition = @"DestinyUnlockValueDefinition";
NSString *const kPtBrDestinyActivityDefinition = @"DestinyActivityDefinition";
NSString *const kPtBrDestinyEnemyRaceDefinition = @"DestinyEnemyRaceDefinition";
NSString *const kPtBrDestinySeasonPassDefinition = @"DestinySeasonPassDefinition";
NSString *const kPtBrDestinyVendorDefinition = @"DestinyVendorDefinition";
NSString *const kPtBrDestinyActivityGraphDefinition = @"DestinyActivityGraphDefinition";
NSString *const kPtBrDestinyProgressionMappingDefinition = @"DestinyProgressionMappingDefinition";
NSString *const kPtBrDestinyPlatformBucketMappingDefinition = @"DestinyPlatformBucketMappingDefinition";
NSString *const kPtBrDestinyAchievementDefinition = @"DestinyAchievementDefinition";
NSString *const kPtBrDestinyRewardAdjusterPointerDefinition = @"DestinyRewardAdjusterPointerDefinition";
NSString *const kPtBrDestinyRewardAdjusterProgressionMapDefinition = @"DestinyRewardAdjusterProgressionMapDefinition";
NSString *const kPtBrDestinyInventoryItemDefinition = @"DestinyInventoryItemDefinition";
NSString *const kPtBrDestinyPlaceDefinition = @"DestinyPlaceDefinition";
NSString *const kPtBrDestinyVendorGroupDefinition = @"DestinyVendorGroupDefinition";
NSString *const kPtBrDestinyTraitDefinition = @"DestinyTraitDefinition";
NSString *const kPtBrDestinyLoreDefinition = @"DestinyLoreDefinition";
NSString *const kPtBrDestinyDamageTypeDefinition = @"DestinyDamageTypeDefinition";
NSString *const kPtBrDestinyArtDyeReferenceDefinition = @"DestinyArtDyeReferenceDefinition";
NSString *const kPtBrDestinyMedalTierDefinition = @"DestinyMedalTierDefinition";
NSString *const kPtBrDestinyActivityModifierDefinition = @"DestinyActivityModifierDefinition";
NSString *const kPtBrDestinyInventoryBucketDefinition = @"DestinyInventoryBucketDefinition";
NSString *const kPtBrDestinyGenderDefinition = @"DestinyGenderDefinition";
NSString *const kPtBrDestinyBondDefinition = @"DestinyBondDefinition";
NSString *const kPtBrDestinyRecordDefinition = @"DestinyRecordDefinition";
NSString *const kPtBrDestinyRewardSourceDefinition = @"DestinyRewardSourceDefinition";
NSString *const kPtBrDestinyBreakerTypeDefinition = @"DestinyBreakerTypeDefinition";
NSString *const kPtBrDestinyCollectibleDefinition = @"DestinyCollectibleDefinition";
NSString *const kPtBrDestinyCharacterCustomizationCategoryDefinition = @"DestinyCharacterCustomizationCategoryDefinition";
NSString *const kPtBrDestinySandboxPatternDefinition = @"DestinySandboxPatternDefinition";
NSString *const kPtBrDestinyProgressionLevelRequirementDefinition = @"DestinyProgressionLevelRequirementDefinition";
NSString *const kPtBrDestinyRewardMappingDefinition = @"DestinyRewardMappingDefinition";
NSString *const kPtBrDestinyReportReasonCategoryDefinition = @"DestinyReportReasonCategoryDefinition";
NSString *const kPtBrDestinyPlugSetDefinition = @"DestinyPlugSetDefinition";
NSString *const kPtBrDestinyNodeStepSummaryDefinition = @"DestinyNodeStepSummaryDefinition";
NSString *const kPtBrDestinyUnlockCountMappingDefinition = @"DestinyUnlockCountMappingDefinition";
NSString *const kPtBrDestinySocketTypeDefinition = @"DestinySocketTypeDefinition";
NSString *const kPtBrDestinyMilestoneDefinition = @"DestinyMilestoneDefinition";
NSString *const kPtBrDestinyPresentationNodeDefinition = @"DestinyPresentationNodeDefinition";
NSString *const kPtBrDestinyPowerCapDefinition = @"DestinyPowerCapDefinition";
NSString *const kPtBrDestinyDestinationDefinition = @"DestinyDestinationDefinition";
NSString *const kPtBrDestinyInventoryItemLiteDefinition = @"DestinyInventoryItemLiteDefinition";
NSString *const kPtBrDestinyMetricDefinition = @"DestinyMetricDefinition";
NSString *const kPtBrDestinyRewardSheetDefinition = @"DestinyRewardSheetDefinition";
NSString *const kPtBrDestinyStatDefinition = @"DestinyStatDefinition";
NSString *const kPtBrDestinySackRewardItemListDefinition = @"DestinySackRewardItemListDefinition";
NSString *const kPtBrDestinyUnlockEventDefinition = @"DestinyUnlockEventDefinition";
NSString *const kPtBrDestinyMaterialRequirementSetDefinition = @"DestinyMaterialRequirementSetDefinition";
NSString *const kPtBrDestinyRaceDefinition = @"DestinyRaceDefinition";
NSString *const kPtBrDestinyClassDefinition = @"DestinyClassDefinition";
NSString *const kPtBrDestinyTalentGridDefinition = @"DestinyTalentGridDefinition";
NSString *const kPtBrDestinyUnlockDefinition = @"DestinyUnlockDefinition";
NSString *const kPtBrDestinyActivityTypeDefinition = @"DestinyActivityTypeDefinition";
NSString *const kPtBrDestinyEntitlementOfferDefinition = @"DestinyEntitlementOfferDefinition";
NSString *const kPtBrDestinyObjectiveDefinition = @"DestinyObjectiveDefinition";
NSString *const kPtBrDestinySocketCategoryDefinition = @"DestinySocketCategoryDefinition";
NSString *const kPtBrDestinyItemCategoryDefinition = @"DestinyItemCategoryDefinition";
NSString *const kPtBrDestinyArtifactDefinition = @"DestinyArtifactDefinition";
NSString *const kPtBrDestinyLocationDefinition = @"DestinyLocationDefinition";
NSString *const kPtBrDestinyChecklistDefinition = @"DestinyChecklistDefinition";
NSString *const kPtBrDestinySandboxPerkDefinition = @"DestinySandboxPerkDefinition";
NSString *const kPtBrDestinyPresentationNodeBaseDefinition = @"DestinyPresentationNodeBaseDefinition";
NSString *const kPtBrDestinyEnergyTypeDefinition = @"DestinyEnergyTypeDefinition";
NSString *const kPtBrDestinyActivityModeDefinition = @"DestinyActivityModeDefinition";
NSString *const kPtBrDestinyTraitCategoryDefinition = @"DestinyTraitCategoryDefinition";
NSString *const kPtBrDestinyArtDyeChannelDefinition = @"DestinyArtDyeChannelDefinition";
NSString *const kPtBrDestinyRewardItemListDefinition = @"DestinyRewardItemListDefinition";


@interface PtBr ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PtBr

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
            self.destinyCharacterCustomizationOptionDefinition = [self objectOrNilForKey:kPtBrDestinyCharacterCustomizationOptionDefinition fromDictionary:dict];
            self.destinyProgressionDefinition = [self objectOrNilForKey:kPtBrDestinyProgressionDefinition fromDictionary:dict];
            self.destinyItemTierTypeDefinition = [self objectOrNilForKey:kPtBrDestinyItemTierTypeDefinition fromDictionary:dict];
            self.destinyActivityInteractableDefinition = [self objectOrNilForKey:kPtBrDestinyActivityInteractableDefinition fromDictionary:dict];
            self.destinyUnlockExpressionMappingDefinition = [self objectOrNilForKey:kPtBrDestinyUnlockExpressionMappingDefinition fromDictionary:dict];
            self.destinyEquipmentSlotDefinition = [self objectOrNilForKey:kPtBrDestinyEquipmentSlotDefinition fromDictionary:dict];
            self.destinyStatGroupDefinition = [self objectOrNilForKey:kPtBrDestinyStatGroupDefinition fromDictionary:dict];
            self.destinySeasonDefinition = [self objectOrNilForKey:kPtBrDestinySeasonDefinition fromDictionary:dict];
            self.destinyFactionDefinition = [self objectOrNilForKey:kPtBrDestinyFactionDefinition fromDictionary:dict];
            self.destinyUnlockValueDefinition = [self objectOrNilForKey:kPtBrDestinyUnlockValueDefinition fromDictionary:dict];
            self.destinyActivityDefinition = [self objectOrNilForKey:kPtBrDestinyActivityDefinition fromDictionary:dict];
            self.destinyEnemyRaceDefinition = [self objectOrNilForKey:kPtBrDestinyEnemyRaceDefinition fromDictionary:dict];
            self.destinySeasonPassDefinition = [self objectOrNilForKey:kPtBrDestinySeasonPassDefinition fromDictionary:dict];
            self.destinyVendorDefinition = [self objectOrNilForKey:kPtBrDestinyVendorDefinition fromDictionary:dict];
            self.destinyActivityGraphDefinition = [self objectOrNilForKey:kPtBrDestinyActivityGraphDefinition fromDictionary:dict];
            self.destinyProgressionMappingDefinition = [self objectOrNilForKey:kPtBrDestinyProgressionMappingDefinition fromDictionary:dict];
            self.destinyPlatformBucketMappingDefinition = [self objectOrNilForKey:kPtBrDestinyPlatformBucketMappingDefinition fromDictionary:dict];
            self.destinyAchievementDefinition = [self objectOrNilForKey:kPtBrDestinyAchievementDefinition fromDictionary:dict];
            self.destinyRewardAdjusterPointerDefinition = [self objectOrNilForKey:kPtBrDestinyRewardAdjusterPointerDefinition fromDictionary:dict];
            self.destinyRewardAdjusterProgressionMapDefinition = [self objectOrNilForKey:kPtBrDestinyRewardAdjusterProgressionMapDefinition fromDictionary:dict];
            self.destinyInventoryItemDefinition = [self objectOrNilForKey:kPtBrDestinyInventoryItemDefinition fromDictionary:dict];
            self.destinyPlaceDefinition = [self objectOrNilForKey:kPtBrDestinyPlaceDefinition fromDictionary:dict];
            self.destinyVendorGroupDefinition = [self objectOrNilForKey:kPtBrDestinyVendorGroupDefinition fromDictionary:dict];
            self.destinyTraitDefinition = [self objectOrNilForKey:kPtBrDestinyTraitDefinition fromDictionary:dict];
            self.destinyLoreDefinition = [self objectOrNilForKey:kPtBrDestinyLoreDefinition fromDictionary:dict];
            self.destinyDamageTypeDefinition = [self objectOrNilForKey:kPtBrDestinyDamageTypeDefinition fromDictionary:dict];
            self.destinyArtDyeReferenceDefinition = [self objectOrNilForKey:kPtBrDestinyArtDyeReferenceDefinition fromDictionary:dict];
            self.destinyMedalTierDefinition = [self objectOrNilForKey:kPtBrDestinyMedalTierDefinition fromDictionary:dict];
            self.destinyActivityModifierDefinition = [self objectOrNilForKey:kPtBrDestinyActivityModifierDefinition fromDictionary:dict];
            self.destinyInventoryBucketDefinition = [self objectOrNilForKey:kPtBrDestinyInventoryBucketDefinition fromDictionary:dict];
            self.destinyGenderDefinition = [self objectOrNilForKey:kPtBrDestinyGenderDefinition fromDictionary:dict];
            self.destinyBondDefinition = [self objectOrNilForKey:kPtBrDestinyBondDefinition fromDictionary:dict];
            self.destinyRecordDefinition = [self objectOrNilForKey:kPtBrDestinyRecordDefinition fromDictionary:dict];
            self.destinyRewardSourceDefinition = [self objectOrNilForKey:kPtBrDestinyRewardSourceDefinition fromDictionary:dict];
            self.destinyBreakerTypeDefinition = [self objectOrNilForKey:kPtBrDestinyBreakerTypeDefinition fromDictionary:dict];
            self.destinyCollectibleDefinition = [self objectOrNilForKey:kPtBrDestinyCollectibleDefinition fromDictionary:dict];
            self.destinyCharacterCustomizationCategoryDefinition = [self objectOrNilForKey:kPtBrDestinyCharacterCustomizationCategoryDefinition fromDictionary:dict];
            self.destinySandboxPatternDefinition = [self objectOrNilForKey:kPtBrDestinySandboxPatternDefinition fromDictionary:dict];
            self.destinyProgressionLevelRequirementDefinition = [self objectOrNilForKey:kPtBrDestinyProgressionLevelRequirementDefinition fromDictionary:dict];
            self.destinyRewardMappingDefinition = [self objectOrNilForKey:kPtBrDestinyRewardMappingDefinition fromDictionary:dict];
            self.destinyReportReasonCategoryDefinition = [self objectOrNilForKey:kPtBrDestinyReportReasonCategoryDefinition fromDictionary:dict];
            self.destinyPlugSetDefinition = [self objectOrNilForKey:kPtBrDestinyPlugSetDefinition fromDictionary:dict];
            self.destinyNodeStepSummaryDefinition = [self objectOrNilForKey:kPtBrDestinyNodeStepSummaryDefinition fromDictionary:dict];
            self.destinyUnlockCountMappingDefinition = [self objectOrNilForKey:kPtBrDestinyUnlockCountMappingDefinition fromDictionary:dict];
            self.destinySocketTypeDefinition = [self objectOrNilForKey:kPtBrDestinySocketTypeDefinition fromDictionary:dict];
            self.destinyMilestoneDefinition = [self objectOrNilForKey:kPtBrDestinyMilestoneDefinition fromDictionary:dict];
            self.destinyPresentationNodeDefinition = [self objectOrNilForKey:kPtBrDestinyPresentationNodeDefinition fromDictionary:dict];
            self.destinyPowerCapDefinition = [self objectOrNilForKey:kPtBrDestinyPowerCapDefinition fromDictionary:dict];
            self.destinyDestinationDefinition = [self objectOrNilForKey:kPtBrDestinyDestinationDefinition fromDictionary:dict];
            self.destinyInventoryItemLiteDefinition = [self objectOrNilForKey:kPtBrDestinyInventoryItemLiteDefinition fromDictionary:dict];
            self.destinyMetricDefinition = [self objectOrNilForKey:kPtBrDestinyMetricDefinition fromDictionary:dict];
            self.destinyRewardSheetDefinition = [self objectOrNilForKey:kPtBrDestinyRewardSheetDefinition fromDictionary:dict];
            self.destinyStatDefinition = [self objectOrNilForKey:kPtBrDestinyStatDefinition fromDictionary:dict];
            self.destinySackRewardItemListDefinition = [self objectOrNilForKey:kPtBrDestinySackRewardItemListDefinition fromDictionary:dict];
            self.destinyUnlockEventDefinition = [self objectOrNilForKey:kPtBrDestinyUnlockEventDefinition fromDictionary:dict];
            self.destinyMaterialRequirementSetDefinition = [self objectOrNilForKey:kPtBrDestinyMaterialRequirementSetDefinition fromDictionary:dict];
            self.destinyRaceDefinition = [self objectOrNilForKey:kPtBrDestinyRaceDefinition fromDictionary:dict];
            self.destinyClassDefinition = [self objectOrNilForKey:kPtBrDestinyClassDefinition fromDictionary:dict];
            self.destinyTalentGridDefinition = [self objectOrNilForKey:kPtBrDestinyTalentGridDefinition fromDictionary:dict];
            self.destinyUnlockDefinition = [self objectOrNilForKey:kPtBrDestinyUnlockDefinition fromDictionary:dict];
            self.destinyActivityTypeDefinition = [self objectOrNilForKey:kPtBrDestinyActivityTypeDefinition fromDictionary:dict];
            self.destinyEntitlementOfferDefinition = [self objectOrNilForKey:kPtBrDestinyEntitlementOfferDefinition fromDictionary:dict];
            self.destinyObjectiveDefinition = [self objectOrNilForKey:kPtBrDestinyObjectiveDefinition fromDictionary:dict];
            self.destinySocketCategoryDefinition = [self objectOrNilForKey:kPtBrDestinySocketCategoryDefinition fromDictionary:dict];
            self.destinyItemCategoryDefinition = [self objectOrNilForKey:kPtBrDestinyItemCategoryDefinition fromDictionary:dict];
            self.destinyArtifactDefinition = [self objectOrNilForKey:kPtBrDestinyArtifactDefinition fromDictionary:dict];
            self.destinyLocationDefinition = [self objectOrNilForKey:kPtBrDestinyLocationDefinition fromDictionary:dict];
            self.destinyChecklistDefinition = [self objectOrNilForKey:kPtBrDestinyChecklistDefinition fromDictionary:dict];
            self.destinySandboxPerkDefinition = [self objectOrNilForKey:kPtBrDestinySandboxPerkDefinition fromDictionary:dict];
            self.destinyPresentationNodeBaseDefinition = [self objectOrNilForKey:kPtBrDestinyPresentationNodeBaseDefinition fromDictionary:dict];
            self.destinyEnergyTypeDefinition = [self objectOrNilForKey:kPtBrDestinyEnergyTypeDefinition fromDictionary:dict];
            self.destinyActivityModeDefinition = [self objectOrNilForKey:kPtBrDestinyActivityModeDefinition fromDictionary:dict];
            self.destinyTraitCategoryDefinition = [self objectOrNilForKey:kPtBrDestinyTraitCategoryDefinition fromDictionary:dict];
            self.destinyArtDyeChannelDefinition = [self objectOrNilForKey:kPtBrDestinyArtDyeChannelDefinition fromDictionary:dict];
            self.destinyRewardItemListDefinition = [self objectOrNilForKey:kPtBrDestinyRewardItemListDefinition fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.destinyCharacterCustomizationOptionDefinition forKey:kPtBrDestinyCharacterCustomizationOptionDefinition];
    [mutableDict setValue:self.destinyProgressionDefinition forKey:kPtBrDestinyProgressionDefinition];
    [mutableDict setValue:self.destinyItemTierTypeDefinition forKey:kPtBrDestinyItemTierTypeDefinition];
    [mutableDict setValue:self.destinyActivityInteractableDefinition forKey:kPtBrDestinyActivityInteractableDefinition];
    [mutableDict setValue:self.destinyUnlockExpressionMappingDefinition forKey:kPtBrDestinyUnlockExpressionMappingDefinition];
    [mutableDict setValue:self.destinyEquipmentSlotDefinition forKey:kPtBrDestinyEquipmentSlotDefinition];
    [mutableDict setValue:self.destinyStatGroupDefinition forKey:kPtBrDestinyStatGroupDefinition];
    [mutableDict setValue:self.destinySeasonDefinition forKey:kPtBrDestinySeasonDefinition];
    [mutableDict setValue:self.destinyFactionDefinition forKey:kPtBrDestinyFactionDefinition];
    [mutableDict setValue:self.destinyUnlockValueDefinition forKey:kPtBrDestinyUnlockValueDefinition];
    [mutableDict setValue:self.destinyActivityDefinition forKey:kPtBrDestinyActivityDefinition];
    [mutableDict setValue:self.destinyEnemyRaceDefinition forKey:kPtBrDestinyEnemyRaceDefinition];
    [mutableDict setValue:self.destinySeasonPassDefinition forKey:kPtBrDestinySeasonPassDefinition];
    [mutableDict setValue:self.destinyVendorDefinition forKey:kPtBrDestinyVendorDefinition];
    [mutableDict setValue:self.destinyActivityGraphDefinition forKey:kPtBrDestinyActivityGraphDefinition];
    [mutableDict setValue:self.destinyProgressionMappingDefinition forKey:kPtBrDestinyProgressionMappingDefinition];
    [mutableDict setValue:self.destinyPlatformBucketMappingDefinition forKey:kPtBrDestinyPlatformBucketMappingDefinition];
    [mutableDict setValue:self.destinyAchievementDefinition forKey:kPtBrDestinyAchievementDefinition];
    [mutableDict setValue:self.destinyRewardAdjusterPointerDefinition forKey:kPtBrDestinyRewardAdjusterPointerDefinition];
    [mutableDict setValue:self.destinyRewardAdjusterProgressionMapDefinition forKey:kPtBrDestinyRewardAdjusterProgressionMapDefinition];
    [mutableDict setValue:self.destinyInventoryItemDefinition forKey:kPtBrDestinyInventoryItemDefinition];
    [mutableDict setValue:self.destinyPlaceDefinition forKey:kPtBrDestinyPlaceDefinition];
    [mutableDict setValue:self.destinyVendorGroupDefinition forKey:kPtBrDestinyVendorGroupDefinition];
    [mutableDict setValue:self.destinyTraitDefinition forKey:kPtBrDestinyTraitDefinition];
    [mutableDict setValue:self.destinyLoreDefinition forKey:kPtBrDestinyLoreDefinition];
    [mutableDict setValue:self.destinyDamageTypeDefinition forKey:kPtBrDestinyDamageTypeDefinition];
    [mutableDict setValue:self.destinyArtDyeReferenceDefinition forKey:kPtBrDestinyArtDyeReferenceDefinition];
    [mutableDict setValue:self.destinyMedalTierDefinition forKey:kPtBrDestinyMedalTierDefinition];
    [mutableDict setValue:self.destinyActivityModifierDefinition forKey:kPtBrDestinyActivityModifierDefinition];
    [mutableDict setValue:self.destinyInventoryBucketDefinition forKey:kPtBrDestinyInventoryBucketDefinition];
    [mutableDict setValue:self.destinyGenderDefinition forKey:kPtBrDestinyGenderDefinition];
    [mutableDict setValue:self.destinyBondDefinition forKey:kPtBrDestinyBondDefinition];
    [mutableDict setValue:self.destinyRecordDefinition forKey:kPtBrDestinyRecordDefinition];
    [mutableDict setValue:self.destinyRewardSourceDefinition forKey:kPtBrDestinyRewardSourceDefinition];
    [mutableDict setValue:self.destinyBreakerTypeDefinition forKey:kPtBrDestinyBreakerTypeDefinition];
    [mutableDict setValue:self.destinyCollectibleDefinition forKey:kPtBrDestinyCollectibleDefinition];
    [mutableDict setValue:self.destinyCharacterCustomizationCategoryDefinition forKey:kPtBrDestinyCharacterCustomizationCategoryDefinition];
    [mutableDict setValue:self.destinySandboxPatternDefinition forKey:kPtBrDestinySandboxPatternDefinition];
    [mutableDict setValue:self.destinyProgressionLevelRequirementDefinition forKey:kPtBrDestinyProgressionLevelRequirementDefinition];
    [mutableDict setValue:self.destinyRewardMappingDefinition forKey:kPtBrDestinyRewardMappingDefinition];
    [mutableDict setValue:self.destinyReportReasonCategoryDefinition forKey:kPtBrDestinyReportReasonCategoryDefinition];
    [mutableDict setValue:self.destinyPlugSetDefinition forKey:kPtBrDestinyPlugSetDefinition];
    [mutableDict setValue:self.destinyNodeStepSummaryDefinition forKey:kPtBrDestinyNodeStepSummaryDefinition];
    [mutableDict setValue:self.destinyUnlockCountMappingDefinition forKey:kPtBrDestinyUnlockCountMappingDefinition];
    [mutableDict setValue:self.destinySocketTypeDefinition forKey:kPtBrDestinySocketTypeDefinition];
    [mutableDict setValue:self.destinyMilestoneDefinition forKey:kPtBrDestinyMilestoneDefinition];
    [mutableDict setValue:self.destinyPresentationNodeDefinition forKey:kPtBrDestinyPresentationNodeDefinition];
    [mutableDict setValue:self.destinyPowerCapDefinition forKey:kPtBrDestinyPowerCapDefinition];
    [mutableDict setValue:self.destinyDestinationDefinition forKey:kPtBrDestinyDestinationDefinition];
    [mutableDict setValue:self.destinyInventoryItemLiteDefinition forKey:kPtBrDestinyInventoryItemLiteDefinition];
    [mutableDict setValue:self.destinyMetricDefinition forKey:kPtBrDestinyMetricDefinition];
    [mutableDict setValue:self.destinyRewardSheetDefinition forKey:kPtBrDestinyRewardSheetDefinition];
    [mutableDict setValue:self.destinyStatDefinition forKey:kPtBrDestinyStatDefinition];
    [mutableDict setValue:self.destinySackRewardItemListDefinition forKey:kPtBrDestinySackRewardItemListDefinition];
    [mutableDict setValue:self.destinyUnlockEventDefinition forKey:kPtBrDestinyUnlockEventDefinition];
    [mutableDict setValue:self.destinyMaterialRequirementSetDefinition forKey:kPtBrDestinyMaterialRequirementSetDefinition];
    [mutableDict setValue:self.destinyRaceDefinition forKey:kPtBrDestinyRaceDefinition];
    [mutableDict setValue:self.destinyClassDefinition forKey:kPtBrDestinyClassDefinition];
    [mutableDict setValue:self.destinyTalentGridDefinition forKey:kPtBrDestinyTalentGridDefinition];
    [mutableDict setValue:self.destinyUnlockDefinition forKey:kPtBrDestinyUnlockDefinition];
    [mutableDict setValue:self.destinyActivityTypeDefinition forKey:kPtBrDestinyActivityTypeDefinition];
    [mutableDict setValue:self.destinyEntitlementOfferDefinition forKey:kPtBrDestinyEntitlementOfferDefinition];
    [mutableDict setValue:self.destinyObjectiveDefinition forKey:kPtBrDestinyObjectiveDefinition];
    [mutableDict setValue:self.destinySocketCategoryDefinition forKey:kPtBrDestinySocketCategoryDefinition];
    [mutableDict setValue:self.destinyItemCategoryDefinition forKey:kPtBrDestinyItemCategoryDefinition];
    [mutableDict setValue:self.destinyArtifactDefinition forKey:kPtBrDestinyArtifactDefinition];
    [mutableDict setValue:self.destinyLocationDefinition forKey:kPtBrDestinyLocationDefinition];
    [mutableDict setValue:self.destinyChecklistDefinition forKey:kPtBrDestinyChecklistDefinition];
    [mutableDict setValue:self.destinySandboxPerkDefinition forKey:kPtBrDestinySandboxPerkDefinition];
    [mutableDict setValue:self.destinyPresentationNodeBaseDefinition forKey:kPtBrDestinyPresentationNodeBaseDefinition];
    [mutableDict setValue:self.destinyEnergyTypeDefinition forKey:kPtBrDestinyEnergyTypeDefinition];
    [mutableDict setValue:self.destinyActivityModeDefinition forKey:kPtBrDestinyActivityModeDefinition];
    [mutableDict setValue:self.destinyTraitCategoryDefinition forKey:kPtBrDestinyTraitCategoryDefinition];
    [mutableDict setValue:self.destinyArtDyeChannelDefinition forKey:kPtBrDestinyArtDyeChannelDefinition];
    [mutableDict setValue:self.destinyRewardItemListDefinition forKey:kPtBrDestinyRewardItemListDefinition];

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

    self.destinyCharacterCustomizationOptionDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyCharacterCustomizationOptionDefinition];
    self.destinyProgressionDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyProgressionDefinition];
    self.destinyItemTierTypeDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyItemTierTypeDefinition];
    self.destinyActivityInteractableDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyActivityInteractableDefinition];
    self.destinyUnlockExpressionMappingDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyUnlockExpressionMappingDefinition];
    self.destinyEquipmentSlotDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyEquipmentSlotDefinition];
    self.destinyStatGroupDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyStatGroupDefinition];
    self.destinySeasonDefinition = [aDecoder decodeObjectForKey:kPtBrDestinySeasonDefinition];
    self.destinyFactionDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyFactionDefinition];
    self.destinyUnlockValueDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyUnlockValueDefinition];
    self.destinyActivityDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyActivityDefinition];
    self.destinyEnemyRaceDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyEnemyRaceDefinition];
    self.destinySeasonPassDefinition = [aDecoder decodeObjectForKey:kPtBrDestinySeasonPassDefinition];
    self.destinyVendorDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyVendorDefinition];
    self.destinyActivityGraphDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyActivityGraphDefinition];
    self.destinyProgressionMappingDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyProgressionMappingDefinition];
    self.destinyPlatformBucketMappingDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyPlatformBucketMappingDefinition];
    self.destinyAchievementDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyAchievementDefinition];
    self.destinyRewardAdjusterPointerDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyRewardAdjusterPointerDefinition];
    self.destinyRewardAdjusterProgressionMapDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyRewardAdjusterProgressionMapDefinition];
    self.destinyInventoryItemDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyInventoryItemDefinition];
    self.destinyPlaceDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyPlaceDefinition];
    self.destinyVendorGroupDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyVendorGroupDefinition];
    self.destinyTraitDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyTraitDefinition];
    self.destinyLoreDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyLoreDefinition];
    self.destinyDamageTypeDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyDamageTypeDefinition];
    self.destinyArtDyeReferenceDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyArtDyeReferenceDefinition];
    self.destinyMedalTierDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyMedalTierDefinition];
    self.destinyActivityModifierDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyActivityModifierDefinition];
    self.destinyInventoryBucketDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyInventoryBucketDefinition];
    self.destinyGenderDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyGenderDefinition];
    self.destinyBondDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyBondDefinition];
    self.destinyRecordDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyRecordDefinition];
    self.destinyRewardSourceDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyRewardSourceDefinition];
    self.destinyBreakerTypeDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyBreakerTypeDefinition];
    self.destinyCollectibleDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyCollectibleDefinition];
    self.destinyCharacterCustomizationCategoryDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyCharacterCustomizationCategoryDefinition];
    self.destinySandboxPatternDefinition = [aDecoder decodeObjectForKey:kPtBrDestinySandboxPatternDefinition];
    self.destinyProgressionLevelRequirementDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyProgressionLevelRequirementDefinition];
    self.destinyRewardMappingDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyRewardMappingDefinition];
    self.destinyReportReasonCategoryDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyReportReasonCategoryDefinition];
    self.destinyPlugSetDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyPlugSetDefinition];
    self.destinyNodeStepSummaryDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyNodeStepSummaryDefinition];
    self.destinyUnlockCountMappingDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyUnlockCountMappingDefinition];
    self.destinySocketTypeDefinition = [aDecoder decodeObjectForKey:kPtBrDestinySocketTypeDefinition];
    self.destinyMilestoneDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyMilestoneDefinition];
    self.destinyPresentationNodeDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyPresentationNodeDefinition];
    self.destinyPowerCapDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyPowerCapDefinition];
    self.destinyDestinationDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyDestinationDefinition];
    self.destinyInventoryItemLiteDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyInventoryItemLiteDefinition];
    self.destinyMetricDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyMetricDefinition];
    self.destinyRewardSheetDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyRewardSheetDefinition];
    self.destinyStatDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyStatDefinition];
    self.destinySackRewardItemListDefinition = [aDecoder decodeObjectForKey:kPtBrDestinySackRewardItemListDefinition];
    self.destinyUnlockEventDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyUnlockEventDefinition];
    self.destinyMaterialRequirementSetDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyMaterialRequirementSetDefinition];
    self.destinyRaceDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyRaceDefinition];
    self.destinyClassDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyClassDefinition];
    self.destinyTalentGridDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyTalentGridDefinition];
    self.destinyUnlockDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyUnlockDefinition];
    self.destinyActivityTypeDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyActivityTypeDefinition];
    self.destinyEntitlementOfferDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyEntitlementOfferDefinition];
    self.destinyObjectiveDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyObjectiveDefinition];
    self.destinySocketCategoryDefinition = [aDecoder decodeObjectForKey:kPtBrDestinySocketCategoryDefinition];
    self.destinyItemCategoryDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyItemCategoryDefinition];
    self.destinyArtifactDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyArtifactDefinition];
    self.destinyLocationDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyLocationDefinition];
    self.destinyChecklistDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyChecklistDefinition];
    self.destinySandboxPerkDefinition = [aDecoder decodeObjectForKey:kPtBrDestinySandboxPerkDefinition];
    self.destinyPresentationNodeBaseDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyPresentationNodeBaseDefinition];
    self.destinyEnergyTypeDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyEnergyTypeDefinition];
    self.destinyActivityModeDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyActivityModeDefinition];
    self.destinyTraitCategoryDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyTraitCategoryDefinition];
    self.destinyArtDyeChannelDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyArtDyeChannelDefinition];
    self.destinyRewardItemListDefinition = [aDecoder decodeObjectForKey:kPtBrDestinyRewardItemListDefinition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_destinyCharacterCustomizationOptionDefinition forKey:kPtBrDestinyCharacterCustomizationOptionDefinition];
    [aCoder encodeObject:_destinyProgressionDefinition forKey:kPtBrDestinyProgressionDefinition];
    [aCoder encodeObject:_destinyItemTierTypeDefinition forKey:kPtBrDestinyItemTierTypeDefinition];
    [aCoder encodeObject:_destinyActivityInteractableDefinition forKey:kPtBrDestinyActivityInteractableDefinition];
    [aCoder encodeObject:_destinyUnlockExpressionMappingDefinition forKey:kPtBrDestinyUnlockExpressionMappingDefinition];
    [aCoder encodeObject:_destinyEquipmentSlotDefinition forKey:kPtBrDestinyEquipmentSlotDefinition];
    [aCoder encodeObject:_destinyStatGroupDefinition forKey:kPtBrDestinyStatGroupDefinition];
    [aCoder encodeObject:_destinySeasonDefinition forKey:kPtBrDestinySeasonDefinition];
    [aCoder encodeObject:_destinyFactionDefinition forKey:kPtBrDestinyFactionDefinition];
    [aCoder encodeObject:_destinyUnlockValueDefinition forKey:kPtBrDestinyUnlockValueDefinition];
    [aCoder encodeObject:_destinyActivityDefinition forKey:kPtBrDestinyActivityDefinition];
    [aCoder encodeObject:_destinyEnemyRaceDefinition forKey:kPtBrDestinyEnemyRaceDefinition];
    [aCoder encodeObject:_destinySeasonPassDefinition forKey:kPtBrDestinySeasonPassDefinition];
    [aCoder encodeObject:_destinyVendorDefinition forKey:kPtBrDestinyVendorDefinition];
    [aCoder encodeObject:_destinyActivityGraphDefinition forKey:kPtBrDestinyActivityGraphDefinition];
    [aCoder encodeObject:_destinyProgressionMappingDefinition forKey:kPtBrDestinyProgressionMappingDefinition];
    [aCoder encodeObject:_destinyPlatformBucketMappingDefinition forKey:kPtBrDestinyPlatformBucketMappingDefinition];
    [aCoder encodeObject:_destinyAchievementDefinition forKey:kPtBrDestinyAchievementDefinition];
    [aCoder encodeObject:_destinyRewardAdjusterPointerDefinition forKey:kPtBrDestinyRewardAdjusterPointerDefinition];
    [aCoder encodeObject:_destinyRewardAdjusterProgressionMapDefinition forKey:kPtBrDestinyRewardAdjusterProgressionMapDefinition];
    [aCoder encodeObject:_destinyInventoryItemDefinition forKey:kPtBrDestinyInventoryItemDefinition];
    [aCoder encodeObject:_destinyPlaceDefinition forKey:kPtBrDestinyPlaceDefinition];
    [aCoder encodeObject:_destinyVendorGroupDefinition forKey:kPtBrDestinyVendorGroupDefinition];
    [aCoder encodeObject:_destinyTraitDefinition forKey:kPtBrDestinyTraitDefinition];
    [aCoder encodeObject:_destinyLoreDefinition forKey:kPtBrDestinyLoreDefinition];
    [aCoder encodeObject:_destinyDamageTypeDefinition forKey:kPtBrDestinyDamageTypeDefinition];
    [aCoder encodeObject:_destinyArtDyeReferenceDefinition forKey:kPtBrDestinyArtDyeReferenceDefinition];
    [aCoder encodeObject:_destinyMedalTierDefinition forKey:kPtBrDestinyMedalTierDefinition];
    [aCoder encodeObject:_destinyActivityModifierDefinition forKey:kPtBrDestinyActivityModifierDefinition];
    [aCoder encodeObject:_destinyInventoryBucketDefinition forKey:kPtBrDestinyInventoryBucketDefinition];
    [aCoder encodeObject:_destinyGenderDefinition forKey:kPtBrDestinyGenderDefinition];
    [aCoder encodeObject:_destinyBondDefinition forKey:kPtBrDestinyBondDefinition];
    [aCoder encodeObject:_destinyRecordDefinition forKey:kPtBrDestinyRecordDefinition];
    [aCoder encodeObject:_destinyRewardSourceDefinition forKey:kPtBrDestinyRewardSourceDefinition];
    [aCoder encodeObject:_destinyBreakerTypeDefinition forKey:kPtBrDestinyBreakerTypeDefinition];
    [aCoder encodeObject:_destinyCollectibleDefinition forKey:kPtBrDestinyCollectibleDefinition];
    [aCoder encodeObject:_destinyCharacterCustomizationCategoryDefinition forKey:kPtBrDestinyCharacterCustomizationCategoryDefinition];
    [aCoder encodeObject:_destinySandboxPatternDefinition forKey:kPtBrDestinySandboxPatternDefinition];
    [aCoder encodeObject:_destinyProgressionLevelRequirementDefinition forKey:kPtBrDestinyProgressionLevelRequirementDefinition];
    [aCoder encodeObject:_destinyRewardMappingDefinition forKey:kPtBrDestinyRewardMappingDefinition];
    [aCoder encodeObject:_destinyReportReasonCategoryDefinition forKey:kPtBrDestinyReportReasonCategoryDefinition];
    [aCoder encodeObject:_destinyPlugSetDefinition forKey:kPtBrDestinyPlugSetDefinition];
    [aCoder encodeObject:_destinyNodeStepSummaryDefinition forKey:kPtBrDestinyNodeStepSummaryDefinition];
    [aCoder encodeObject:_destinyUnlockCountMappingDefinition forKey:kPtBrDestinyUnlockCountMappingDefinition];
    [aCoder encodeObject:_destinySocketTypeDefinition forKey:kPtBrDestinySocketTypeDefinition];
    [aCoder encodeObject:_destinyMilestoneDefinition forKey:kPtBrDestinyMilestoneDefinition];
    [aCoder encodeObject:_destinyPresentationNodeDefinition forKey:kPtBrDestinyPresentationNodeDefinition];
    [aCoder encodeObject:_destinyPowerCapDefinition forKey:kPtBrDestinyPowerCapDefinition];
    [aCoder encodeObject:_destinyDestinationDefinition forKey:kPtBrDestinyDestinationDefinition];
    [aCoder encodeObject:_destinyInventoryItemLiteDefinition forKey:kPtBrDestinyInventoryItemLiteDefinition];
    [aCoder encodeObject:_destinyMetricDefinition forKey:kPtBrDestinyMetricDefinition];
    [aCoder encodeObject:_destinyRewardSheetDefinition forKey:kPtBrDestinyRewardSheetDefinition];
    [aCoder encodeObject:_destinyStatDefinition forKey:kPtBrDestinyStatDefinition];
    [aCoder encodeObject:_destinySackRewardItemListDefinition forKey:kPtBrDestinySackRewardItemListDefinition];
    [aCoder encodeObject:_destinyUnlockEventDefinition forKey:kPtBrDestinyUnlockEventDefinition];
    [aCoder encodeObject:_destinyMaterialRequirementSetDefinition forKey:kPtBrDestinyMaterialRequirementSetDefinition];
    [aCoder encodeObject:_destinyRaceDefinition forKey:kPtBrDestinyRaceDefinition];
    [aCoder encodeObject:_destinyClassDefinition forKey:kPtBrDestinyClassDefinition];
    [aCoder encodeObject:_destinyTalentGridDefinition forKey:kPtBrDestinyTalentGridDefinition];
    [aCoder encodeObject:_destinyUnlockDefinition forKey:kPtBrDestinyUnlockDefinition];
    [aCoder encodeObject:_destinyActivityTypeDefinition forKey:kPtBrDestinyActivityTypeDefinition];
    [aCoder encodeObject:_destinyEntitlementOfferDefinition forKey:kPtBrDestinyEntitlementOfferDefinition];
    [aCoder encodeObject:_destinyObjectiveDefinition forKey:kPtBrDestinyObjectiveDefinition];
    [aCoder encodeObject:_destinySocketCategoryDefinition forKey:kPtBrDestinySocketCategoryDefinition];
    [aCoder encodeObject:_destinyItemCategoryDefinition forKey:kPtBrDestinyItemCategoryDefinition];
    [aCoder encodeObject:_destinyArtifactDefinition forKey:kPtBrDestinyArtifactDefinition];
    [aCoder encodeObject:_destinyLocationDefinition forKey:kPtBrDestinyLocationDefinition];
    [aCoder encodeObject:_destinyChecklistDefinition forKey:kPtBrDestinyChecklistDefinition];
    [aCoder encodeObject:_destinySandboxPerkDefinition forKey:kPtBrDestinySandboxPerkDefinition];
    [aCoder encodeObject:_destinyPresentationNodeBaseDefinition forKey:kPtBrDestinyPresentationNodeBaseDefinition];
    [aCoder encodeObject:_destinyEnergyTypeDefinition forKey:kPtBrDestinyEnergyTypeDefinition];
    [aCoder encodeObject:_destinyActivityModeDefinition forKey:kPtBrDestinyActivityModeDefinition];
    [aCoder encodeObject:_destinyTraitCategoryDefinition forKey:kPtBrDestinyTraitCategoryDefinition];
    [aCoder encodeObject:_destinyArtDyeChannelDefinition forKey:kPtBrDestinyArtDyeChannelDefinition];
    [aCoder encodeObject:_destinyRewardItemListDefinition forKey:kPtBrDestinyRewardItemListDefinition];
}

- (id)copyWithZone:(NSZone *)zone
{
    PtBr *copy = [[PtBr alloc] init];
    
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
