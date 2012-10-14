//
//  Milestone.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 15.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "Milestone.h"

@implementation Milestone
-(id)initWithInfo:(NSDictionary *)info
{
    
    self = [super init];
    if (self) {
        self.milestoneID = [[NSNumber alloc] initWithInteger: [[info valueForKey:@"id"] integerValue] ];
        self.milestoneTitle = [info valueForKey:@"title"];
        self.description = [info valueForKey:@"description"];

        self.dueDate = [info valueForKey:@"due_date"];
        self.isClosed = [[NSNumber alloc] initWithBool:[[info valueForKey:@"closed"] boolValue]];
    }
    return self;
}
-(void)dealloc{
    [_milestoneID release];
    [_milestoneTitle release];
    [_description release];
    [_dueDate release];
    [_isClosed release];
    [super dealloc];
}
@end
