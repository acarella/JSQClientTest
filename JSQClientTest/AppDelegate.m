//
//  AppDelegate.m
//  JSQClientTest
//
//  Created by Antonio Carella on 8/20/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Message.h"
#import "Member.h"
#import "Coach.h"

static NSString * const kJSQDemoAvatarDisplayNameBrian = @"Coach Brian";
static NSString * const kJSQDemoAvatarDisplayNameUser = @"Current User";

static NSString * const kJSQDemoAvatarIdBrian = @"053496-4509-289";
static NSString * const kJSQDemoAvatarIdUser = @"468-768355-23123";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"ChatTest"];
    [Message MR_truncateAll];
    [ChatMember MR_truncateAll];
    
    [self loadFakeMessages];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)loadFakeMessages
{
    /**
     *  Load some fake messages for demo.
     *
     *  You should have a mutable array or orderedSet, or something.
     */
    
    Member *member = [Member MR_createEntity];
    member.chatDisplayName = @"Antonio";
    member.memberId = @"1";
    
    Coach *coach = [Coach MR_createEntity];
    coach.chatDisplayName = @"Bryan";
    coach.coachId = @"2";
    
    NSArray *coachTexts = [NSArray arrayWithObjects:@"Welcome to WellPledge Antonio!",
                             @"I'm Bryan, your personal health coach. Nice to meet you!",
                             @"As you send me updates about your weight, mood, sleep, and exercise I'll keep you accountable and cheer you on.",
                             @"Any questions? If not, let's get started with a reading on your weight.",
                             nil];
    
    int timeInterval = 60;
    for (NSString *messageText in coachTexts) {
        Message *message = [Message MR_createEntity];
        message.senderId = coach.coachId;
        message.senderDisplayName = coach.chatDisplayName;
        message.text = messageText;
        message.timeStamp = [NSDate dateWithTimeIntervalSinceNow:timeInterval];
        timeInterval += timeInterval;
    }
    
    Message *userMessage = [Message MR_createEntity];
    userMessage.senderId = member.memberId;
    userMessage.senderDisplayName = member.chatDisplayName;
    userMessage.text = @"Hi Brian, ok, I'll upload a weight reading.";
    userMessage.timeStamp = [NSDate dateWithTimeIntervalSinceNow:timeInterval];
    
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
    
    
    
}

@end
