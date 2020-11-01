//
//  GRDStats.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GRDSTATSTRENGTH, GRDSTATLIGHT, GRDSTATDEFENSE, GRDSTATDISCIPLINE, GRDSTATAGILITY, GRDSTATINTELLECT, GRDSTATRECOVERY, GRDSTATOPTICS, GRDSTATARMOR;

@interface GRDStats : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) GRDSTATSTRENGTH *sTATSTRENGTH;
@property (nonatomic, strong) GRDSTATLIGHT *sTATLIGHT;
@property (nonatomic, strong) GRDSTATDEFENSE *sTATDEFENSE;
@property (nonatomic, strong) GRDSTATDISCIPLINE *sTATDISCIPLINE;
@property (nonatomic, strong) GRDSTATAGILITY *sTATAGILITY;
@property (nonatomic, strong) GRDSTATINTELLECT *sTATINTELLECT;
@property (nonatomic, strong) GRDSTATRECOVERY *sTATRECOVERY;
@property (nonatomic, strong) GRDSTATOPTICS *sTATOPTICS;
@property (nonatomic, strong) GRDSTATARMOR *sTATARMOR;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
