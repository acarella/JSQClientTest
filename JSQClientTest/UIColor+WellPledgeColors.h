//
//  UIColor+WellPledgeColors.h
//  JSQClientTest
//
//  Created by Antonio Carella on 8/20/15.
//  Copyright (c) 2015 SuperflousJazzHands. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WellPledgeColors)

#pragma mark - Message bubble colors

/**
 *  @return A color object containing HSB values similar to the WP coach text cell color.
 */
+ (UIColor *)wp_messageBubbleCoachColor;

/**
 *  @return A color object containing HSB values similar to the WP user text cell color.
 */
+ (UIColor *)wp_messageBubbleUserColor;

@end
