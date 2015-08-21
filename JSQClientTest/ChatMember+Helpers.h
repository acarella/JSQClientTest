//
//  ChatMember+Helpers.h
//  JSQClientTest
//
//  Created by Antonio Carella on 8/21/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import "ChatMember.h"
#import "Member.h"
#import "Coach.h"

@interface ChatMember (Helpers)

+ (Member *)currentMember;
+ (Coach *)currentCoach;

@end
