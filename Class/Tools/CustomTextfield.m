//
//  CustomTextfield.m
//  AUDIT
//
//  Created by Zhayong on 11/22/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "CustomTextfield.h"

#define cursorPointX 20.0

@implementation CustomTextfield

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
    }
    return self;
}

- (CGRect)borderRectForBounds:(CGRect)bounds
{
    return bounds;
}
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake(cursorPointX, 0, bounds.size.width - cursorPointX, bounds.size.height);
}
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return bounds;
    
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectMake(cursorPointX, 0, bounds.size.width - cursorPointX, bounds.size.height);
}

@end
