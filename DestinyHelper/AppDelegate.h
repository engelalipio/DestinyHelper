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
    Unknown = 3
};

enum Destiny2GenderType{
    Male = 0,
    Female = 1,
    Unkown = 2
};

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (assign,nonatomic) NSInteger interval;

@property (assign,nonatomic) BOOL isManifestLoaded;

@property (assign,nonatomic) BOOL isCharsLoaded;

@property (assign,nonatomic) BOOL isOffLine;

@property (assign,nonatomic) NSArray *destinyMemberships;

@property (assign,nonatomic) NSArray *destinyCharacters;

@property (assign,nonatomic) USRResponse *currentProfile;

@property (assign,nonatomic) MBRResponse *currentMembership;

@property (strong,nonatomic) NSDictionary *destinyManifest;

@property (strong,nonatomic) NSDictionary *destinyClassDefinitions;

@property (strong,nonatomic) NSDictionary *destinyGenderDefinitions;

@property (assign,nonatomic) NSString *currentLocale;

+(AppDelegate *) currentDelegate;


@end

