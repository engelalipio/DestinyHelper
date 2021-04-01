//
//  GRDStats.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDStats.h"
#import "GRDSTATSTRENGTH.h"
#import "GRDSTATLIGHT.h"
#import "GRDSTATDEFENSE.h"
#import "GRDSTATDISCIPLINE.h"
#import "GRDSTATAGILITY.h"
#import "GRDSTATINTELLECT.h"
#import "GRDSTATRECOVERY.h"
#import "GRDSTATOPTICS.h"
#import "GRDSTATARMOR.h"


NSString *const kGRDStatsSTATSTRENGTH = @"STAT_STRENGTH";
NSString *const kGRDStatsSTATLIGHT = @"STAT_LIGHT";
NSString *const kGRDStatsSTATDEFENSE = @"STAT_DEFENSE";
NSString *const kGRDStatsSTATDISCIPLINE = @"STAT_DISCIPLINE";
NSString *const kGRDStatsSTATAGILITY = @"STAT_AGILITY";
NSString *const kGRDStatsSTATINTELLECT = @"STAT_INTELLECT";
NSString *const kGRDStatsSTATRECOVERY = @"STAT_RECOVERY";
NSString *const kGRDStatsSTATOPTICS = @"STAT_OPTICS";
NSString *const kGRDStatsSTATARMOR = @"STAT_ARMOR";


@interface GRDStats ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDStats

@synthesize sTATSTRENGTH = _sTATSTRENGTH;
@synthesize sTATLIGHT = _sTATLIGHT;
@synthesize sTATDEFENSE = _sTATDEFENSE;
@synthesize sTATDISCIPLINE = _sTATDISCIPLINE;
@synthesize sTATAGILITY = _sTATAGILITY;
@synthesize sTATINTELLECT = _sTATINTELLECT;
@synthesize sTATRECOVERY = _sTATRECOVERY;
@synthesize sTATOPTICS = _sTATOPTICS;
@synthesize sTATARMOR = _sTATARMOR;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGRDStatsSTATLIGHT,@"STAT_LIGHT",
                         nil];
    
    return map;
}

+ (NSString *)key{
    return nil;
}

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
            self.sTATSTRENGTH = [GRDSTATSTRENGTH modelObjectWithDictionary:[dict objectForKey:kGRDStatsSTATSTRENGTH]];
            self.sTATLIGHT = [GRDSTATLIGHT modelObjectWithDictionary:[dict objectForKey:kGRDStatsSTATLIGHT]];
            self.sTATDEFENSE = [GRDSTATDEFENSE modelObjectWithDictionary:[dict objectForKey:kGRDStatsSTATDEFENSE]];
            self.sTATDISCIPLINE = [GRDSTATDISCIPLINE modelObjectWithDictionary:[dict objectForKey:kGRDStatsSTATDISCIPLINE]];
            self.sTATAGILITY = [GRDSTATAGILITY modelObjectWithDictionary:[dict objectForKey:kGRDStatsSTATAGILITY]];
            self.sTATINTELLECT = [GRDSTATINTELLECT modelObjectWithDictionary:[dict objectForKey:kGRDStatsSTATINTELLECT]];
            self.sTATRECOVERY = [GRDSTATRECOVERY modelObjectWithDictionary:[dict objectForKey:kGRDStatsSTATRECOVERY]];
            self.sTATOPTICS = [GRDSTATOPTICS modelObjectWithDictionary:[dict objectForKey:kGRDStatsSTATOPTICS]];
            self.sTATARMOR = [GRDSTATARMOR modelObjectWithDictionary:[dict objectForKey:kGRDStatsSTATARMOR]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.sTATSTRENGTH dictionaryRepresentation] forKey:kGRDStatsSTATSTRENGTH];
    [mutableDict setValue:[self.sTATLIGHT dictionaryRepresentation] forKey:kGRDStatsSTATLIGHT];
    [mutableDict setValue:[self.sTATDEFENSE dictionaryRepresentation] forKey:kGRDStatsSTATDEFENSE];
    [mutableDict setValue:[self.sTATDISCIPLINE dictionaryRepresentation] forKey:kGRDStatsSTATDISCIPLINE];
    [mutableDict setValue:[self.sTATAGILITY dictionaryRepresentation] forKey:kGRDStatsSTATAGILITY];
    [mutableDict setValue:[self.sTATINTELLECT dictionaryRepresentation] forKey:kGRDStatsSTATINTELLECT];
    [mutableDict setValue:[self.sTATRECOVERY dictionaryRepresentation] forKey:kGRDStatsSTATRECOVERY];
    [mutableDict setValue:[self.sTATOPTICS dictionaryRepresentation] forKey:kGRDStatsSTATOPTICS];
    [mutableDict setValue:[self.sTATARMOR dictionaryRepresentation] forKey:kGRDStatsSTATARMOR];

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

    self.sTATSTRENGTH = [aDecoder decodeObjectForKey:kGRDStatsSTATSTRENGTH];
    self.sTATLIGHT = [aDecoder decodeObjectForKey:kGRDStatsSTATLIGHT];
    self.sTATDEFENSE = [aDecoder decodeObjectForKey:kGRDStatsSTATDEFENSE];
    self.sTATDISCIPLINE = [aDecoder decodeObjectForKey:kGRDStatsSTATDISCIPLINE];
    self.sTATAGILITY = [aDecoder decodeObjectForKey:kGRDStatsSTATAGILITY];
    self.sTATINTELLECT = [aDecoder decodeObjectForKey:kGRDStatsSTATINTELLECT];
    self.sTATRECOVERY = [aDecoder decodeObjectForKey:kGRDStatsSTATRECOVERY];
    self.sTATOPTICS = [aDecoder decodeObjectForKey:kGRDStatsSTATOPTICS];
    self.sTATARMOR = [aDecoder decodeObjectForKey:kGRDStatsSTATARMOR];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sTATSTRENGTH forKey:kGRDStatsSTATSTRENGTH];
    [aCoder encodeObject:_sTATLIGHT forKey:kGRDStatsSTATLIGHT];
    [aCoder encodeObject:_sTATDEFENSE forKey:kGRDStatsSTATDEFENSE];
    [aCoder encodeObject:_sTATDISCIPLINE forKey:kGRDStatsSTATDISCIPLINE];
    [aCoder encodeObject:_sTATAGILITY forKey:kGRDStatsSTATAGILITY];
    [aCoder encodeObject:_sTATINTELLECT forKey:kGRDStatsSTATINTELLECT];
    [aCoder encodeObject:_sTATRECOVERY forKey:kGRDStatsSTATRECOVERY];
    [aCoder encodeObject:_sTATOPTICS forKey:kGRDStatsSTATOPTICS];
    [aCoder encodeObject:_sTATARMOR forKey:kGRDStatsSTATARMOR];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDStats *copy = [[GRDStats alloc] init];
    
    if (copy) {

        copy.sTATSTRENGTH = [self.sTATSTRENGTH copyWithZone:zone];
        copy.sTATLIGHT = [self.sTATLIGHT copyWithZone:zone];
        copy.sTATDEFENSE = [self.sTATDEFENSE copyWithZone:zone];
        copy.sTATDISCIPLINE = [self.sTATDISCIPLINE copyWithZone:zone];
        copy.sTATAGILITY = [self.sTATAGILITY copyWithZone:zone];
        copy.sTATINTELLECT = [self.sTATINTELLECT copyWithZone:zone];
        copy.sTATRECOVERY = [self.sTATRECOVERY copyWithZone:zone];
        copy.sTATOPTICS = [self.sTATOPTICS copyWithZone:zone];
        copy.sTATARMOR = [self.sTATARMOR copyWithZone:zone];
    }
    
    return copy;
}


@end
