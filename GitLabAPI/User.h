//
//  User.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (retain) NSString * userEmail;
@property (retain) NSString * userPassword;
@property (retain) NSString * userToken;
@property (retain) NSString * url;
@property (retain) NSString * createtAt;
@property (retain) NSNumber * userID;
@property (retain) NSNumber * isBlocked;


-(id)initWithInfo:(NSDictionary*)dicrionary password:(NSString*)password url:(NSString*) url;
@end
