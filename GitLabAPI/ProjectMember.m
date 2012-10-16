//
//  ProjectMember.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 16.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "ProjectMember.h"

@implementation ProjectMember
-(id)initWithInfo:(NSDictionary *)info
{
    self = [super initWithInfo:info];
    if (self) {
       
        self.accessLevel = [[NSNumber alloc] initWithInteger: [[info valueForKey:@"access_level"] integerValue] ];
    }
    return self;
}


-(void)dealloc{

    [_accessLevel release];
    [super dealloc];
}
@end
