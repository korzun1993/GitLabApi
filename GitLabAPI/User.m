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
    self.createtAt = [dicrionary valueForKey:@"created_at"];
    
}
    return self;
}

-(void)dealloc{
    [_userEmail retain];
    [_userID retain];
    [_userPassword retain];
    [_userToken retain];
    [_url retain];
    [_isBlocked retain];
    [_createtAt retain];
    [super dealloc];
}
@end
