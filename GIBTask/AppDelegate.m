//
//  AppDelegate.m
//  GIBTask
//
//  Created by Isa Aliev on 21.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //[UIView xtrace];
    
    // Override point for customization after application launch.
    return YES;
}

@end

@implementation UIView (Tracking)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(didMoveToSuperview);
        SEL swizzledSelector = @selector(x_didMoveToSuperview);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        method_exchangeImplementations(swizzledMethod, originalMethod);
    });
}

-(void)x_didMoveToSuperview {
    NSLog(@"%@ is on %@ now", [self class], [self.superview class]);
}
@end

@implementation UISwitch (Tracking)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(setOn:animated:notifyingVisualElement:);
        SEL swizzledSelector = @selector(x_setOn:animated:notifyingVisualElement:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        method_exchangeImplementations(swizzledMethod, originalMethod);
    });
}

-(void)x_setOn:(BOOL)on animated:(BOOL)animated notifyingVisualElement:(BOOL)notifying {
    NSLog(@"Set on: %d", on);
    [self x_setOn:on animated:animated notifyingVisualElement:notifying];
}
@end

@implementation UITextField (Tracking)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(insertFilteredText:);
        SEL swizzledSelector = @selector(x_insertFilteredText:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        method_exchangeImplementations(swizzledMethod, originalMethod);
    });
}

-(NSRange)x_insertFilteredText:(NSString *)text {
    NSLog(@"Text: %@", self.text);
    return [self x_insertFilteredText:text];
}
@end

@implementation UIControl (Tracking)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(endTrackingWithTouch:withEvent:);
        SEL swizzledSelector = @selector(x_endTrackingWithTouch:withEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        method_exchangeImplementations(swizzledMethod, originalMethod);
    });
}

-(void)x_endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"Action for %@", NSStringFromClass([self class]));
    [self x_endTrackingWithTouch:touch withEvent:event];
}

@end
