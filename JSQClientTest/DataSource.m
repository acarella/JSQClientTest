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
#import "Message.h"
#import "ChatMember+Helpers.h"
#import "SocketIOSingleton.h"
#import <MagicalRecord/MagicalRecord.h>

@interface DataSource()

@end

@implementation DataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[SocketIOSingleton sharedSingleton] setCallback:^(NSArray *data, void (^ack)(NSArray*)) {
            [self insertNewObjectFromServer:data];
        } forEvent:@"chat"];
        
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
        Coach *coach = [ChatMember currentCoach];
        Member *member = [ChatMember currentMember];
        
        self.avatars = @{ coach.coachId : brianImage,
                          member.memberId : userImage
                          };
        
        
        self.users = @{ coach.coachId : coach.chatDisplayName,
                        member.memberId : member.chatDisplayName};
        
        /**
         *  Create message bubble images objects.
         *
         *  Be sure to create your bubble images one time and reuse them for good performance.
         *
         */
        JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] init];
        
        self.outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor wp_messageBubbleUserColor]];
        self.incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor wp_messageBubbleCoachColor]];
    
    }
    
    return self;
}

-(NSArray *)messages{

    NSMutableArray *temp = [[NSMutableArray alloc]init];
    
    NSArray *messages = [Message MR_findAll];
    for (Message *message in messages) {
        JSQMessage *jsqMessage = [[JSQMessage alloc]initWithSenderId:message.senderId senderDisplayName:message.senderDisplayName date:message.timeStamp text:message.text];
        [temp addObject:jsqMessage];
    }
    
    NSSortDescriptor *timeSort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    
    return [NSArray arrayWithArray:[temp sortedArrayUsingDescriptors:@[timeSort]]];
}

-(void)addTextMessage:(JSQMessage *)message{
    
    [[SocketIOSingleton sharedSingleton]sendMessage:message.text];
    
    Message *messageCD = [Message MR_createEntity];
    messageCD.text = message.text;
    messageCD.senderId = message.senderId;
    messageCD.senderDisplayName = [ChatMember currentMember].chatDisplayName;
    messageCD.timeStamp = [NSDate date];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    [self updateArray];
}

-(void)insertNewObjectFromServer:(NSArray *)data{

    Message *message = [Message MR_createEntity];
    
    [message setText:data[0]];
    [message setTimeStamp:[NSDate dateWithTimeIntervalSince1970:([data[1] doubleValue]/1000)]];
    [message setSenderDisplayName:[ChatMember currentCoach].chatDisplayName];
    [message setSenderId:[ChatMember currentCoach].coachId];
    [self updateArray];
    
}

-(void)updateArray{

    self.messages = [Message MR_findAllSortedBy:@"timeStamp" ascending:YES];
    [self.dataSourceDelegate updateData];

}

- (void)addPhotoMediaMessage
{
    JSQPhotoMediaItem *photoItem = [[JSQPhotoMediaItem alloc] initWithImage:[UIImage imageNamed:@"goldengate"]];
//    JSQMessage *photoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdUser
//                                                   displayName:kJSQDemoAvatarDisplayNameUser
//                                                         media:photoItem];
    //[self.messages addObject:photoMessage];
}

@end
