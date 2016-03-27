//
//  CustomLable.m
//  AUDIT
//
//  Created by Zhayong on 11/25/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "CustomLable.h"

@implementation CustomLable

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self.layer setMasksToBounds:YES];
    self.layer.cornerRadius =  ZYcornerRadius;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = ZYColor(239, 240, 255).CGColor;
    
}

@end
