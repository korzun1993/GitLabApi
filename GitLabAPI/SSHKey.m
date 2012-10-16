//
//  SSHKey.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 16.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "SSHKey.h"

@implementation SSHKey

-(id)initWithInfo:(NSDictionary *)info
{
    self = [super init];
    if (self) {
        self.key= [info valueForKey:@"key"];
        self.title= [info valueForKey:@"title"];
        self.keyID = [[NSNumber alloc] initWithInteger: [[info valueForKey:@"id"] integerValue] ];
    }
    return self;
}


-(void)dealloc{
    [_key release];
    [_title release];
    [_keyID release];
    [super dealloc];
}




@end
