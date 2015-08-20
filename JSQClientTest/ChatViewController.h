//
//  ChatViewController.h
//  JSQClientTest
//
//  Created by Antonio Carella on 8/20/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import "JSQMessages.h"
#import "JSQMessagesViewController.h"
#import "DataSource.h"

@class ChatViewController;

@protocol ChatViewControllerDelegate <NSObject>

- (void)didDismissChatViewController:(ChatViewController *)vc;

@end

@interface ChatViewController : JSQMessagesViewController <UIActionSheetDelegate>

@property (weak, nonatomic) id<ChatViewControllerDelegate> delegateModal;

@property (strong, nonatomic) DataSource *demoData;

- (void)closePressed:(UIBarButtonItem *)sender;

@end
