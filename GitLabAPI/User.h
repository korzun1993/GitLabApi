//
//  User.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 16.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (retain) NSString * bio;
@property (retain) NSString * linkedin;
@property (retain) NSString * skype;
@property (retain) NSString * twitter;
@property (retain) NSNumber * themeID;
@property (retain) NSNumber * darkScheme;
@property (retain) NSString * userEmail;
@property (retain) NSString * userName;
@property (retain) NSString * createdAt;
@property (retain) NSNumber * userID;
@property (retain) NSNumber * isBlocked;

-(id)initWithInfo:(NSDictionary *)info;
@end
