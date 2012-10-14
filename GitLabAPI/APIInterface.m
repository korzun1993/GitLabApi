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

+(User *)createUserWithEmail:(NSString *)email password:(NSString *)password url:(NSString *)url{
  
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/session?email=%@&password=%@",url,email,password];
    NSData *response = [self takeResponseToRequest:fullRequest HTTPMethod:@"POST"];
    if(response){
        NSDictionary* decodedResponse = [response objectFromJSONData];
        return [[User alloc] initWithInfo:decodedResponse password:password url:url ];
    }
    return nil;
}

+(NSArray *)showAllProjectUser:(User *)user{
    
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects?private_token=%@",user.url,user.userToken];
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

+(NSArray *)showAllMilestoneProject:(Project *)project user:(User *)user{
    
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/milestones?id=%@&private_token=%@",user.url,project.projectID,project.projectID,user.userToken];
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

+(NSArray*)showAllIssuesUser:(User *)user{

    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/issues?private_token=%@",user.url,user.userToken];
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

+(NSArray *) showAllBranchesProject:(Project *)project user:(User *)user{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/repository/branches?private_token=%@",user.url,project.projectID,user.userToken];
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
+(NSArray *) showRepositoryCommitsProject:(Project *)project user:(User *)user{
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects/%@/repository/commits?private_token=%@",user.url,project.projectID,user.userToken];
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



@end
