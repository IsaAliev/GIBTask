//
//  UITextView+Tracking.m
//  GIBTask
//
//  Created by Isa Aliev on 22.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UITextView+Tracking.h"

//[<UITextView 0x7fcd97053a00> keyboardInput:<UITextView 0x7fcd97053a00> shouldInsertText:@"y" isMarkedText:0]

@implementation UITextView (Tracking)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleImplementationsFor:@selector(keyboardInput:shouldInsertText:isMarkedText:)
                                    and:@selector(x_keyboardInput:shouldInsertText:isMarkedText:)];
        [self swizzleImplementationsFor:@selector(deleteBackward)
                                    and:@selector(x_deleteBackward)];
    });
}

- (BOOL)x_keyboardInput:(UIView*)input shouldInsertText:(NSString *)text isMarkedText:(BOOL)isMarked {
    NSLog(@"Typing %@ in textview", text);
    [self printCurrentText];
    return [self x_keyboardInput:input shouldInsertText:text isMarkedText:isMarked];
}

- (void)x_deleteBackward {
    NSLog(@"Deleting in text view");
    [self printCurrentText];
}

- (void)printCurrentText {
    NSLog(@"Current text %@", [self.text substringToIndex:MIN(15, self.text.length)]);
}

@end
