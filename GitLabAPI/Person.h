//
//  Owner.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (retain) NSString * email;
@property (retain) NSString * name;
@property (retain) NSString * createdAt;
@property (retain) NSNumber * ID;
@property (retain) NSNumber * isBlocked;

-(id)initWithInfo:(NSDictionary *)info;
@end
