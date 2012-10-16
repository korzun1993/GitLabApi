//
//  User.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 16.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "User.h"

@implementation User
-(id)initWithInfo:(NSDictionary *)info
{
self = [super init];
if (self) {
    self.userID= [[NSNumber alloc] initWithInteger: [[info valueForKey:@"id"] integerValue] ];
    self.userEmail = [info valueForKey:@"email"];
    self.userName = [info valueForKey:@"name"];
    self.isBlocked = [[NSNumber alloc] initWithBool:[[info valueForKey:@"blocked"] boolValue]];
    self.createdAt = [info valueForKey:@"created_at"];
    self.bio = [info valueForKey:@"bio"];
    self.skype = [info valueForKey:@"skype"];
    self.linkedin = [info valueForKey:@"linkedin"];
    self.twitter = [info valueForKey:@"twitter"];
    self.darkScheme = [[NSNumber alloc] initWithBool:[[info valueForKey:@"dark_scheme"] boolValue]];
    self.themeID = [[NSNumber alloc] initWithInteger: [[info valueForKey:@"theme_id"] integerValue] ];
}
return self;
}


-(void)dealloc{
    [_userEmail release];
    [_bio release];
    [_linkedin release];
    [_skype release];
    [_twitter release];
    [_themeID release];
    [_darkScheme release];
    [_userID release];
    [_isBlocked release];
    [_createdAt release];
    [_userName release];
    [super dealloc];
}


@end
