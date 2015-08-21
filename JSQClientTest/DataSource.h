//
//  DataSource.h
//  JSQClientTest
//
//  Created by Antonio Carella on 8/20/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSQMessages.h"
#import "Message.h"
#import <CoreData/CoreData.h>

@interface DataSource : NSObject <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSArray *messages;

@property (strong, nonatomic) NSDictionary *avatars;

@property (strong, nonatomic) JSQMessagesBubbleImage *outgoingBubbleImageData;

@property (strong, nonatomic) JSQMessagesBubbleImage *incomingBubbleImageData;

@property (strong, nonatomic) NSDictionary *users;

- (void)addTextMessage:(JSQMessage *)message;


@end
