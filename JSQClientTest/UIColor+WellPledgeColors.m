//
//  UIColor+WellPledgeColors.m
//  JSQClientTest
//
//  Created by Antonio Carella on 8/20/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import "UIColor+WellPledgeColors.h"

@implementation UIColor (WellPledgeColors)

#pragma mark - Message bubble colors

+ (UIColor *)wp_messageBubbleCoachColor
{
    return [UIColor colorWithHue:195.0f / 360.0f
                      saturation:0.16f
                      brightness:0.96f
                           alpha:1.0f];
}

+ (UIColor *)wp_messageBubbleUserColor
{
    
    return [UIColor colorWithHue:195.0f / 360.0f
                      saturation:0.63f
                      brightness:0.95f
                           alpha:1.0f];
}


@end
