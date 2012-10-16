//
//  session.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Session : NSObject
@property (retain) NSString * sessionEmail;
@property (retain) NSString * sessionName;
@property (retain) NSString * sessionPassword;
@property (retain) NSString * sessionToken;
@property (retain) NSString * url;
@property (retain) NSString * createdAt;
@property (retain) NSNumber * sessionID;
@property (retain) NSNumber * isBlocked;


-(id)initWithInfo:(NSDictionary*)dicrionary password:(NSString*)password url:(NSString*) url;
@end
