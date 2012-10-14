//
//  Commits.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 15.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Commits : NSObject
@property (retain) NSString * commitID;
@property (retain) NSString * shortCommitID;
@property (retain) NSString * title;
@property (retain) NSString * authorName;
@property (retain) NSString * authorEmail;
@property (retain) NSString * create_at;

-(id)initWithInfo:(NSDictionary *)info;
@end
