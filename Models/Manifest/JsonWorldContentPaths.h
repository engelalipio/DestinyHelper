//
//  JsonWorldContentPaths.h
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JsonWorldContentPaths : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *ko;
@property (nonatomic, strong) NSString *ja;
@property (nonatomic, strong) NSString *esMx;
@property (nonatomic, strong) NSString *fr;
@property (nonatomic, strong) NSString *it;
@property (nonatomic, strong) NSString *zhCht;
@property (nonatomic, strong) NSString *ru;
@property (nonatomic, strong) NSString *ptBr;
@property (nonatomic, strong) NSString *en;
@property (nonatomic, strong) NSString *es;
@property (nonatomic, strong) NSString *pl;
@property (nonatomic, strong) NSString *de;
@property (nonatomic, strong) NSString *zhChs;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
