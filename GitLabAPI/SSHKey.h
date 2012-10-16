//
//  SSHKey.h
//  GitLabAPI
//
//  Created by Корзун Владислав on 16.10.12.
//  Copyright (c) 2012 Корзун Владислав. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSHKey : NSObject
@property (retain) NSString * title;
@property (retain) NSString * key;
@property (retain) NSNumber * keyID;

-(id)initWithInfo:(NSDictionary *)info;
@end
