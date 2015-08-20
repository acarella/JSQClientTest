//
//  ViewController.h
//  JSQClientTest
//
//  Created by Antonio Carella on 8/20/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatViewController.h"

@interface ViewController : UIViewController <ChatViewControllerDelegate>

- (IBAction)unwindSegue:(UIStoryboardSegue *)sender;

@end

