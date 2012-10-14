//
//  issues.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 15.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "Issues.h"

@implementation Issues

-(id)initWithInfo:(NSDictionary *)info
{
    
    self = [super init];
    if (self) {
      
        self.issuesID = [[NSNumber alloc] initWithInteger: [[info valueForKey:@"id"] integerValue] ];
        self.projectID = [[NSNumber alloc] initWithInteger: [[info valueForKey:@"project_id"] integerValue] ];
        self.title = [info valueForKey:@"title"];
        self.description = [info valueForKey:@"description"];
        self.createdAt = [info valueForKey:@"created_at"];
        self.updatedAt = [info valueForKey:@"updated_at"];
        self.isClosed = [[NSNumber alloc] initWithBool:[[info valueForKey:@"closed"] boolValue]];
        self.autor = [[Person alloc] initWithInfo:[info valueForKey:@"autor"]];
        self.assignee = [[Person alloc] initWithInfo:[info valueForKey:@"assignee"]];
        self.milestone = [[Milestone alloc] initWithInfo:[info valueForKey:@"mailstone"]];
        
    }
    return self;
}
-(void)dealloc{
    [_issuesID release];
    [_projectID release];
    [_title release];
    [_description release];
    [_createdAt release];
    [_updatedAt release];
    [_isClosed release];
    [_autor release];
    [_assignee release];
    [_milestone release];
   [super dealloc];
}


@end
