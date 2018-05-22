//
//  NSObject+Swizzling.m
//  GIBTask
//
//  Created by Isa Aliev on 22.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "NSObject+Swizzling.h"

@implementation NSObject (Swizzling)
- (void)swizzleImplementationsFor:(SEL)s1 and:(SEL)s2 {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, s1);
    Method swizzledMethod = class_getInstanceMethod(class, s2);
    
    method_exchangeImplementations(swizzledMethod, originalMethod);
}
@end
