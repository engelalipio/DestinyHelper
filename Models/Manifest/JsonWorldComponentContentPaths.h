//
//  JsonWorldComponentContentPaths.h
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Ko, Ja, EsMx, Fr, It, ZhCht, Ru, PtBr, En, Es, Pl, De, ZhChs;

@interface JsonWorldComponentContentPaths : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Ko *ko;
@property (nonatomic, strong) Ja *ja;
@property (nonatomic, strong) EsMx *esMx;
@property (nonatomic, strong) Fr *fr;
@property (nonatomic, strong) It *it;
@property (nonatomic, strong) ZhCht *zhCht;
@property (nonatomic, strong) Ru *ru;
@property (nonatomic, strong) PtBr *ptBr;
@property (nonatomic, strong) En *en;
@property (nonatomic, strong) Es *es;
@property (nonatomic, strong) Pl *pl;
@property (nonatomic, strong) De *de;
@property (nonatomic, strong) ZhChs *zhChs;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
