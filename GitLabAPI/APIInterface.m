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
        
        NSLog(@"%@",decodedResponse);
        return [[User alloc] initWithEmail:email password:password token:[decodedResponse valueForKey:@"private_token" ]url:url];
    }
    return nil;
}

@end
