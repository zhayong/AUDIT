//
//  CustomButton.m
//  AUDIT
//
//  Created by Zhayong on 11/29/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "CustomButton.h"

#define ratio 0.5

@implementation CustomButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.showsTouchWhenHighlighted = NO;
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted{

}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(self.width * ratio, 0, self.width * ratio, self.height);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, self.width * ratio, self.height);
}

@end
