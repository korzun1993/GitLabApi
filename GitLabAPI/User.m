//
//  User.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "User.h"

@implementation User

-(id)initWithEmail:(NSString *)email password:(NSString *)password token:(NSString *)token url:(NSString *)url{
if(self=[super init]){
    self.userEmail = email;
    self.userPassword = password;
    self.userToken = token;
    self.url=url;
    
}
    return self;
}

@end
