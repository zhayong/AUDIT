//
//  UIStoryboard+ZY.m
//  AUDIT
//
//  Created by Zhayong on 11/22/15.
//  Copyright © 2015 Zha Yong. All rights reserved.
//

#import "UIStoryboard+ZY.h"

@implementation UIStoryboard (ZY)

+ (UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)identifier inStoryboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:storyboardBundleOrNil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

@end
