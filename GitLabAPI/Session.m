//
//  session.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "Session.h"

@implementation Session

-(id)initWithInfo:(NSDictionary *)dicrionary password:(NSString *)password url:(NSString *)url{
if(self=[super init]){
    self.sessionEmail = [dicrionary valueForKey:@"email"];
    self.sessionPassword = password;
    self.sessionToken = [dicrionary valueForKey:@"private_token"];
    self.sessionID= [[NSNumber alloc] initWithInteger: [[dicrionary valueForKey:@"id"] integerValue] ];
    self.url=url;
    self.isBlocked = [[NSNumber alloc] initWithBool:[[dicrionary valueForKey:@"blocked"] boolValue]];
    self.createdAt = [dicrionary valueForKey:@"created_at"];
    self.sessionName = [dicrionary valueForKey:@"name"];
    
}
    return self;
}

-(void)dealloc{
    [_sessionEmail release];
    [_sessionID release];
    [_sessionPassword release];
    [_sessionToken release];
    [_url release];
    [_isBlocked release];
    [_createdAt release];
    [_sessionName release];
    [super dealloc];
}
@end
