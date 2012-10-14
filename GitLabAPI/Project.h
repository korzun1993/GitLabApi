//
//  Project.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Owner.h"

@interface Project : NSObject
@property (retain) NSNumber * projectID;
@property (retain) NSString * projectName;
@property (retain) NSString * defaultBranch;
@property (retain) Owner * owner;
@property (retain) NSString * createdAt;
@property (retain) NSString * description;
@property (retain) NSNumber * isPrivate;
@property (retain) NSNumber * issuesEnabled;




-(id)initWithInfo:(NSDictionary*)info ;
@end
