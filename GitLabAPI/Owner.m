//
//  Owner.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "Owner.h"

@implementation Owner
-(id)initWithInfo:(NSDictionary *)info
{
    
    self = [super init];
    if (self) {
    
        self.ownerEmail = [info valueForKey:@"email"];
        self.ownerID= [[NSNumber alloc] initWithInteger: [[info valueForKey:@"id"] integerValue] ];
        self.isBlocked = [[NSNumber alloc] initWithBool:[[info valueForKey:@"blocked"] boolValue]];
        self.createdAt = [info valueForKey:@"created_at"];
        self.ownerName = [info valueForKey:@"name"];
    }
    return self;
}

-(void)dealloc{
    [_ownerEmail release];
    [_ownerID release];
    [_isBlocked release];
    [_createdAt release];
    [_ownerName release];
    [super dealloc];
}

@end
