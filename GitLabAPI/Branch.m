//
//  Branch.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 15.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "Branch.h"

@implementation Branch
-(id)initWithInfo:(NSDictionary *)info
{
    
    self = [super init];
    if (self) {
        
        self.branchName = [info valueForKey:@"name"];
        
    }
    return self;
}

-(void)dealloc{
    [_branchName release];
  
    [super dealloc];
}
@end
