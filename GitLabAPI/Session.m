//
//  User.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "User.h"

@implementation User

-(id)initWithInfo:(NSDictionary *)dicrionary password:(NSString *)password url:(NSString *)url{
if(self=[super init]){
    self.userEmail = [dicrionary valueForKey:@"email"];
    self.userPassword = password;
    self.userToken = [dicrionary valueForKey:@"private_token"];
    self.userID= [[NSNumber alloc] initWithInteger: [[dicrionary valueForKey:@"id"] integerValue] ];
    self.url=url;
    self.isBlocked = [[NSNumber alloc] initWithBool:[[dicrionary valueForKey:@"blocked"] boolValue]];
    self.createdAt = [dicrionary valueForKey:@"created_at"];
    self.userName = [dicrionary valueForKey:@"name"];
    
}
    return self;
}

-(void)dealloc{
    [_userEmail release];
    [_userID release];
    [_userPassword release];
    [_userToken release];
    [_url release];
    [_isBlocked release];
    [_createdAt release];
    [_userName release];
    [super dealloc];
}
@end
