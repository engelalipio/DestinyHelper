//
//
//  Created by Engel Alipio on 8/15/14.
//  Copyright (c) 2014 Lush. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AbstractModel <NSObject>

@required
+ (NSDictionary *)mapping;
+ (NSString *)key;
@end
