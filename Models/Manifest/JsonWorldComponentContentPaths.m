//
//  JsonWorldComponentContentPaths.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "JsonWorldComponentContentPaths.h"
#import "Ko.h"
#import "Ja.h"
#import "EsMx.h"
#import "Fr.h"
#import "It.h"
#import "ZhCht.h"
#import "Ru.h"
#import "PtBr.h"
#import "En.h"
#import "Es.h"
#import "Pl.h"
#import "De.h"
#import "ZhChs.h"


NSString *const kJsonWorldComponentContentPathsKo = @"ko";
NSString *const kJsonWorldComponentContentPathsJa = @"ja";
NSString *const kJsonWorldComponentContentPathsEsMx = @"es-mx";
NSString *const kJsonWorldComponentContentPathsFr = @"fr";
NSString *const kJsonWorldComponentContentPathsIt = @"it";
NSString *const kJsonWorldComponentContentPathsZhCht = @"zh-cht";
NSString *const kJsonWorldComponentContentPathsRu = @"ru";
NSString *const kJsonWorldComponentContentPathsPtBr = @"pt-br";
NSString *const kJsonWorldComponentContentPathsEn = @"en";
NSString *const kJsonWorldComponentContentPathsEs = @"es";
NSString *const kJsonWorldComponentContentPathsPl = @"pl";
NSString *const kJsonWorldComponentContentPathsDe = @"de";
NSString *const kJsonWorldComponentContentPathsZhChs = @"zh-chs";


@interface JsonWorldComponentContentPaths ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JsonWorldComponentContentPaths

@synthesize ko = _ko;
@synthesize ja = _ja;
@synthesize esMx = _esMx;
@synthesize fr = _fr;
@synthesize it = _it;
@synthesize zhCht = _zhCht;
@synthesize ru = _ru;
@synthesize ptBr = _ptBr;
@synthesize en = _en;
@synthesize es = _es;
@synthesize pl = _pl;
@synthesize de = _de;
@synthesize zhChs = _zhChs;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kJsonWorldComponentContentPathsEn,@"en",
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
            self.ko = [Ko modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsKo]];
            self.ja = [Ja modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsJa]];
            self.esMx = [EsMx modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsEsMx]];
            self.fr = [Fr modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsFr]];
            self.it = [It modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsIt]];
            self.zhCht = [ZhCht modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsZhCht]];
            self.ru = [Ru modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsRu]];
            self.ptBr = [PtBr modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsPtBr]];
            self.en = [En modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsEn]];
            self.es = [Es modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsEs]];
            self.pl = [Pl modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsPl]];
            self.de = [De modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsDe]];
            self.zhChs = [ZhChs modelObjectWithDictionary:[dict objectForKey:kJsonWorldComponentContentPathsZhChs]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.ko dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsKo];
    [mutableDict setValue:[self.ja dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsJa];
    [mutableDict setValue:[self.esMx dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsEsMx];
    [mutableDict setValue:[self.fr dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsFr];
    [mutableDict setValue:[self.it dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsIt];
    [mutableDict setValue:[self.zhCht dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsZhCht];
    [mutableDict setValue:[self.ru dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsRu];
    [mutableDict setValue:[self.ptBr dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsPtBr];
    [mutableDict setValue:[self.en dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsEn];
    [mutableDict setValue:[self.es dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsEs];
    [mutableDict setValue:[self.pl dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsPl];
    [mutableDict setValue:[self.de dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsDe];
    [mutableDict setValue:[self.zhChs dictionaryRepresentation] forKey:kJsonWorldComponentContentPathsZhChs];

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

    self.ko = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsKo];
    self.ja = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsJa];
    self.esMx = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsEsMx];
    self.fr = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsFr];
    self.it = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsIt];
    self.zhCht = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsZhCht];
    self.ru = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsRu];
    self.ptBr = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsPtBr];
    self.en = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsEn];
    self.es = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsEs];
    self.pl = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsPl];
    self.de = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsDe];
    self.zhChs = [aDecoder decodeObjectForKey:kJsonWorldComponentContentPathsZhChs];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ko forKey:kJsonWorldComponentContentPathsKo];
    [aCoder encodeObject:_ja forKey:kJsonWorldComponentContentPathsJa];
    [aCoder encodeObject:_esMx forKey:kJsonWorldComponentContentPathsEsMx];
    [aCoder encodeObject:_fr forKey:kJsonWorldComponentContentPathsFr];
    [aCoder encodeObject:_it forKey:kJsonWorldComponentContentPathsIt];
    [aCoder encodeObject:_zhCht forKey:kJsonWorldComponentContentPathsZhCht];
    [aCoder encodeObject:_ru forKey:kJsonWorldComponentContentPathsRu];
    [aCoder encodeObject:_ptBr forKey:kJsonWorldComponentContentPathsPtBr];
    [aCoder encodeObject:_en forKey:kJsonWorldComponentContentPathsEn];
    [aCoder encodeObject:_es forKey:kJsonWorldComponentContentPathsEs];
    [aCoder encodeObject:_pl forKey:kJsonWorldComponentContentPathsPl];
    [aCoder encodeObject:_de forKey:kJsonWorldComponentContentPathsDe];
    [aCoder encodeObject:_zhChs forKey:kJsonWorldComponentContentPathsZhChs];
}

- (id)copyWithZone:(NSZone *)zone
{
    JsonWorldComponentContentPaths *copy = [[JsonWorldComponentContentPaths alloc] init];
    
    if (copy) {

        copy.ko = [self.ko copyWithZone:zone];
        copy.ja = [self.ja copyWithZone:zone];
        copy.esMx = [self.esMx copyWithZone:zone];
        copy.fr = [self.fr copyWithZone:zone];
        copy.it = [self.it copyWithZone:zone];
        copy.zhCht = [self.zhCht copyWithZone:zone];
        copy.ru = [self.ru copyWithZone:zone];
        copy.ptBr = [self.ptBr copyWithZone:zone];
        copy.en = [self.en copyWithZone:zone];
        copy.es = [self.es copyWithZone:zone];
        copy.pl = [self.pl copyWithZone:zone];
        copy.de = [self.de copyWithZone:zone];
        copy.zhChs = [self.zhChs copyWithZone:zone];
    }
    
    return copy;
}


@end
