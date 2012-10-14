//
//  issues.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 15.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Milestone.h"
@interface Issues : NSObject
@property (retain) NSNumber * issuesID;
@property (retain) NSNumber * projectID;
@property (retain) NSString * title;
@property (retain) NSString * description;
@property (retain) NSString * createdAt;
@property (retain) NSString * updatedAt;
@property (retain) NSNumber * isClosed;
@property (retain) Person * autor;
@property (retain) Person * assignee;
@property (retain) Milestone * milestone;

-(id)initWithInfo:(NSDictionary*)info ;
@end
