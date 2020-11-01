//
//  En.h
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface En : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *destinyCharacterCustomizationOptionDefinition;
@property (nonatomic, strong) NSString *destinyProgressionDefinition;
@property (nonatomic, strong) NSString *destinyItemTierTypeDefinition;
@property (nonatomic, strong) NSString *destinyActivityInteractableDefinition;
@property (nonatomic, strong) NSString *destinyUnlockExpressionMappingDefinition;
@property (nonatomic, strong) NSString *destinyEquipmentSlotDefinition;
@property (nonatomic, strong) NSString *destinyStatGroupDefinition;
@property (nonatomic, strong) NSString *destinySeasonDefinition;
@property (nonatomic, strong) NSString *destinyFactionDefinition;
@property (nonatomic, strong) NSString *destinyUnlockValueDefinition;
@property (nonatomic, strong) NSString *destinyActivityDefinition;
@property (nonatomic, strong) NSString *destinyEnemyRaceDefinition;
@property (nonatomic, strong) NSString *destinySeasonPassDefinition;
@property (nonatomic, strong) NSString *destinyVendorDefinition;
@property (nonatomic, strong) NSString *destinyActivityGraphDefinition;
@property (nonatomic, strong) NSString *destinyProgressionMappingDefinition;
@property (nonatomic, strong) NSString *destinyPlatformBucketMappingDefinition;
@property (nonatomic, strong) NSString *destinyAchievementDefinition;
@property (nonatomic, strong) NSString *destinyRewardAdjusterPointerDefinition;
@property (nonatomic, strong) NSString *destinyRewardAdjusterProgressionMapDefinition;
@property (nonatomic, strong) NSString *destinyInventoryItemDefinition;
@property (nonatomic, strong) NSString *destinyPlaceDefinition;
@property (nonatomic, strong) NSString *destinyVendorGroupDefinition;
@property (nonatomic, strong) NSString *destinyTraitDefinition;
@property (nonatomic, strong) NSString *destinyLoreDefinition;
@property (nonatomic, strong) NSString *destinyDamageTypeDefinition;
@property (nonatomic, strong) NSString *destinyArtDyeReferenceDefinition;
@property (nonatomic, strong) NSString *destinyMedalTierDefinition;
@property (nonatomic, strong) NSString *destinyActivityModifierDefinition;
@property (nonatomic, strong) NSString *destinyInventoryBucketDefinition;
@property (nonatomic, strong) NSString *destinyGenderDefinition;
@property (nonatomic, strong) NSString *destinyBondDefinition;
@property (nonatomic, strong) NSString *destinyRecordDefinition;
@property (nonatomic, strong) NSString *destinyRewardSourceDefinition;
@property (nonatomic, strong) NSString *destinyBreakerTypeDefinition;
@property (nonatomic, strong) NSString *destinyCollectibleDefinition;
@property (nonatomic, strong) NSString *destinyCharacterCustomizationCategoryDefinition;
@property (nonatomic, strong) NSString *destinySandboxPatternDefinition;
@property (nonatomic, strong) NSString *destinyProgressionLevelRequirementDefinition;
@property (nonatomic, strong) NSString *destinyRewardMappingDefinition;
@property (nonatomic, strong) NSString *destinyReportReasonCategoryDefinition;
@property (nonatomic, strong) NSString *destinyPlugSetDefinition;
@property (nonatomic, strong) NSString *destinyNodeStepSummaryDefinition;
@property (nonatomic, strong) NSString *destinyUnlockCountMappingDefinition;
@property (nonatomic, strong) NSString *destinySocketTypeDefinition;
@property (nonatomic, strong) NSString *destinyMilestoneDefinition;
@property (nonatomic, strong) NSString *destinyPresentationNodeDefinition;
@property (nonatomic, strong) NSString *destinyPowerCapDefinition;
@property (nonatomic, strong) NSString *destinyDestinationDefinition;
@property (nonatomic, strong) NSString *destinyInventoryItemLiteDefinition;
@property (nonatomic, strong) NSString *destinyMetricDefinition;
@property (nonatomic, strong) NSString *destinyRewardSheetDefinition;
@property (nonatomic, strong) NSString *destinyStatDefinition;
@property (nonatomic, strong) NSString *destinySackRewardItemListDefinition;
@property (nonatomic, strong) NSString *destinyUnlockEventDefinition;
@property (nonatomic, strong) NSString *destinyMaterialRequirementSetDefinition;
@property (nonatomic, strong) NSString *destinyRaceDefinition;
@property (nonatomic, strong) NSString *destinyClassDefinition;
@property (nonatomic, strong) NSString *destinyTalentGridDefinition;
@property (nonatomic, strong) NSString *destinyUnlockDefinition;
@property (nonatomic, strong) NSString *destinyActivityTypeDefinition;
@property (nonatomic, strong) NSString *destinyEntitlementOfferDefinition;
@property (nonatomic, strong) NSString *destinyObjectiveDefinition;
@property (nonatomic, strong) NSString *destinySocketCategoryDefinition;
@property (nonatomic, strong) NSString *destinyItemCategoryDefinition;
@property (nonatomic, strong) NSString *destinyArtifactDefinition;
@property (nonatomic, strong) NSString *destinyLocationDefinition;
@property (nonatomic, strong) NSString *destinyChecklistDefinition;
@property (nonatomic, strong) NSString *destinySandboxPerkDefinition;
@property (nonatomic, strong) NSString *destinyPresentationNodeBaseDefinition;
@property (nonatomic, strong) NSString *destinyEnergyTypeDefinition;
@property (nonatomic, strong) NSString *destinyActivityModeDefinition;
@property (nonatomic, strong) NSString *destinyTraitCategoryDefinition;
@property (nonatomic, strong) NSString *destinyArtDyeChannelDefinition;
@property (nonatomic, strong) NSString *destinyRewardItemListDefinition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
