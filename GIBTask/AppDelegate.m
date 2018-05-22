//
//  AppDelegate.m
//  GIBTask
//
//  Created by Isa Aliev on 21.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "AppDelegate.h"

#import <objc/runtime.h>

//[<UITextView 0x7fcd97053a00> keyboardInput:<UITextView 0x7fcd97053a00> shouldInsertText:@"y" isMarkedText:0]

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [UITextView xtrace];
//    int numClasses;
//    Class * classes = NULL;
//
//    classes = NULL;
//    numClasses = objc_getClassList(NULL, 0);
//
//    if (numClasses > 0 ) {
//        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
//        numClasses = objc_getClassList(classes, numClasses);
//        for (int i = 0; i < numClasses; i++) {
//            Class c = classes[i];
//            if (class_conformsToProtocol(c, @protocol(UIKeyInput))) {
//                SEL s1 = @selector(insertText:);
//                SEL s2 = @selector(x_insertText:);
//
//                Method originalMethod = class_getInstanceMethod(c, s1);
//                Method swizzledMethod = class_getInstanceMethod([self class], s2);
//                
//                method_exchangeImplementations(swizzledMethod, originalMethod);
//                NSLog(@"%@ Conforms", NSStringFromClass(c));
//            }
//        }
//        free(classes);
//    }

    return YES;
}

- (void)x_insertText: (NSString *)text {
    NSLog(@"INS %@", text);
}

@end
