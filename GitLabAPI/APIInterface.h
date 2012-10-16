//
//  APIInterface.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Session.h"
#import "Project.h"
#import "Milestone.h"
#import "Issues.h"
#import "Branch.h"
#import "Commits.h"
#import "Person.h"
#import "User.h"
#import "SSHKey.h"
#import "ProjectMember.h"
@interface APIInterface : NSObject

+(Session *)createSessionWithEmail:(NSString *)email password:(NSString*)password url:(NSString *)url;

+(NSArray *)showAllProjectSession:(Session *)session;

+(NSArray *)showAllMilestoneProject:(Project *)project session:(Session*)session;

+(NSArray *)showAllIssuesSession:(Session *)session;

+(NSArray *)showAllBranchesProject:(Project*)project session:(Session *)session;

+(NSArray *)showRepositoryCommitsProject:(Project*)project session:(Session *)session;

+(NSArray *)showAllUsersForSession:(Session *)session;

+(User *)showUserForID:(NSNumber *)userID session:(Session *)session;

+(User *)showCurrentSessionUser:(Session *)session;

+(NSArray *)showSSHKeysForSession:(Session *)session;

+(BOOL)addNewSSHkey:(NSString *)key title:(NSString*)title session:(Session *)session;//Not found

+(NSArray *)showMembersOfProject:(Project *)project session:(Session*)session;

+(BOOL)editMemberOfProject:(Project *)project ID:(NSNumber*)userID access_level:(NSNumber*)accessLevel session:(Session *)session; //Forbidden

+(BOOL)addMemberOfProject:(Project *)project ID:(NSNumber*)userID access_level:(NSNumber*)accessLevel session:(Session *)session; //Forbidden

+(BOOL)removeMemberOfProject:(Project *)project ID:(NSNumber*)userID session:(Session *)session; //Forbidden

+(BOOL)deleteIssuesProject:(Project*)project issue_id:(NSNumber*)issueID session:(Session *)session; //Method not allowed
@end
