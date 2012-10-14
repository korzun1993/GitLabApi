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
+(User *)createUserWithEmail:(NSString *)email password:(NSString *)password url:(NSString *)url{
  
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/session?email=%@&password=%@",url,email,password];
    
    NSURL *requestURL = [NSURL URLWithString:fullRequest];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:requestURL];
    [request setRequestMethod:@"POST"];
   
    [request startSynchronous];
    NSError *error = [request error];
    NSData *response;
    if (!error) {
        response   = [[request responseData] retain];
        NSDictionary* decodedResponse = [response objectFromJSONData];
        
      //  NSLog(@"%@",decodedResponse);
        return [[User alloc] initWithInfo:decodedResponse password:password url:url ];
    }
    return nil;
}

+(NSArray *)showAllProjectUser:(User *)user{
    
    NSString *fullRequest = [NSString stringWithFormat:@"%@/api/v2/projects?private_token=%@",user.url,user.userToken];
    
    NSURL *requestURL = [NSURL URLWithString:fullRequest];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:requestURL];
    [request setRequestMethod:@"GET"];
    
    [request startSynchronous];
    NSError *error = [request error];
    NSData *response;
    if (!error) {
        response   = [[request responseData] retain];
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
    
    NSURL *requestURL = [NSURL URLWithString:fullRequest];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:requestURL];
    [request setRequestMethod:@"GET"];
    
    [request startSynchronous];
    NSError *error = [request error];
    NSData *response;
    if (!error) {
        response   = [[request responseData] retain];
        NSArray* decodedResponse = [response objectFromJSONData];
        
                NSLog(@"%@",decodedResponse);
        
       // NSMutableArray * projects = [[NSMutableArray alloc] init];
        //for (NSDictionary * temp in decodedResponse) {
         //   [projects addObject:[[Project alloc] initWithInfo:temp]];
            
        //}
        //return projects;
    }
    return nil;
    
    
}


@end
