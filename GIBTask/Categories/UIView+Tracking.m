//
//  UIView+Tracking.m
//  GIBTask
//
//  Created by Isa Aliev on 22.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UIView+Tracking.h"

@implementation UIView (Tracking)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleImplementationsFor:@selector(didMoveToSuperview) and:@selector(x_didMoveToSuperview)];
    });
}

-(void)x_didMoveToSuperview {
    NSString *elementDescription = nil;
    
    if ([[self class] conformsToProtocol:@protocol(SelfDescriptor)]) {
        elementDescription = [(id<SelfDescriptor>)self trackingDescription];
    } else {
        elementDescription = NSStringFromClass([self class]);
    }
    
    NSLog(@"%@ with origin in %@ is on %@", elementDescription, NSStringFromCGPoint(self.frame.origin), [self.superview class]);
}
@end
