//
//  JsonWorldContentPaths.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "JsonWorldContentPaths.h"


NSString *const kJsonWorldContentPathsKo = @"ko";
NSString *const kJsonWorldContentPathsJa = @"ja";
NSString *const kJsonWorldContentPathsEsMx = @"es-mx";
NSString *const kJsonWorldContentPathsFr = @"fr";
NSString *const kJsonWorldContentPathsIt = @"it";
NSString *const kJsonWorldContentPathsZhCht = @"zh-cht";
NSString *const kJsonWorldContentPathsRu = @"ru";
NSString *const kJsonWorldContentPathsPtBr = @"pt-br";
NSString *const kJsonWorldContentPathsEn = @"en";
NSString *const kJsonWorldContentPathsEs = @"es";
NSString *const kJsonWorldContentPathsPl = @"pl";
NSString *const kJsonWorldContentPathsDe = @"de";
NSString *const kJsonWorldContentPathsZhChs = @"zh-chs";


@interface JsonWorldContentPaths ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JsonWorldContentPaths

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
            self.ko = [self objectOrNilForKey:kJsonWorldContentPathsKo fromDictionary:dict];
            self.ja = [self objectOrNilForKey:kJsonWorldContentPathsJa fromDictionary:dict];
            self.esMx = [self objectOrNilForKey:kJsonWorldContentPathsEsMx fromDictionary:dict];
            self.fr = [self objectOrNilForKey:kJsonWorldContentPathsFr fromDictionary:dict];
            self.it = [self objectOrNilForKey:kJsonWorldContentPathsIt fromDictionary:dict];
            self.zhCht = [self objectOrNilForKey:kJsonWorldContentPathsZhCht fromDictionary:dict];
            self.ru = [self objectOrNilForKey:kJsonWorldContentPathsRu fromDictionary:dict];
            self.ptBr = [self objectOrNilForKey:kJsonWorldContentPathsPtBr fromDictionary:dict];
            self.en = [self objectOrNilForKey:kJsonWorldContentPathsEn fromDictionary:dict];
            self.es = [self objectOrNilForKey:kJsonWorldContentPathsEs fromDictionary:dict];
            self.pl = [self objectOrNilForKey:kJsonWorldContentPathsPl fromDictionary:dict];
            self.de = [self objectOrNilForKey:kJsonWorldContentPathsDe fromDictionary:dict];
            self.zhChs = [self objectOrNilForKey:kJsonWorldContentPathsZhChs fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ko forKey:kJsonWorldContentPathsKo];
    [mutableDict setValue:self.ja forKey:kJsonWorldContentPathsJa];
    [mutableDict setValue:self.esMx forKey:kJsonWorldContentPathsEsMx];
    [mutableDict setValue:self.fr forKey:kJsonWorldContentPathsFr];
    [mutableDict setValue:self.it forKey:kJsonWorldContentPathsIt];
    [mutableDict setValue:self.zhCht forKey:kJsonWorldContentPathsZhCht];
    [mutableDict setValue:self.ru forKey:kJsonWorldContentPathsRu];
    [mutableDict setValue:self.ptBr forKey:kJsonWorldContentPathsPtBr];
    [mutableDict setValue:self.en forKey:kJsonWorldContentPathsEn];
    [mutableDict setValue:self.es forKey:kJsonWorldContentPathsEs];
    [mutableDict setValue:self.pl forKey:kJsonWorldContentPathsPl];
    [mutableDict setValue:self.de forKey:kJsonWorldContentPathsDe];
    [mutableDict setValue:self.zhChs forKey:kJsonWorldContentPathsZhChs];

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

    self.ko = [aDecoder decodeObjectForKey:kJsonWorldContentPathsKo];
    self.ja = [aDecoder decodeObjectForKey:kJsonWorldContentPathsJa];
    self.esMx = [aDecoder decodeObjectForKey:kJsonWorldContentPathsEsMx];
    self.fr = [aDecoder decodeObjectForKey:kJsonWorldContentPathsFr];
    self.it = [aDecoder decodeObjectForKey:kJsonWorldContentPathsIt];
    self.zhCht = [aDecoder decodeObjectForKey:kJsonWorldContentPathsZhCht];
    self.ru = [aDecoder decodeObjectForKey:kJsonWorldContentPathsRu];
    self.ptBr = [aDecoder decodeObjectForKey:kJsonWorldContentPathsPtBr];
    self.en = [aDecoder decodeObjectForKey:kJsonWorldContentPathsEn];
    self.es = [aDecoder decodeObjectForKey:kJsonWorldContentPathsEs];
    self.pl = [aDecoder decodeObjectForKey:kJsonWorldContentPathsPl];
    self.de = [aDecoder decodeObjectForKey:kJsonWorldContentPathsDe];
    self.zhChs = [aDecoder decodeObjectForKey:kJsonWorldContentPathsZhChs];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ko forKey:kJsonWorldContentPathsKo];
    [aCoder encodeObject:_ja forKey:kJsonWorldContentPathsJa];
    [aCoder encodeObject:_esMx forKey:kJsonWorldContentPathsEsMx];
    [aCoder encodeObject:_fr forKey:kJsonWorldContentPathsFr];
    [aCoder encodeObject:_it forKey:kJsonWorldContentPathsIt];
    [aCoder encodeObject:_zhCht forKey:kJsonWorldContentPathsZhCht];
    [aCoder encodeObject:_ru forKey:kJsonWorldContentPathsRu];
    [aCoder encodeObject:_ptBr forKey:kJsonWorldContentPathsPtBr];
    [aCoder encodeObject:_en forKey:kJsonWorldContentPathsEn];
    [aCoder encodeObject:_es forKey:kJsonWorldContentPathsEs];
    [aCoder encodeObject:_pl forKey:kJsonWorldContentPathsPl];
    [aCoder encodeObject:_de forKey:kJsonWorldContentPathsDe];
    [aCoder encodeObject:_zhChs forKey:kJsonWorldContentPathsZhChs];
}

- (id)copyWithZone:(NSZone *)zone
{
    JsonWorldContentPaths *copy = [[JsonWorldContentPaths alloc] init];
    
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
