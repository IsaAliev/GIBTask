//
//  UISwitch+Tracking.m
//  GIBTask
//
//  Created by Isa Aliev on 22.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UISwitch+Tracking.h"

@implementation UISwitch (Tracking)
- (void)processTrackingOfEvents:(UIControlEvents)events {
    if (events & UIControlEventValueChanged) {
        NSLog(@"Switch's value has changed to %d", self.isOn);
    }
}
@end
