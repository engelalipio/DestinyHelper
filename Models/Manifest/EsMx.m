//
//  EsMx.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "EsMx.h"


NSString *const kEsMxDestinyCharacterCustomizationOptionDefinition = @"DestinyCharacterCustomizationOptionDefinition";
NSString *const kEsMxDestinyProgressionDefinition = @"DestinyProgressionDefinition";
NSString *const kEsMxDestinyItemTierTypeDefinition = @"DestinyItemTierTypeDefinition";
NSString *const kEsMxDestinyActivityInteractableDefinition = @"DestinyActivityInteractableDefinition";
NSString *const kEsMxDestinyUnlockExpressionMappingDefinition = @"DestinyUnlockExpressionMappingDefinition";
NSString *const kEsMxDestinyEquipmentSlotDefinition = @"DestinyEquipmentSlotDefinition";
NSString *const kEsMxDestinyStatGroupDefinition = @"DestinyStatGroupDefinition";
NSString *const kEsMxDestinySeasonDefinition = @"DestinySeasonDefinition";
NSString *const kEsMxDestinyFactionDefinition = @"DestinyFactionDefinition";
NSString *const kEsMxDestinyUnlockValueDefinition = @"DestinyUnlockValueDefinition";
NSString *const kEsMxDestinyActivityDefinition = @"DestinyActivityDefinition";
NSString *const kEsMxDestinyEnemyRaceDefinition = @"DestinyEnemyRaceDefinition";
NSString *const kEsMxDestinySeasonPassDefinition = @"DestinySeasonPassDefinition";
NSString *const kEsMxDestinyVendorDefinition = @"DestinyVendorDefinition";
NSString *const kEsMxDestinyActivityGraphDefinition = @"DestinyActivityGraphDefinition";
NSString *const kEsMxDestinyProgressionMappingDefinition = @"DestinyProgressionMappingDefinition";
NSString *const kEsMxDestinyPlatformBucketMappingDefinition = @"DestinyPlatformBucketMappingDefinition";
NSString *const kEsMxDestinyAchievementDefinition = @"DestinyAchievementDefinition";
NSString *const kEsMxDestinyRewardAdjusterPointerDefinition = @"DestinyRewardAdjusterPointerDefinition";
NSString *const kEsMxDestinyRewardAdjusterProgressionMapDefinition = @"DestinyRewardAdjusterProgressionMapDefinition";
NSString *const kEsMxDestinyInventoryItemDefinition = @"DestinyInventoryItemDefinition";
NSString *const kEsMxDestinyPlaceDefinition = @"DestinyPlaceDefinition";
NSString *const kEsMxDestinyVendorGroupDefinition = @"DestinyVendorGroupDefinition";
NSString *const kEsMxDestinyTraitDefinition = @"DestinyTraitDefinition";
NSString *const kEsMxDestinyLoreDefinition = @"DestinyLoreDefinition";
NSString *const kEsMxDestinyDamageTypeDefinition = @"DestinyDamageTypeDefinition";
NSString *const kEsMxDestinyArtDyeReferenceDefinition = @"DestinyArtDyeReferenceDefinition";
NSString *const kEsMxDestinyMedalTierDefinition = @"DestinyMedalTierDefinition";
NSString *const kEsMxDestinyActivityModifierDefinition = @"DestinyActivityModifierDefinition";
NSString *const kEsMxDestinyInventoryBucketDefinition = @"DestinyInventoryBucketDefinition";
NSString *const kEsMxDestinyGenderDefinition = @"DestinyGenderDefinition";
NSString *const kEsMxDestinyBondDefinition = @"DestinyBondDefinition";
NSString *const kEsMxDestinyRecordDefinition = @"DestinyRecordDefinition";
NSString *const kEsMxDestinyRewardSourceDefinition = @"DestinyRewardSourceDefinition";
NSString *const kEsMxDestinyBreakerTypeDefinition = @"DestinyBreakerTypeDefinition";
NSString *const kEsMxDestinyCollectibleDefinition = @"DestinyCollectibleDefinition";
NSString *const kEsMxDestinyCharacterCustomizationCategoryDefinition = @"DestinyCharacterCustomizationCategoryDefinition";
NSString *const kEsMxDestinySandboxPatternDefinition = @"DestinySandboxPatternDefinition";
NSString *const kEsMxDestinyProgressionLevelRequirementDefinition = @"DestinyProgressionLevelRequirementDefinition";
NSString *const kEsMxDestinyRewardMappingDefinition = @"DestinyRewardMappingDefinition";
NSString *const kEsMxDestinyReportReasonCategoryDefinition = @"DestinyReportReasonCategoryDefinition";
NSString *const kEsMxDestinyPlugSetDefinition = @"DestinyPlugSetDefinition";
NSString *const kEsMxDestinyNodeStepSummaryDefinition = @"DestinyNodeStepSummaryDefinition";
NSString *const kEsMxDestinyUnlockCountMappingDefinition = @"DestinyUnlockCountMappingDefinition";
NSString *const kEsMxDestinySocketTypeDefinition = @"DestinySocketTypeDefinition";
NSString *const kEsMxDestinyMilestoneDefinition = @"DestinyMilestoneDefinition";
NSString *const kEsMxDestinyPresentationNodeDefinition = @"DestinyPresentationNodeDefinition";
NSString *const kEsMxDestinyPowerCapDefinition = @"DestinyPowerCapDefinition";
NSString *const kEsMxDestinyDestinationDefinition = @"DestinyDestinationDefinition";
NSString *const kEsMxDestinyInventoryItemLiteDefinition = @"DestinyInventoryItemLiteDefinition";
NSString *const kEsMxDestinyMetricDefinition = @"DestinyMetricDefinition";
NSString *const kEsMxDestinyRewardSheetDefinition = @"DestinyRewardSheetDefinition";
NSString *const kEsMxDestinyStatDefinition = @"DestinyStatDefinition";
NSString *const kEsMxDestinySackRewardItemListDefinition = @"DestinySackRewardItemListDefinition";
NSString *const kEsMxDestinyUnlockEventDefinition = @"DestinyUnlockEventDefinition";
NSString *const kEsMxDestinyMaterialRequirementSetDefinition = @"DestinyMaterialRequirementSetDefinition";
NSString *const kEsMxDestinyRaceDefinition = @"DestinyRaceDefinition";
NSString *const kEsMxDestinyClassDefinition = @"DestinyClassDefinition";
NSString *const kEsMxDestinyTalentGridDefinition = @"DestinyTalentGridDefinition";
NSString *const kEsMxDestinyUnlockDefinition = @"DestinyUnlockDefinition";
NSString *const kEsMxDestinyActivityTypeDefinition = @"DestinyActivityTypeDefinition";
NSString *const kEsMxDestinyEntitlementOfferDefinition = @"DestinyEntitlementOfferDefinition";
NSString *const kEsMxDestinyObjectiveDefinition = @"DestinyObjectiveDefinition";
NSString *const kEsMxDestinySocketCategoryDefinition = @"DestinySocketCategoryDefinition";
NSString *const kEsMxDestinyItemCategoryDefinition = @"DestinyItemCategoryDefinition";
NSString *const kEsMxDestinyArtifactDefinition = @"DestinyArtifactDefinition";
NSString *const kEsMxDestinyLocationDefinition = @"DestinyLocationDefinition";
NSString *const kEsMxDestinyChecklistDefinition = @"DestinyChecklistDefinition";
NSString *const kEsMxDestinySandboxPerkDefinition = @"DestinySandboxPerkDefinition";
NSString *const kEsMxDestinyPresentationNodeBaseDefinition = @"DestinyPresentationNodeBaseDefinition";
NSString *const kEsMxDestinyEnergyTypeDefinition = @"DestinyEnergyTypeDefinition";
NSString *const kEsMxDestinyActivityModeDefinition = @"DestinyActivityModeDefinition";
NSString *const kEsMxDestinyTraitCategoryDefinition = @"DestinyTraitCategoryDefinition";
NSString *const kEsMxDestinyArtDyeChannelDefinition = @"DestinyArtDyeChannelDefinition";
NSString *const kEsMxDestinyRewardItemListDefinition = @"DestinyRewardItemListDefinition";


@interface EsMx ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation EsMx

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
            self.destinyCharacterCustomizationOptionDefinition = [self objectOrNilForKey:kEsMxDestinyCharacterCustomizationOptionDefinition fromDictionary:dict];
            self.destinyProgressionDefinition = [self objectOrNilForKey:kEsMxDestinyProgressionDefinition fromDictionary:dict];
            self.destinyItemTierTypeDefinition = [self objectOrNilForKey:kEsMxDestinyItemTierTypeDefinition fromDictionary:dict];
            self.destinyActivityInteractableDefinition = [self objectOrNilForKey:kEsMxDestinyActivityInteractableDefinition fromDictionary:dict];
            self.destinyUnlockExpressionMappingDefinition = [self objectOrNilForKey:kEsMxDestinyUnlockExpressionMappingDefinition fromDictionary:dict];
            self.destinyEquipmentSlotDefinition = [self objectOrNilForKey:kEsMxDestinyEquipmentSlotDefinition fromDictionary:dict];
            self.destinyStatGroupDefinition = [self objectOrNilForKey:kEsMxDestinyStatGroupDefinition fromDictionary:dict];
            self.destinySeasonDefinition = [self objectOrNilForKey:kEsMxDestinySeasonDefinition fromDictionary:dict];
            self.destinyFactionDefinition = [self objectOrNilForKey:kEsMxDestinyFactionDefinition fromDictionary:dict];
            self.destinyUnlockValueDefinition = [self objectOrNilForKey:kEsMxDestinyUnlockValueDefinition fromDictionary:dict];
            self.destinyActivityDefinition = [self objectOrNilForKey:kEsMxDestinyActivityDefinition fromDictionary:dict];
            self.destinyEnemyRaceDefinition = [self objectOrNilForKey:kEsMxDestinyEnemyRaceDefinition fromDictionary:dict];
            self.destinySeasonPassDefinition = [self objectOrNilForKey:kEsMxDestinySeasonPassDefinition fromDictionary:dict];
            self.destinyVendorDefinition = [self objectOrNilForKey:kEsMxDestinyVendorDefinition fromDictionary:dict];
            self.destinyActivityGraphDefinition = [self objectOrNilForKey:kEsMxDestinyActivityGraphDefinition fromDictionary:dict];
            self.destinyProgressionMappingDefinition = [self objectOrNilForKey:kEsMxDestinyProgressionMappingDefinition fromDictionary:dict];
            self.destinyPlatformBucketMappingDefinition = [self objectOrNilForKey:kEsMxDestinyPlatformBucketMappingDefinition fromDictionary:dict];
            self.destinyAchievementDefinition = [self objectOrNilForKey:kEsMxDestinyAchievementDefinition fromDictionary:dict];
            self.destinyRewardAdjusterPointerDefinition = [self objectOrNilForKey:kEsMxDestinyRewardAdjusterPointerDefinition fromDictionary:dict];
            self.destinyRewardAdjusterProgressionMapDefinition = [self objectOrNilForKey:kEsMxDestinyRewardAdjusterProgressionMapDefinition fromDictionary:dict];
            self.destinyInventoryItemDefinition = [self objectOrNilForKey:kEsMxDestinyInventoryItemDefinition fromDictionary:dict];
            self.destinyPlaceDefinition = [self objectOrNilForKey:kEsMxDestinyPlaceDefinition fromDictionary:dict];
            self.destinyVendorGroupDefinition = [self objectOrNilForKey:kEsMxDestinyVendorGroupDefinition fromDictionary:dict];
            self.destinyTraitDefinition = [self objectOrNilForKey:kEsMxDestinyTraitDefinition fromDictionary:dict];
            self.destinyLoreDefinition = [self objectOrNilForKey:kEsMxDestinyLoreDefinition fromDictionary:dict];
            self.destinyDamageTypeDefinition = [self objectOrNilForKey:kEsMxDestinyDamageTypeDefinition fromDictionary:dict];
            self.destinyArtDyeReferenceDefinition = [self objectOrNilForKey:kEsMxDestinyArtDyeReferenceDefinition fromDictionary:dict];
            self.destinyMedalTierDefinition = [self objectOrNilForKey:kEsMxDestinyMedalTierDefinition fromDictionary:dict];
            self.destinyActivityModifierDefinition = [self objectOrNilForKey:kEsMxDestinyActivityModifierDefinition fromDictionary:dict];
            self.destinyInventoryBucketDefinition = [self objectOrNilForKey:kEsMxDestinyInventoryBucketDefinition fromDictionary:dict];
            self.destinyGenderDefinition = [self objectOrNilForKey:kEsMxDestinyGenderDefinition fromDictionary:dict];
            self.destinyBondDefinition = [self objectOrNilForKey:kEsMxDestinyBondDefinition fromDictionary:dict];
            self.destinyRecordDefinition = [self objectOrNilForKey:kEsMxDestinyRecordDefinition fromDictionary:dict];
            self.destinyRewardSourceDefinition = [self objectOrNilForKey:kEsMxDestinyRewardSourceDefinition fromDictionary:dict];
            self.destinyBreakerTypeDefinition = [self objectOrNilForKey:kEsMxDestinyBreakerTypeDefinition fromDictionary:dict];
            self.destinyCollectibleDefinition = [self objectOrNilForKey:kEsMxDestinyCollectibleDefinition fromDictionary:dict];
            self.destinyCharacterCustomizationCategoryDefinition = [self objectOrNilForKey:kEsMxDestinyCharacterCustomizationCategoryDefinition fromDictionary:dict];
            self.destinySandboxPatternDefinition = [self objectOrNilForKey:kEsMxDestinySandboxPatternDefinition fromDictionary:dict];
            self.destinyProgressionLevelRequirementDefinition = [self objectOrNilForKey:kEsMxDestinyProgressionLevelRequirementDefinition fromDictionary:dict];
            self.destinyRewardMappingDefinition = [self objectOrNilForKey:kEsMxDestinyRewardMappingDefinition fromDictionary:dict];
            self.destinyReportReasonCategoryDefinition = [self objectOrNilForKey:kEsMxDestinyReportReasonCategoryDefinition fromDictionary:dict];
            self.destinyPlugSetDefinition = [self objectOrNilForKey:kEsMxDestinyPlugSetDefinition fromDictionary:dict];
            self.destinyNodeStepSummaryDefinition = [self objectOrNilForKey:kEsMxDestinyNodeStepSummaryDefinition fromDictionary:dict];
            self.destinyUnlockCountMappingDefinition = [self objectOrNilForKey:kEsMxDestinyUnlockCountMappingDefinition fromDictionary:dict];
            self.destinySocketTypeDefinition = [self objectOrNilForKey:kEsMxDestinySocketTypeDefinition fromDictionary:dict];
            self.destinyMilestoneDefinition = [self objectOrNilForKey:kEsMxDestinyMilestoneDefinition fromDictionary:dict];
            self.destinyPresentationNodeDefinition = [self objectOrNilForKey:kEsMxDestinyPresentationNodeDefinition fromDictionary:dict];
            self.destinyPowerCapDefinition = [self objectOrNilForKey:kEsMxDestinyPowerCapDefinition fromDictionary:dict];
            self.destinyDestinationDefinition = [self objectOrNilForKey:kEsMxDestinyDestinationDefinition fromDictionary:dict];
            self.destinyInventoryItemLiteDefinition = [self objectOrNilForKey:kEsMxDestinyInventoryItemLiteDefinition fromDictionary:dict];
            self.destinyMetricDefinition = [self objectOrNilForKey:kEsMxDestinyMetricDefinition fromDictionary:dict];
            self.destinyRewardSheetDefinition = [self objectOrNilForKey:kEsMxDestinyRewardSheetDefinition fromDictionary:dict];
            self.destinyStatDefinition = [self objectOrNilForKey:kEsMxDestinyStatDefinition fromDictionary:dict];
            self.destinySackRewardItemListDefinition = [self objectOrNilForKey:kEsMxDestinySackRewardItemListDefinition fromDictionary:dict];
            self.destinyUnlockEventDefinition = [self objectOrNilForKey:kEsMxDestinyUnlockEventDefinition fromDictionary:dict];
            self.destinyMaterialRequirementSetDefinition = [self objectOrNilForKey:kEsMxDestinyMaterialRequirementSetDefinition fromDictionary:dict];
            self.destinyRaceDefinition = [self objectOrNilForKey:kEsMxDestinyRaceDefinition fromDictionary:dict];
            self.destinyClassDefinition = [self objectOrNilForKey:kEsMxDestinyClassDefinition fromDictionary:dict];
            self.destinyTalentGridDefinition = [self objectOrNilForKey:kEsMxDestinyTalentGridDefinition fromDictionary:dict];
            self.destinyUnlockDefinition = [self objectOrNilForKey:kEsMxDestinyUnlockDefinition fromDictionary:dict];
            self.destinyActivityTypeDefinition = [self objectOrNilForKey:kEsMxDestinyActivityTypeDefinition fromDictionary:dict];
            self.destinyEntitlementOfferDefinition = [self objectOrNilForKey:kEsMxDestinyEntitlementOfferDefinition fromDictionary:dict];
            self.destinyObjectiveDefinition = [self objectOrNilForKey:kEsMxDestinyObjectiveDefinition fromDictionary:dict];
            self.destinySocketCategoryDefinition = [self objectOrNilForKey:kEsMxDestinySocketCategoryDefinition fromDictionary:dict];
            self.destinyItemCategoryDefinition = [self objectOrNilForKey:kEsMxDestinyItemCategoryDefinition fromDictionary:dict];
            self.destinyArtifactDefinition = [self objectOrNilForKey:kEsMxDestinyArtifactDefinition fromDictionary:dict];
            self.destinyLocationDefinition = [self objectOrNilForKey:kEsMxDestinyLocationDefinition fromDictionary:dict];
            self.destinyChecklistDefinition = [self objectOrNilForKey:kEsMxDestinyChecklistDefinition fromDictionary:dict];
            self.destinySandboxPerkDefinition = [self objectOrNilForKey:kEsMxDestinySandboxPerkDefinition fromDictionary:dict];
            self.destinyPresentationNodeBaseDefinition = [self objectOrNilForKey:kEsMxDestinyPresentationNodeBaseDefinition fromDictionary:dict];
            self.destinyEnergyTypeDefinition = [self objectOrNilForKey:kEsMxDestinyEnergyTypeDefinition fromDictionary:dict];
            self.destinyActivityModeDefinition = [self objectOrNilForKey:kEsMxDestinyActivityModeDefinition fromDictionary:dict];
            self.destinyTraitCategoryDefinition = [self objectOrNilForKey:kEsMxDestinyTraitCategoryDefinition fromDictionary:dict];
            self.destinyArtDyeChannelDefinition = [self objectOrNilForKey:kEsMxDestinyArtDyeChannelDefinition fromDictionary:dict];
            self.destinyRewardItemListDefinition = [self objectOrNilForKey:kEsMxDestinyRewardItemListDefinition fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.destinyCharacterCustomizationOptionDefinition forKey:kEsMxDestinyCharacterCustomizationOptionDefinition];
    [mutableDict setValue:self.destinyProgressionDefinition forKey:kEsMxDestinyProgressionDefinition];
    [mutableDict setValue:self.destinyItemTierTypeDefinition forKey:kEsMxDestinyItemTierTypeDefinition];
    [mutableDict setValue:self.destinyActivityInteractableDefinition forKey:kEsMxDestinyActivityInteractableDefinition];
    [mutableDict setValue:self.destinyUnlockExpressionMappingDefinition forKey:kEsMxDestinyUnlockExpressionMappingDefinition];
    [mutableDict setValue:self.destinyEquipmentSlotDefinition forKey:kEsMxDestinyEquipmentSlotDefinition];
    [mutableDict setValue:self.destinyStatGroupDefinition forKey:kEsMxDestinyStatGroupDefinition];
    [mutableDict setValue:self.destinySeasonDefinition forKey:kEsMxDestinySeasonDefinition];
    [mutableDict setValue:self.destinyFactionDefinition forKey:kEsMxDestinyFactionDefinition];
    [mutableDict setValue:self.destinyUnlockValueDefinition forKey:kEsMxDestinyUnlockValueDefinition];
    [mutableDict setValue:self.destinyActivityDefinition forKey:kEsMxDestinyActivityDefinition];
    [mutableDict setValue:self.destinyEnemyRaceDefinition forKey:kEsMxDestinyEnemyRaceDefinition];
    [mutableDict setValue:self.destinySeasonPassDefinition forKey:kEsMxDestinySeasonPassDefinition];
    [mutableDict setValue:self.destinyVendorDefinition forKey:kEsMxDestinyVendorDefinition];
    [mutableDict setValue:self.destinyActivityGraphDefinition forKey:kEsMxDestinyActivityGraphDefinition];
    [mutableDict setValue:self.destinyProgressionMappingDefinition forKey:kEsMxDestinyProgressionMappingDefinition];
    [mutableDict setValue:self.destinyPlatformBucketMappingDefinition forKey:kEsMxDestinyPlatformBucketMappingDefinition];
    [mutableDict setValue:self.destinyAchievementDefinition forKey:kEsMxDestinyAchievementDefinition];
    [mutableDict setValue:self.destinyRewardAdjusterPointerDefinition forKey:kEsMxDestinyRewardAdjusterPointerDefinition];
    [mutableDict setValue:self.destinyRewardAdjusterProgressionMapDefinition forKey:kEsMxDestinyRewardAdjusterProgressionMapDefinition];
    [mutableDict setValue:self.destinyInventoryItemDefinition forKey:kEsMxDestinyInventoryItemDefinition];
    [mutableDict setValue:self.destinyPlaceDefinition forKey:kEsMxDestinyPlaceDefinition];
    [mutableDict setValue:self.destinyVendorGroupDefinition forKey:kEsMxDestinyVendorGroupDefinition];
    [mutableDict setValue:self.destinyTraitDefinition forKey:kEsMxDestinyTraitDefinition];
    [mutableDict setValue:self.destinyLoreDefinition forKey:kEsMxDestinyLoreDefinition];
    [mutableDict setValue:self.destinyDamageTypeDefinition forKey:kEsMxDestinyDamageTypeDefinition];
    [mutableDict setValue:self.destinyArtDyeReferenceDefinition forKey:kEsMxDestinyArtDyeReferenceDefinition];
    [mutableDict setValue:self.destinyMedalTierDefinition forKey:kEsMxDestinyMedalTierDefinition];
    [mutableDict setValue:self.destinyActivityModifierDefinition forKey:kEsMxDestinyActivityModifierDefinition];
    [mutableDict setValue:self.destinyInventoryBucketDefinition forKey:kEsMxDestinyInventoryBucketDefinition];
    [mutableDict setValue:self.destinyGenderDefinition forKey:kEsMxDestinyGenderDefinition];
    [mutableDict setValue:self.destinyBondDefinition forKey:kEsMxDestinyBondDefinition];
    [mutableDict setValue:self.destinyRecordDefinition forKey:kEsMxDestinyRecordDefinition];
    [mutableDict setValue:self.destinyRewardSourceDefinition forKey:kEsMxDestinyRewardSourceDefinition];
    [mutableDict setValue:self.destinyBreakerTypeDefinition forKey:kEsMxDestinyBreakerTypeDefinition];
    [mutableDict setValue:self.destinyCollectibleDefinition forKey:kEsMxDestinyCollectibleDefinition];
    [mutableDict setValue:self.destinyCharacterCustomizationCategoryDefinition forKey:kEsMxDestinyCharacterCustomizationCategoryDefinition];
    [mutableDict setValue:self.destinySandboxPatternDefinition forKey:kEsMxDestinySandboxPatternDefinition];
    [mutableDict setValue:self.destinyProgressionLevelRequirementDefinition forKey:kEsMxDestinyProgressionLevelRequirementDefinition];
    [mutableDict setValue:self.destinyRewardMappingDefinition forKey:kEsMxDestinyRewardMappingDefinition];
    [mutableDict setValue:self.destinyReportReasonCategoryDefinition forKey:kEsMxDestinyReportReasonCategoryDefinition];
    [mutableDict setValue:self.destinyPlugSetDefinition forKey:kEsMxDestinyPlugSetDefinition];
    [mutableDict setValue:self.destinyNodeStepSummaryDefinition forKey:kEsMxDestinyNodeStepSummaryDefinition];
    [mutableDict setValue:self.destinyUnlockCountMappingDefinition forKey:kEsMxDestinyUnlockCountMappingDefinition];
    [mutableDict setValue:self.destinySocketTypeDefinition forKey:kEsMxDestinySocketTypeDefinition];
    [mutableDict setValue:self.destinyMilestoneDefinition forKey:kEsMxDestinyMilestoneDefinition];
    [mutableDict setValue:self.destinyPresentationNodeDefinition forKey:kEsMxDestinyPresentationNodeDefinition];
    [mutableDict setValue:self.destinyPowerCapDefinition forKey:kEsMxDestinyPowerCapDefinition];
    [mutableDict setValue:self.destinyDestinationDefinition forKey:kEsMxDestinyDestinationDefinition];
    [mutableDict setValue:self.destinyInventoryItemLiteDefinition forKey:kEsMxDestinyInventoryItemLiteDefinition];
    [mutableDict setValue:self.destinyMetricDefinition forKey:kEsMxDestinyMetricDefinition];
    [mutableDict setValue:self.destinyRewardSheetDefinition forKey:kEsMxDestinyRewardSheetDefinition];
    [mutableDict setValue:self.destinyStatDefinition forKey:kEsMxDestinyStatDefinition];
    [mutableDict setValue:self.destinySackRewardItemListDefinition forKey:kEsMxDestinySackRewardItemListDefinition];
    [mutableDict setValue:self.destinyUnlockEventDefinition forKey:kEsMxDestinyUnlockEventDefinition];
    [mutableDict setValue:self.destinyMaterialRequirementSetDefinition forKey:kEsMxDestinyMaterialRequirementSetDefinition];
    [mutableDict setValue:self.destinyRaceDefinition forKey:kEsMxDestinyRaceDefinition];
    [mutableDict setValue:self.destinyClassDefinition forKey:kEsMxDestinyClassDefinition];
    [mutableDict setValue:self.destinyTalentGridDefinition forKey:kEsMxDestinyTalentGridDefinition];
    [mutableDict setValue:self.destinyUnlockDefinition forKey:kEsMxDestinyUnlockDefinition];
    [mutableDict setValue:self.destinyActivityTypeDefinition forKey:kEsMxDestinyActivityTypeDefinition];
    [mutableDict setValue:self.destinyEntitlementOfferDefinition forKey:kEsMxDestinyEntitlementOfferDefinition];
    [mutableDict setValue:self.destinyObjectiveDefinition forKey:kEsMxDestinyObjectiveDefinition];
    [mutableDict setValue:self.destinySocketCategoryDefinition forKey:kEsMxDestinySocketCategoryDefinition];
    [mutableDict setValue:self.destinyItemCategoryDefinition forKey:kEsMxDestinyItemCategoryDefinition];
    [mutableDict setValue:self.destinyArtifactDefinition forKey:kEsMxDestinyArtifactDefinition];
    [mutableDict setValue:self.destinyLocationDefinition forKey:kEsMxDestinyLocationDefinition];
    [mutableDict setValue:self.destinyChecklistDefinition forKey:kEsMxDestinyChecklistDefinition];
    [mutableDict setValue:self.destinySandboxPerkDefinition forKey:kEsMxDestinySandboxPerkDefinition];
    [mutableDict setValue:self.destinyPresentationNodeBaseDefinition forKey:kEsMxDestinyPresentationNodeBaseDefinition];
    [mutableDict setValue:self.destinyEnergyTypeDefinition forKey:kEsMxDestinyEnergyTypeDefinition];
    [mutableDict setValue:self.destinyActivityModeDefinition forKey:kEsMxDestinyActivityModeDefinition];
    [mutableDict setValue:self.destinyTraitCategoryDefinition forKey:kEsMxDestinyTraitCategoryDefinition];
    [mutableDict setValue:self.destinyArtDyeChannelDefinition forKey:kEsMxDestinyArtDyeChannelDefinition];
    [mutableDict setValue:self.destinyRewardItemListDefinition forKey:kEsMxDestinyRewardItemListDefinition];

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

    self.destinyCharacterCustomizationOptionDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyCharacterCustomizationOptionDefinition];
    self.destinyProgressionDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyProgressionDefinition];
    self.destinyItemTierTypeDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyItemTierTypeDefinition];
    self.destinyActivityInteractableDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyActivityInteractableDefinition];
    self.destinyUnlockExpressionMappingDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyUnlockExpressionMappingDefinition];
    self.destinyEquipmentSlotDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyEquipmentSlotDefinition];
    self.destinyStatGroupDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyStatGroupDefinition];
    self.destinySeasonDefinition = [aDecoder decodeObjectForKey:kEsMxDestinySeasonDefinition];
    self.destinyFactionDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyFactionDefinition];
    self.destinyUnlockValueDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyUnlockValueDefinition];
    self.destinyActivityDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyActivityDefinition];
    self.destinyEnemyRaceDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyEnemyRaceDefinition];
    self.destinySeasonPassDefinition = [aDecoder decodeObjectForKey:kEsMxDestinySeasonPassDefinition];
    self.destinyVendorDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyVendorDefinition];
    self.destinyActivityGraphDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyActivityGraphDefinition];
    self.destinyProgressionMappingDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyProgressionMappingDefinition];
    self.destinyPlatformBucketMappingDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyPlatformBucketMappingDefinition];
    self.destinyAchievementDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyAchievementDefinition];
    self.destinyRewardAdjusterPointerDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyRewardAdjusterPointerDefinition];
    self.destinyRewardAdjusterProgressionMapDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyRewardAdjusterProgressionMapDefinition];
    self.destinyInventoryItemDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyInventoryItemDefinition];
    self.destinyPlaceDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyPlaceDefinition];
    self.destinyVendorGroupDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyVendorGroupDefinition];
    self.destinyTraitDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyTraitDefinition];
    self.destinyLoreDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyLoreDefinition];
    self.destinyDamageTypeDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyDamageTypeDefinition];
    self.destinyArtDyeReferenceDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyArtDyeReferenceDefinition];
    self.destinyMedalTierDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyMedalTierDefinition];
    self.destinyActivityModifierDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyActivityModifierDefinition];
    self.destinyInventoryBucketDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyInventoryBucketDefinition];
    self.destinyGenderDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyGenderDefinition];
    self.destinyBondDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyBondDefinition];
    self.destinyRecordDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyRecordDefinition];
    self.destinyRewardSourceDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyRewardSourceDefinition];
    self.destinyBreakerTypeDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyBreakerTypeDefinition];
    self.destinyCollectibleDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyCollectibleDefinition];
    self.destinyCharacterCustomizationCategoryDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyCharacterCustomizationCategoryDefinition];
    self.destinySandboxPatternDefinition = [aDecoder decodeObjectForKey:kEsMxDestinySandboxPatternDefinition];
    self.destinyProgressionLevelRequirementDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyProgressionLevelRequirementDefinition];
    self.destinyRewardMappingDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyRewardMappingDefinition];
    self.destinyReportReasonCategoryDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyReportReasonCategoryDefinition];
    self.destinyPlugSetDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyPlugSetDefinition];
    self.destinyNodeStepSummaryDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyNodeStepSummaryDefinition];
    self.destinyUnlockCountMappingDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyUnlockCountMappingDefinition];
    self.destinySocketTypeDefinition = [aDecoder decodeObjectForKey:kEsMxDestinySocketTypeDefinition];
    self.destinyMilestoneDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyMilestoneDefinition];
    self.destinyPresentationNodeDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyPresentationNodeDefinition];
    self.destinyPowerCapDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyPowerCapDefinition];
    self.destinyDestinationDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyDestinationDefinition];
    self.destinyInventoryItemLiteDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyInventoryItemLiteDefinition];
    self.destinyMetricDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyMetricDefinition];
    self.destinyRewardSheetDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyRewardSheetDefinition];
    self.destinyStatDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyStatDefinition];
    self.destinySackRewardItemListDefinition = [aDecoder decodeObjectForKey:kEsMxDestinySackRewardItemListDefinition];
    self.destinyUnlockEventDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyUnlockEventDefinition];
    self.destinyMaterialRequirementSetDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyMaterialRequirementSetDefinition];
    self.destinyRaceDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyRaceDefinition];
    self.destinyClassDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyClassDefinition];
    self.destinyTalentGridDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyTalentGridDefinition];
    self.destinyUnlockDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyUnlockDefinition];
    self.destinyActivityTypeDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyActivityTypeDefinition];
    self.destinyEntitlementOfferDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyEntitlementOfferDefinition];
    self.destinyObjectiveDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyObjectiveDefinition];
    self.destinySocketCategoryDefinition = [aDecoder decodeObjectForKey:kEsMxDestinySocketCategoryDefinition];
    self.destinyItemCategoryDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyItemCategoryDefinition];
    self.destinyArtifactDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyArtifactDefinition];
    self.destinyLocationDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyLocationDefinition];
    self.destinyChecklistDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyChecklistDefinition];
    self.destinySandboxPerkDefinition = [aDecoder decodeObjectForKey:kEsMxDestinySandboxPerkDefinition];
    self.destinyPresentationNodeBaseDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyPresentationNodeBaseDefinition];
    self.destinyEnergyTypeDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyEnergyTypeDefinition];
    self.destinyActivityModeDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyActivityModeDefinition];
    self.destinyTraitCategoryDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyTraitCategoryDefinition];
    self.destinyArtDyeChannelDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyArtDyeChannelDefinition];
    self.destinyRewardItemListDefinition = [aDecoder decodeObjectForKey:kEsMxDestinyRewardItemListDefinition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_destinyCharacterCustomizationOptionDefinition forKey:kEsMxDestinyCharacterCustomizationOptionDefinition];
    [aCoder encodeObject:_destinyProgressionDefinition forKey:kEsMxDestinyProgressionDefinition];
    [aCoder encodeObject:_destinyItemTierTypeDefinition forKey:kEsMxDestinyItemTierTypeDefinition];
    [aCoder encodeObject:_destinyActivityInteractableDefinition forKey:kEsMxDestinyActivityInteractableDefinition];
    [aCoder encodeObject:_destinyUnlockExpressionMappingDefinition forKey:kEsMxDestinyUnlockExpressionMappingDefinition];
    [aCoder encodeObject:_destinyEquipmentSlotDefinition forKey:kEsMxDestinyEquipmentSlotDefinition];
    [aCoder encodeObject:_destinyStatGroupDefinition forKey:kEsMxDestinyStatGroupDefinition];
    [aCoder encodeObject:_destinySeasonDefinition forKey:kEsMxDestinySeasonDefinition];
    [aCoder encodeObject:_destinyFactionDefinition forKey:kEsMxDestinyFactionDefinition];
    [aCoder encodeObject:_destinyUnlockValueDefinition forKey:kEsMxDestinyUnlockValueDefinition];
    [aCoder encodeObject:_destinyActivityDefinition forKey:kEsMxDestinyActivityDefinition];
    [aCoder encodeObject:_destinyEnemyRaceDefinition forKey:kEsMxDestinyEnemyRaceDefinition];
    [aCoder encodeObject:_destinySeasonPassDefinition forKey:kEsMxDestinySeasonPassDefinition];
    [aCoder encodeObject:_destinyVendorDefinition forKey:kEsMxDestinyVendorDefinition];
    [aCoder encodeObject:_destinyActivityGraphDefinition forKey:kEsMxDestinyActivityGraphDefinition];
    [aCoder encodeObject:_destinyProgressionMappingDefinition forKey:kEsMxDestinyProgressionMappingDefinition];
    [aCoder encodeObject:_destinyPlatformBucketMappingDefinition forKey:kEsMxDestinyPlatformBucketMappingDefinition];
    [aCoder encodeObject:_destinyAchievementDefinition forKey:kEsMxDestinyAchievementDefinition];
    [aCoder encodeObject:_destinyRewardAdjusterPointerDefinition forKey:kEsMxDestinyRewardAdjusterPointerDefinition];
    [aCoder encodeObject:_destinyRewardAdjusterProgressionMapDefinition forKey:kEsMxDestinyRewardAdjusterProgressionMapDefinition];
    [aCoder encodeObject:_destinyInventoryItemDefinition forKey:kEsMxDestinyInventoryItemDefinition];
    [aCoder encodeObject:_destinyPlaceDefinition forKey:kEsMxDestinyPlaceDefinition];
    [aCoder encodeObject:_destinyVendorGroupDefinition forKey:kEsMxDestinyVendorGroupDefinition];
    [aCoder encodeObject:_destinyTraitDefinition forKey:kEsMxDestinyTraitDefinition];
    [aCoder encodeObject:_destinyLoreDefinition forKey:kEsMxDestinyLoreDefinition];
    [aCoder encodeObject:_destinyDamageTypeDefinition forKey:kEsMxDestinyDamageTypeDefinition];
    [aCoder encodeObject:_destinyArtDyeReferenceDefinition forKey:kEsMxDestinyArtDyeReferenceDefinition];
    [aCoder encodeObject:_destinyMedalTierDefinition forKey:kEsMxDestinyMedalTierDefinition];
    [aCoder encodeObject:_destinyActivityModifierDefinition forKey:kEsMxDestinyActivityModifierDefinition];
    [aCoder encodeObject:_destinyInventoryBucketDefinition forKey:kEsMxDestinyInventoryBucketDefinition];
    [aCoder encodeObject:_destinyGenderDefinition forKey:kEsMxDestinyGenderDefinition];
    [aCoder encodeObject:_destinyBondDefinition forKey:kEsMxDestinyBondDefinition];
    [aCoder encodeObject:_destinyRecordDefinition forKey:kEsMxDestinyRecordDefinition];
    [aCoder encodeObject:_destinyRewardSourceDefinition forKey:kEsMxDestinyRewardSourceDefinition];
    [aCoder encodeObject:_destinyBreakerTypeDefinition forKey:kEsMxDestinyBreakerTypeDefinition];
    [aCoder encodeObject:_destinyCollectibleDefinition forKey:kEsMxDestinyCollectibleDefinition];
    [aCoder encodeObject:_destinyCharacterCustomizationCategoryDefinition forKey:kEsMxDestinyCharacterCustomizationCategoryDefinition];
    [aCoder encodeObject:_destinySandboxPatternDefinition forKey:kEsMxDestinySandboxPatternDefinition];
    [aCoder encodeObject:_destinyProgressionLevelRequirementDefinition forKey:kEsMxDestinyProgressionLevelRequirementDefinition];
    [aCoder encodeObject:_destinyRewardMappingDefinition forKey:kEsMxDestinyRewardMappingDefinition];
    [aCoder encodeObject:_destinyReportReasonCategoryDefinition forKey:kEsMxDestinyReportReasonCategoryDefinition];
    [aCoder encodeObject:_destinyPlugSetDefinition forKey:kEsMxDestinyPlugSetDefinition];
    [aCoder encodeObject:_destinyNodeStepSummaryDefinition forKey:kEsMxDestinyNodeStepSummaryDefinition];
    [aCoder encodeObject:_destinyUnlockCountMappingDefinition forKey:kEsMxDestinyUnlockCountMappingDefinition];
    [aCoder encodeObject:_destinySocketTypeDefinition forKey:kEsMxDestinySocketTypeDefinition];
    [aCoder encodeObject:_destinyMilestoneDefinition forKey:kEsMxDestinyMilestoneDefinition];
    [aCoder encodeObject:_destinyPresentationNodeDefinition forKey:kEsMxDestinyPresentationNodeDefinition];
    [aCoder encodeObject:_destinyPowerCapDefinition forKey:kEsMxDestinyPowerCapDefinition];
    [aCoder encodeObject:_destinyDestinationDefinition forKey:kEsMxDestinyDestinationDefinition];
    [aCoder encodeObject:_destinyInventoryItemLiteDefinition forKey:kEsMxDestinyInventoryItemLiteDefinition];
    [aCoder encodeObject:_destinyMetricDefinition forKey:kEsMxDestinyMetricDefinition];
    [aCoder encodeObject:_destinyRewardSheetDefinition forKey:kEsMxDestinyRewardSheetDefinition];
    [aCoder encodeObject:_destinyStatDefinition forKey:kEsMxDestinyStatDefinition];
    [aCoder encodeObject:_destinySackRewardItemListDefinition forKey:kEsMxDestinySackRewardItemListDefinition];
    [aCoder encodeObject:_destinyUnlockEventDefinition forKey:kEsMxDestinyUnlockEventDefinition];
    [aCoder encodeObject:_destinyMaterialRequirementSetDefinition forKey:kEsMxDestinyMaterialRequirementSetDefinition];
    [aCoder encodeObject:_destinyRaceDefinition forKey:kEsMxDestinyRaceDefinition];
    [aCoder encodeObject:_destinyClassDefinition forKey:kEsMxDestinyClassDefinition];
    [aCoder encodeObject:_destinyTalentGridDefinition forKey:kEsMxDestinyTalentGridDefinition];
    [aCoder encodeObject:_destinyUnlockDefinition forKey:kEsMxDestinyUnlockDefinition];
    [aCoder encodeObject:_destinyActivityTypeDefinition forKey:kEsMxDestinyActivityTypeDefinition];
    [aCoder encodeObject:_destinyEntitlementOfferDefinition forKey:kEsMxDestinyEntitlementOfferDefinition];
    [aCoder encodeObject:_destinyObjectiveDefinition forKey:kEsMxDestinyObjectiveDefinition];
    [aCoder encodeObject:_destinySocketCategoryDefinition forKey:kEsMxDestinySocketCategoryDefinition];
    [aCoder encodeObject:_destinyItemCategoryDefinition forKey:kEsMxDestinyItemCategoryDefinition];
    [aCoder encodeObject:_destinyArtifactDefinition forKey:kEsMxDestinyArtifactDefinition];
    [aCoder encodeObject:_destinyLocationDefinition forKey:kEsMxDestinyLocationDefinition];
    [aCoder encodeObject:_destinyChecklistDefinition forKey:kEsMxDestinyChecklistDefinition];
    [aCoder encodeObject:_destinySandboxPerkDefinition forKey:kEsMxDestinySandboxPerkDefinition];
    [aCoder encodeObject:_destinyPresentationNodeBaseDefinition forKey:kEsMxDestinyPresentationNodeBaseDefinition];
    [aCoder encodeObject:_destinyEnergyTypeDefinition forKey:kEsMxDestinyEnergyTypeDefinition];
    [aCoder encodeObject:_destinyActivityModeDefinition forKey:kEsMxDestinyActivityModeDefinition];
    [aCoder encodeObject:_destinyTraitCategoryDefinition forKey:kEsMxDestinyTraitCategoryDefinition];
    [aCoder encodeObject:_destinyArtDyeChannelDefinition forKey:kEsMxDestinyArtDyeChannelDefinition];
    [aCoder encodeObject:_destinyRewardItemListDefinition forKey:kEsMxDestinyRewardItemListDefinition];
}

- (id)copyWithZone:(NSZone *)zone
{
    EsMx *copy = [[EsMx alloc] init];
    
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
