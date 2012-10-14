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
    
        self.personEmail = [info valueForKey:@"email"];
        self.personID= [[NSNumber alloc] initWithInteger: [[info valueForKey:@"id"] integerValue] ];
        self.isBlocked = [[NSNumber alloc] initWithBool:[[info valueForKey:@"blocked"] boolValue]];
        self.createdAt = [info valueForKey:@"created_at"];
        self.personName = [info valueForKey:@"name"];
    }
    return self;
}

-(void)dealloc{
    [_personEmail release];
    [_personID release];
    [_isBlocked release];
    [_createdAt release];
    [_personName release];
    [super dealloc];
}

@end
