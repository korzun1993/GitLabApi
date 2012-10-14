//
//  Commits.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 15.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "Commits.h"

@implementation Commits
-(id)initWithInfo:(NSDictionary *)info
{
    
    self = [super init];
    if (self) {
        
        self.commitID = [info valueForKey:@"id"];
        self.shortCommitID = [info valueForKey:@"short_id"];
        self.title = [info valueForKey:@"title"];
        self.authorName = [info valueForKey:@"author_name"];
        self.authorEmail = [info valueForKey:@"author_Email"];
        self.create_at = [info valueForKey:@"created_at"];
        
    }
    return self;
}

-(void)dealloc{
    [_commitID release];
    [_shortCommitID release];
    [_title release];
    [_authorName release];
    [_authorEmail release];
    [_create_at release];
    [super dealloc];
}

@end
