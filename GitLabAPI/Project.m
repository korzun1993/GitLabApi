//
//  Project.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "Project.h"

@implementation Project
-(id)initWithInfo:(NSDictionary *)info
{

    self = [super init];
    if (self) {
        self.projectID = [[NSNumber alloc] initWithInteger: [[info valueForKey:@"id"] integerValue] ];
        self.projectName = [info valueForKey:@"name"];
        self.defaultBranch = [info valueForKey:@"default_branch"];
        self.owner = [[Owner alloc] initWithInfo:[info valueForKey:@"owner"]];
        self.createdAt = [info valueForKey:@"created_at"];
        self.description = [info valueForKey:@"description"];
        self.isPrivate = [[NSNumber alloc] initWithBool:[[info valueForKey:@"private"] boolValue]];
        self.issuesEnabled = [[NSNumber alloc] initWithInteger: [[info valueForKey:@"issues_enabled"] integerValue] ];
    }
    return self;
}
-(void)dealloc{
    [_projectID release];
    [_projectName release];
    [_defaultBranch release];
    [_owner release];
    [_createdAt release];
    [_description release];
    [_isPrivate release];
    [_issuesEnabled release];
    [super dealloc];
}


@end
