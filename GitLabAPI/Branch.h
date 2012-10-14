//
//  Branch.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 15.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Branch : NSObject
@property (retain) NSString * branchName;

-(id)initWithInfo:(NSDictionary *)info;
@end
