//
//  UIButton+Tracking.m
//  GIBTask
//
//  Created by Isa Aliev on 22.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UIButton+Tracking.h"

@implementation UIButton (Tracking)
- (void)processTrackingOfEvents:(UIControlEvents)events {
    if (events & UIControlEventTouchUpInside) {
        NSLog(@"Button named %@ was tapped", self.titleLabel.text);
    }
}

- (NSString *)trackingDescription {
    return [NSString stringWithFormat:@"Button named %@ and colored with {%@}", self.titleLabel.text, self.backgroundColor];
}
@end
