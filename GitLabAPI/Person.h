//
//  Owner.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Owner : NSObject
@property (retain) NSString * ownerEmail;
@property (retain) NSString * ownerName;
@property (retain) NSString * createdAt;
@property (retain) NSNumber * ownerID;
@property (retain) NSNumber * isBlocked;
-(id)initWithInfo:(NSDictionary *)info;
@end
