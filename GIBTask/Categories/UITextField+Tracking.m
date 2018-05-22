//
//  UITextField+Tracking.m
//  GIBTask
//
//  Created by Isa Aliev on 22.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UITextField+Tracking.h"

@implementation UITextField (Tracking)
- (void)processTrackingOfEvents:(UIControlEvents)events {
    if (events & UIControlEventEditingChanged) {
        NSLog(@"Textfield text changed to %@", self.text);
    }
    
    if (events & UIControlEventEditingDidEnd) {
        NSLog(@"End editing textfield");
    }
    
    if (events & UIControlEventEditingDidBegin) {
        NSLog(@"Begin editing textfield");
    }
    
    if (events & UIControlEventEditingDidBegin) {
        NSLog(@"Textfield editing did end on exit");
    }
}
@end
