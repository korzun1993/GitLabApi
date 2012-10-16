//
//  Owner.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id)initWithInfo:(NSDictionary *)info
{
    
    self = [super init];
    if (self) {
    
        self.email = [info valueForKey:@"email"];
        self.ID= [[NSNumber alloc] initWithInteger: [[info valueForKey:@"id"] integerValue] ];
        self.isBlocked = [[NSNumber alloc] initWithBool:[[info valueForKey:@"blocked"] boolValue]];
        self.createdAt = [info valueForKey:@"created_at"];
        self.name = [info valueForKey:@"name"];
    }
    return self;
}

-(void)dealloc{
    [_email release];
    [_ID release];
    [_isBlocked release];
    [_createdAt release];
    [_name release];
    [super dealloc];
}

@end
