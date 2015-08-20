//
//  DataSource.m
//  JSQClientTest
//
//  Created by Antonio Carella on 8/20/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//
#import "AppDelegate.h"
#import "DataSource.h"
#import "UIColor+WellPledgeColors.h"

@interface DataSource()

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation DataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self loadFakeMessages];
        /**
         *  Create avatar images once.
         *
         *  Be sure to create your avatars one time and reuse them for good performance.
         *
         *  If you are not using avatars, ignore this.
         */
        JSQMessagesAvatarImage *userImage = [JSQMessagesAvatarImageFactory avatarImageWithUserInitials:@"ARC"
                                                                                      backgroundColor:[UIColor colorWithWhite:0.85f alpha:1.0f]
                                                                                            textColor:[UIColor colorWithWhite:0.60f alpha:1.0f]
                                                                                                 font:[UIFont systemFontOfSize:14.0f]
                                                                                             diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
        JSQMessagesAvatarImage *brianImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"demo_avatar_brian"]
                                                                                       diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
        
        self.avatars = @{ kJSQDemoAvatarIdBrian : brianImage,
                          kJSQDemoAvatarIdUser : userImage
                          };
        
        
        self.users = @{ kJSQDemoAvatarIdBrian : kJSQDemoAvatarDisplayNameBrian,
                        kJSQDemoAvatarIdUser : kJSQDemoAvatarDisplayNameUser};
        
        
        /**
         *  Create message bubble images objects.
         *
         *  Be sure to create your bubble images one time and reuse them for good performance.
         *
         */
        JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] init];
        
        self.outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor wp_messageBubbleUserColor]];
        self.incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor wp_messageBubbleCoachColor]];
    
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                                                
        NSManagedObjectContext *context = delegate.managedObjectContext;
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        // Configure the request's entity, and optionally its predicate.
        fetchRequest.entity = [NSEntityDescription entityForName:@"Message" inManagedObjectContext:context];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [fetchRequest setSortDescriptors:sortDescriptors];

        
        self.fetchedResultsController = [[NSFetchedResultsController alloc]
                                                  initWithFetchRequest:fetchRequest
                                                  managedObjectContext:context
                                                  sectionNameKeyPath:nil
                                                  cacheName:nil];
        self.fetchedResultsController.delegate = self;
        
        NSError *error;
        BOOL success = [self.fetchedResultsController performFetch:&error];
        
    }
    
    return self;
}

- (void)loadFakeMessages
{
    /**
     *  Load some fake messages for demo.
     *
     *  You should have a mutable array or orderedSet, or something.
     */
    self.messages = [[NSMutableArray alloc] initWithObjects:
                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdBrian
                                        senderDisplayName:kJSQDemoAvatarDisplayNameBrian
                                                     date:[NSDate distantPast]
                                                     text:@"Welcome to WellPledge Antonio!"],
                     
                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdBrian
                                        senderDisplayName:kJSQDemoAvatarDisplayNameBrian
                                                     date:[NSDate distantPast]
                                                     text:@"I'm Bryan, your personal health coach. Nice to meet you!"],
                     
                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdBrian
                                        senderDisplayName:kJSQDemoAvatarDisplayNameBrian
                                                     date:[NSDate distantPast]
                                                     text:@"As you send me updates about your weight, mood, sleep, and exercise I'll keep you accountable and cheer you on."],
                     
                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdBrian
                                        senderDisplayName:kJSQDemoAvatarDisplayNameBrian
                                                     date:[NSDate date]
                                                     text:@"Any questions? If not, let's get started with a reading on your weight."],
                     
                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdUser
                                        senderDisplayName:kJSQDemoAvatarDisplayNameUser
                                                     date:[NSDate date]
                                                     text:@"Hi Brian, ok, I'll upload a weight reading."],
                     
                     nil];
}

-(void)addTextMessage{

    JSQMessage *textMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdUser
                                                   displayName:kJSQDemoAvatarDisplayNameUser
                                                         media:nil];
    [self.messages addObject:textMessage];

}

- (void)addPhotoMediaMessage
{
    JSQPhotoMediaItem *photoItem = [[JSQPhotoMediaItem alloc] initWithImage:[UIImage imageNamed:@"goldengate"]];
    JSQMessage *photoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdUser
                                                   displayName:kJSQDemoAvatarDisplayNameUser
                                                         media:photoItem];
    [self.messages addObject:photoMessage];
}

@end
