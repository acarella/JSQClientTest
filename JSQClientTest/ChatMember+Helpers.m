//
//  ChatMember+Helpers.m
//  JSQClientTest
//
//  Created by Antonio Carella on 8/21/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import "ChatMember+Helpers.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation ChatMember (Helpers)

+ (Member *)currentMember{

    return [[Member MR_findAll]firstObject];
}

+ (Coach *)currentCoach{

    return [[Coach MR_findAll]firstObject];
    
}

@end
