//
//  UIControl+Tracking.m
//  GIBTask
//
//  Created by Isa Aliev on 22.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UIControl+Tracking.h"

@implementation UIControl (Tracking)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleImplementationsFor:@selector(_sendActionsForEvents:withEvent:)
                                    and:@selector(x_sendActionsForEvents:withEvent:)];
    });
}

- (void)x_sendActionsForEvents:(UIControlEvents)events withEvent:(UIEvent *)event {
    if ([[self class] conformsToProtocol:@protocol(TrackingProcessor)]) {
        [(id <TrackingProcessor>)self processTrackingOfEvents:events];
    } else {
        NSLog(@"Default log for %@ with control events bitmask %lu", NSStringFromClass([self class]), (unsigned long)events);
    }
    
    [self x_sendActionsForEvents:events withEvent:event];
}
@end
