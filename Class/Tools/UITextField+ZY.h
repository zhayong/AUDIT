//
//  UITextField+ZY.h
//  AUDIT
//
//  Created by Zhayong on 11/22/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ZY)

- (NSRange)ZYselectedRange;
- (void)ZYsetSelectedRange:(NSRange)range;

@end
