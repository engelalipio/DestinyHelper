//
//  INVDPreview.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INVDPreview : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *previewActionString;
@property (nonatomic, strong) NSString *screenStyle;
@property (nonatomic, assign) double previewVendorHash;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
