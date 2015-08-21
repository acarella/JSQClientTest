//
//  ChatMember.h
//  JSQClientTest
//
//  Created by Antonio Carella on 8/21/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Message;

@interface ChatMember : NSManagedObject

@property (nonatomic, retain) NSString * avatarUrl;
@property (nonatomic, retain) NSString * chatDisplayName;
@property (nonatomic, retain) Message *messages;

@end
