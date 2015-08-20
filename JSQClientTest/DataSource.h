//
//  DataSource.h
//  JSQClientTest
//
//  Created by Antonio Carella on 8/20/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSQMessages.h"

static NSString * const kJSQDemoAvatarDisplayNameBrian = @"Coach Brian";
static NSString * const kJSQDemoAvatarDisplayNameUser = @"Current User";

static NSString * const kJSQDemoAvatarIdBrian = @"053496-4509-289";
static NSString * const kJSQDemoAvatarIdUser = @"468-768355-23123";

@interface DataSource : NSObject <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSMutableArray *messages;

@property (strong, nonatomic) NSDictionary *avatars;

@property (strong, nonatomic) JSQMessagesBubbleImage *outgoingBubbleImageData;

@property (strong, nonatomic) JSQMessagesBubbleImage *incomingBubbleImageData;

@property (strong, nonatomic) NSDictionary *users;

- (void)addPhotoMediaMessage;


@end
