//
//  DataSource.h
//  JSQClientTest
//
//  Created by Antonio Carella on 8/20/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSQMessagesViewController/JSQMessages.h>
#import "Message.h"

@class DataSource;

@protocol DataSourceDelegate <NSObject>

-(void)updateData;

@end

@interface DataSource : NSObject

@property (weak, nonatomic) id<DataSourceDelegate> dataSourceDelegate;

@property (strong, nonatomic) NSArray *messages;

@property (strong, nonatomic) NSDictionary *avatars;

@property (strong, nonatomic) JSQMessagesBubbleImage *outgoingBubbleImageData;

@property (strong, nonatomic) JSQMessagesBubbleImage *incomingBubbleImageData;

@property (strong, nonatomic) NSDictionary *users;

- (void)addTextMessage:(JSQMessage *)message;
- (void)incomingTextFromSocket;

@end
