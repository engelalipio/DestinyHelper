//
//  MobileWorldContentPaths.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "MobileWorldContentPaths.h"


NSString *const kMobileWorldContentPathsKo = @"ko";
NSString *const kMobileWorldContentPathsJa = @"ja";
NSString *const kMobileWorldContentPathsEsMx = @"es-mx";
NSString *const kMobileWorldContentPathsFr = @"fr";
NSString *const kMobileWorldContentPathsIt = @"it";
NSString *const kMobileWorldContentPathsZhCht = @"zh-cht";
NSString *const kMobileWorldContentPathsRu = @"ru";
NSString *const kMobileWorldContentPathsPtBr = @"pt-br";
NSString *const kMobileWorldContentPathsEn = @"en";
NSString *const kMobileWorldContentPathsEs = @"es";
NSString *const kMobileWorldContentPathsPl = @"pl";
NSString *const kMobileWorldContentPathsDe = @"de";
NSString *const kMobileWorldContentPathsZhChs = @"zh-chs";


@interface MobileWorldContentPaths ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MobileWorldContentPaths

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
            self.ko = [self objectOrNilForKey:kMobileWorldContentPathsKo fromDictionary:dict];
            self.ja = [self objectOrNilForKey:kMobileWorldContentPathsJa fromDictionary:dict];
            self.esMx = [self objectOrNilForKey:kMobileWorldContentPathsEsMx fromDictionary:dict];
            self.fr = [self objectOrNilForKey:kMobileWorldContentPathsFr fromDictionary:dict];
            self.it = [self objectOrNilForKey:kMobileWorldContentPathsIt fromDictionary:dict];
            self.zhCht = [self objectOrNilForKey:kMobileWorldContentPathsZhCht fromDictionary:dict];
            self.ru = [self objectOrNilForKey:kMobileWorldContentPathsRu fromDictionary:dict];
            self.ptBr = [self objectOrNilForKey:kMobileWorldContentPathsPtBr fromDictionary:dict];
            self.en = [self objectOrNilForKey:kMobileWorldContentPathsEn fromDictionary:dict];
            self.es = [self objectOrNilForKey:kMobileWorldContentPathsEs fromDictionary:dict];
            self.pl = [self objectOrNilForKey:kMobileWorldContentPathsPl fromDictionary:dict];
            self.de = [self objectOrNilForKey:kMobileWorldContentPathsDe fromDictionary:dict];
            self.zhChs = [self objectOrNilForKey:kMobileWorldContentPathsZhChs fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ko forKey:kMobileWorldContentPathsKo];
    [mutableDict setValue:self.ja forKey:kMobileWorldContentPathsJa];
    [mutableDict setValue:self.esMx forKey:kMobileWorldContentPathsEsMx];
    [mutableDict setValue:self.fr forKey:kMobileWorldContentPathsFr];
    [mutableDict setValue:self.it forKey:kMobileWorldContentPathsIt];
    [mutableDict setValue:self.zhCht forKey:kMobileWorldContentPathsZhCht];
    [mutableDict setValue:self.ru forKey:kMobileWorldContentPathsRu];
    [mutableDict setValue:self.ptBr forKey:kMobileWorldContentPathsPtBr];
    [mutableDict setValue:self.en forKey:kMobileWorldContentPathsEn];
    [mutableDict setValue:self.es forKey:kMobileWorldContentPathsEs];
    [mutableDict setValue:self.pl forKey:kMobileWorldContentPathsPl];
    [mutableDict setValue:self.de forKey:kMobileWorldContentPathsDe];
    [mutableDict setValue:self.zhChs forKey:kMobileWorldContentPathsZhChs];

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

    self.ko = [aDecoder decodeObjectForKey:kMobileWorldContentPathsKo];
    self.ja = [aDecoder decodeObjectForKey:kMobileWorldContentPathsJa];
    self.esMx = [aDecoder decodeObjectForKey:kMobileWorldContentPathsEsMx];
    self.fr = [aDecoder decodeObjectForKey:kMobileWorldContentPathsFr];
    self.it = [aDecoder decodeObjectForKey:kMobileWorldContentPathsIt];
    self.zhCht = [aDecoder decodeObjectForKey:kMobileWorldContentPathsZhCht];
    self.ru = [aDecoder decodeObjectForKey:kMobileWorldContentPathsRu];
    self.ptBr = [aDecoder decodeObjectForKey:kMobileWorldContentPathsPtBr];
    self.en = [aDecoder decodeObjectForKey:kMobileWorldContentPathsEn];
    self.es = [aDecoder decodeObjectForKey:kMobileWorldContentPathsEs];
    self.pl = [aDecoder decodeObjectForKey:kMobileWorldContentPathsPl];
    self.de = [aDecoder decodeObjectForKey:kMobileWorldContentPathsDe];
    self.zhChs = [aDecoder decodeObjectForKey:kMobileWorldContentPathsZhChs];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ko forKey:kMobileWorldContentPathsKo];
    [aCoder encodeObject:_ja forKey:kMobileWorldContentPathsJa];
    [aCoder encodeObject:_esMx forKey:kMobileWorldContentPathsEsMx];
    [aCoder encodeObject:_fr forKey:kMobileWorldContentPathsFr];
    [aCoder encodeObject:_it forKey:kMobileWorldContentPathsIt];
    [aCoder encodeObject:_zhCht forKey:kMobileWorldContentPathsZhCht];
    [aCoder encodeObject:_ru forKey:kMobileWorldContentPathsRu];
    [aCoder encodeObject:_ptBr forKey:kMobileWorldContentPathsPtBr];
    [aCoder encodeObject:_en forKey:kMobileWorldContentPathsEn];
    [aCoder encodeObject:_es forKey:kMobileWorldContentPathsEs];
    [aCoder encodeObject:_pl forKey:kMobileWorldContentPathsPl];
    [aCoder encodeObject:_de forKey:kMobileWorldContentPathsDe];
    [aCoder encodeObject:_zhChs forKey:kMobileWorldContentPathsZhChs];
}

- (id)copyWithZone:(NSZone *)zone
{
    MobileWorldContentPaths *copy = [[MobileWorldContentPaths alloc] init];
    
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
