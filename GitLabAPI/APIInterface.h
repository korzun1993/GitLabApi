//
//  APIInterface.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Project.h"

@interface APIInterface : NSObject
+(User *)createUserWithEmail:(NSString *)email password:(NSString*)password url:(NSString *)url;

+(NSArray *)showAllProjectUser:(User *)user;

+(NSArray *)showAllMilestoneProject:(Project *)project user:(User*)user;
@end
