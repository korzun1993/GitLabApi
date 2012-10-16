//
//  APIInterface.m
//  GitLabAPI
//
//  Created by Корзун Владислав on 14.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import "APIInterface.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"


@implementation APIInterface

+(NSData *)takeResponseToRequest:(NSString *)fullRequest HTTPMethod:(NSString *) method{
    NSURL *requestURL = [NSURL URLWithString:fullRequest];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:requestURL];
    [request setRequestMethod:method];
    
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
     return [[request responseData] retain];
    }
    return nil;
}

+(Session *)createSessionWithEmail:(NSString *)email password:(NSString *)password url:(NSString *)url{
  
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/session?email=%@&password=%@",url,email,password];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"POST"];
    if(response){
        NSDictionary* decodedResponse = [response objectFromJSONData];
        return [[Session alloc] initWithInfo:decodedResponse password:password url:url ];
    }
    return nil;
}

+(NSArray *)showAllProjectSession:(Session *)session{
    
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects?private_token=%@",session.url,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"GET"];
    if(response){
        NSArray* decodedResponse = [response objectFromJSONData];
        NSMutableArray * projects = [[NSMutableArray alloc] init];
        for (NSDictionary * temp in decodedResponse) {
            [projects addObject:[[Project alloc] initWithInfo:temp]];
        }
     return projects;
    }
    return nil;
}

+(NSArray *)showAllMilestoneProject:(Project *)project session:(Session *)session{
    
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/milestones?id=%@&private_token=%@",session.url,project.projectID,project.projectID,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"GET"];
    if(response){
        NSArray* decodedResponse = [response objectFromJSONData];
        NSMutableArray * milestones = [[NSMutableArray alloc] init];
        for (NSDictionary * temp in decodedResponse) {
            [milestones addObject:[[Milestone alloc] initWithInfo:temp]];
            
        }
        return milestones;
    }
    return nil;
    
    
}

+(NSArray*)showAllIssuesSession:(Session *)session{

    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/issues?private_token=%@",session.url,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"GET"];
    if(response){
        NSArray* decodedResponse = [response objectFromJSONData];
        NSMutableArray * issues = [[NSMutableArray alloc] init];
        for (NSDictionary * temp in decodedResponse) {
            [issues addObject:[[Issues alloc] initWithInfo:temp]];
            
        }
        return issues;
     
    }
    return nil;
}

+(NSArray *) showAllBranchesProject:(Project *)project session:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/repository/branches?private_token=%@",session.url,project.projectID,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"GET"];
    if(response){
        NSArray* decodedResponse = [response objectFromJSONData];
        NSMutableArray * branches = [[NSMutableArray alloc] init];
        for (NSDictionary * temp in decodedResponse) {
            [branches addObject:[[Branch alloc] initWithInfo:temp]];
            
        }
        return branches;
        
    }
    return nil;
 
}

+(NSArray *) showRepositoryCommitsProject:(Project *)project session:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/repository/commits?private_token=%@",session.url,project.projectID,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"GET"];
    if(response){
        NSArray* decodedResponse = [response objectFromJSONData];
        NSMutableArray * commits = [[NSMutableArray alloc] init];
        for (NSDictionary * temp in decodedResponse) {
            [commits addObject:[[Commits alloc] initWithInfo:temp]];
            
        }
        return commits;
        
    }
    return nil;
    
}

+(NSArray *) showAllUsersForSession:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/users?private_token=%@",session.url,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"GET"];
    if(response){
        NSArray* decodedResponse = [response objectFromJSONData];
        NSMutableArray * users = [[NSMutableArray alloc] init];
        for (NSDictionary * temp in decodedResponse) {
            [users addObject:[[User alloc] initWithInfo:temp]];
            
        }
        return users;
        
    }
    return nil;
    
}

+(User *) showUserForID:(NSNumber *)userID session:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/users/%@?private_token=%@",session.url,userID,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"GET"];
    if(response){
        NSDictionary* decodedResponse = [response objectFromJSONData];
        return [[User alloc] initWithInfo:decodedResponse];
        
    }
    return nil;
    
}
+(User *)showCurrentSessionUser:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/user?private_token=%@",session.url,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"GET"];
    if(response){
        NSDictionary* decodedResponse = [response objectFromJSONData];
        return [[User alloc] initWithInfo:decodedResponse];
    }
    return nil;
    

}
+(NSArray*)showSSHKeysForSession:(Session *)session{
NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/user/keys?private_token=%@",session.url,session.sessionToken];
NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"GET"];
if(response){
    NSArray* decodedResponse = [response objectFromJSONData];
    NSMutableArray * keys = [[NSMutableArray alloc] init];
    for (NSDictionary * temp in decodedResponse) {
        [keys addObject:[[SSHKey alloc] initWithInfo:temp]];
        
    }
 
    return keys;
    
}
return nil;
}
+(BOOL)addNewSSHkey:(NSString *)key title:(NSString *)title session:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/user/keys?title=%@&key=%@&private_token=%@",session.url,title,key,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"POST"];
    if(response){
        NSDictionary* decodedResponse = [response objectFromJSONData];
        if([[decodedResponse valueForKey:@"message"] isEqual:@"201 Created"]) {
            return YES;
        }
    
    }
return NO;
}

+(NSArray *)showMembersOfProject:(Project *)project session:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/members?private_token=%@",session.url,project.projectID,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"GET"];
    if(response){
        NSArray* decodedResponse = [response objectFromJSONData];
        NSMutableArray * members = [[NSMutableArray alloc] init];
        for (NSDictionary * temp in decodedResponse) {
            [members addObject:[[ProjectMember alloc] initWithInfo:temp]];
            
        }
        
        return members;
    }
    return nil;
}

+(BOOL)editMemberOfProject:(Project *)project ID:(NSNumber *)userID access_level:(NSNumber *)accessLevel session:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/members/%@?access_level=%@&private_token=%@",session.url,project.projectID,userID,accessLevel,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"PUT"];
    if(response){
        NSDictionary* decodedResponse = [response objectFromJSONData];
        if([[decodedResponse valueForKey:@"message"] isEqual:@"200 OK"]) {
            return YES;
        }
    }
    return NO;
}
+(BOOL)addMemberOfProject:(Project *)project ID:(NSNumber *)userID access_level:(NSNumber *)accessLevel session:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/members?user_id=%@&access_level=%@&private_token=%@",session.url,project.projectID,userID,accessLevel,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"POST"];
    if(response){
        NSDictionary* decodedResponse = [response objectFromJSONData];
        if([[decodedResponse valueForKey:@"message"] isEqual:@"201 Created"]) {
            return YES;
        }
    }
    return NO;
}
+(BOOL)removeMemberOfProject:(Project *)project ID:(NSNumber *)userID session:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/members/%@?private_token=%@",session.url,project.projectID,userID,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"DELETE"];
    if(response){
        NSDictionary* decodedResponse = [response objectFromJSONData];
        if([[decodedResponse valueForKey:@"message"] isEqual:@"200 OK"]) {
            return YES;
        }
    }
    return NO;
}

+(BOOL)deleteIssuesProject:(Project *)project issue_id:(NSNumber *)issueID session:(Session *)session{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/issues/%@?private_token=%@",session.url,project.projectID,issueID,session.sessionToken];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"DELETE"];
    if(response){
        NSDictionary* decodedResponse = [response objectFromJSONData];
        if([[decodedResponse valueForKey:@"message"] isEqual:@"200 OK"]) {
            return YES;
        }
    }
    return NO;
}
@end
