//
//  Message.h
//  JSQClientTest
//
//  Created by Antonio Carella on 8/21/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Message : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * senderId;
@property (nonatomic, retain) NSString * senderDisplayName;

@end
