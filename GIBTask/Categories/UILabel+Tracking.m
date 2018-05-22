//
//  UILabel+Tracking.m
//  GIBTask
//
//  Created by Isa Aliev on 22.05.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "UILabel+Tracking.h"

@implementation UILabel (Tracking)

- (NSString *)trackingDescription {
    return [NSString stringWithFormat:@"Label with %@", [self.text substringToIndex:MIN(self.text.length, 10.0)]];
}

@end
