//
//  main.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "APIInterface.h"
#import "User.h"

int main(int argc, char *argv[])
{
    User * defaultUser = [APIInterface createUserWithEmail:@"test@test.com" password:@"123456" url:@"http://demo.gitlabhq.com"];
    
    
}
