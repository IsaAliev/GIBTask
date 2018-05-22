//
//  UISlider+Tracking.m
//  GIBTask
//
//  Created by Isa Aliev on 22.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UISlider+Tracking.h"

@implementation UISlider (Tracking)
- (void)processTrackingOfEvents:(UIControlEvents)events {
    if (events & UIControlEventTouchDragInside) {
        NSLog(@"Slider is dragging inside with value: %f", self.value);
    }
    
    if (events & UIControlEventValueChanged) {
        NSLog(@"Slider's value changed to %f", self.value);
    }
}
@end
