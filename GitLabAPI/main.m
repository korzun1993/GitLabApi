//
//  main.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "APIInterface.h"
#import "Session.h"
#import "Project.h"
#import "Milestone.h"
#import "Branch.h"
#import "Commits.h"
#import "Person.h"
#import "Issues.h"
#import "User.h"


int main(int argc, char *argv[])
{
    Session * defaultSession = [APIInterface createSessionWithEmail:@"test@test.com" password:@"123456" url:@"http://demo.gitlabhq.com"];
    NSArray * arrayOfProjects = [APIInterface showAllProjectSession:defaultSession];
    [APIInterface showAllMilestoneProject:(arrayOfProjects)[1] session:defaultSession];
    [APIInterface showAllIssuesSession:defaultSession];
    [APIInterface showAllBranchesProject:(arrayOfProjects)[1] session:defaultSession];
    [APIInterface showRepositoryCommitsProject:(arrayOfProjects)[1] session:defaultSession];

    [APIInterface showAllUsersForSession:defaultSession];
    [APIInterface showUserForID:[NSNumber numberWithInt:1] session:defaultSession];
    [APIInterface showCurrentSessionUser:defaultSession];
    [APIInterface showSSHKeysForSession:defaultSession];
    [APIInterface addNewSSHkey:@"sshrsaxjfcgvjhbkjnxuthgfjkhjfcgdxkgxghcvccccccffchjgcdxtgxyutjgxkyrutyjcgzytujgcstrytufyjgcfdgszyrdtufyhvjgcfhxgdzxjgvfxcgzytujgcstrytufyjgcfdgszyrdtufyhvjgcfhxgdzxjgvfxtjgxkyrutyjcgzytujgcstrytufyjgcfdgszyrdtufyhvjgcfhxgdzxjgvfxcgzytujgcs" title:@"newKey" session:defaultSession];
    [APIInterface showMembersOfProject:(arrayOfProjects)[1] session:defaultSession];
    [APIInterface editMemberOfProject:(arrayOfProjects)[1] ID:[NSNumber numberWithInt:1] access_level:[NSNumber numberWithInt:10] session:defaultSession];
    [APIInterface addMemberOfProject:(arrayOfProjects)[1] ID:[NSNumber numberWithInt:1] access_level:[NSNumber numberWithInt:20] session:defaultSession];
    [APIInterface removeMemberOfProject:(arrayOfProjects)[1] ID:[NSNumber numberWithInt:1] session:defaultSession];
    [APIInterface deleteIssuesProject:(arrayOfProjects)[1] issue_id:[NSNumber numberWithInt:9] session:defaultSession];
        
}
