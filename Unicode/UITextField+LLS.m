//
//  UITextField+LLS.m
//  Pasteboard
//
//  Created by liulishuo on 2017/11/17.
//  Copyright © 2017年 liulishuo. All rights reserved.
//

#import "UITextField+LLS.h"

@implementation UITextField (LLS)

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return action == @selector(paste:);
}

- (void)paste:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    NSString *tempString = pasteboard.string;
    tempString = [tempString stringByReplacingOccurrencesOfString:@"\U0000202d" withString:@""];
    tempString = [tempString stringByReplacingOccurrencesOfString:@"\U0000202c" withString:@""];
    self.text = tempString;
    [self sendActionsForControlEvents:UIControlEventEditingChanged];
}
@end
