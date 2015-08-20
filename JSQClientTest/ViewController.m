//
//  ViewController.m
//  JSQClientTest
//
//  Created by Antonio Carella on 8/20/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)talkToButtonPressed:(UIButton *)sender {
    ChatViewController *vc = [ChatViewController messagesViewController];
    vc.delegateModal = self;
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nc animated:YES completion:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueModalChatVC"]) {
        UINavigationController *nc = segue.destinationViewController;
        ChatViewController *vc = (ChatViewController *)nc.topViewController;
        vc.delegateModal = self;
    }
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)sender { }

#pragma mark - Demo delegate

- (void)didDismissChatViewController:(ChatViewController *)vc
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
