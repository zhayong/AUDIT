//
//  Lyt.h
//  Lyt
//
//  Created by Hermes Pique on 26/03/14.
//  Copyright (c) 2014 Robot Media. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "Lyt.h"

@implementation LYTView (LytUtils)

- (LYTView*)lyt_ancestorSharedWithView:(LYTView*)aView
{
#if TARGET_OS_IPHONE
    // TODO: Inneficient if view isn't a sibling or direct ancestor
    if (aView == nil) return nil;
    if (self == aView) return self;
    if (self == aView.superview) return self;
    LYTView *ancestor = [self.superview lyt_ancestorSharedWithView:aView];
    if (ancestor) return ancestor;
    return [self lyt_ancestorSharedWithView:aView.superview];
#else
    return [self ancestorSharedWithView:aView];
#endif
}

- (void)lyt_addConstraint:(NSLayoutConstraint*)constraint toAncestorSharedWithView:(LYTView*)view
{
    LYTView *ancestor = [self lyt_ancestorSharedWithView:view];
    [ancestor addConstraint:constraint];
}

- (void)lyt_addConstraints:(NSArray*)constraints toAncestorSharedWithView:(LYTView*)view
{
    LYTView *ancestor = [self lyt_ancestorSharedWithView:view];
    [ancestor addConstraints:constraints];
}

@end

@implementation LYTView (Lyt)

#pragma mark Alignment

- (NSLayoutConstraint*)lyt_alignTopToParent
{
    return [self lyt_alignTopToParentWithMargin:0];
}

- (NSLayoutConstraint*)lyt_alignTopToParentWithMargin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByAligningTopToParentWithMargin:margin];
    [self.superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_alignTopToView:(LYTView*)view
{
    return [self lyt_alignTopToView:view margin:0];
}

- (NSLayoutConstraint*)lyt_alignTopToView:(LYTView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByAligningTopToView:view margin:margin];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_alignRightToParent
{
    return [self lyt_alignRightToParentWithMargin:0];
}

- (NSLayoutConstraint*)lyt_alignRightToParentWithMargin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByAligningRightToView:self.superview margin:margin];
    [self.superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_alignRightToView:(LYTView*)view
{
    return [self lyt_alignRightToView:view margin:0];
}

- (NSLayoutConstraint*)lyt_alignRightToView:(LYTView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByAligningRightToView:view margin:margin];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_alignBottomToParent
{
    return [self lyt_alignBottomToParentWithMargin:0];
}

- (NSLayoutConstraint*)lyt_alignBottomToParentWithMargin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByAligningBottomToParentWithMargin:margin];
    [self.superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_alignBottomToView:(LYTView*)view
{
    return [self lyt_alignBottomToView:view margin:0];
}

- (NSLayoutConstraint*)lyt_alignBottomToView:(LYTView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByAligningBottomToView:view margin:margin];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_alignLeftToParent
{
    return [self lyt_alignLeftToParentWithMargin:0];
}

- (NSLayoutConstraint*)lyt_alignLeftToParentWithMargin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByAligningLeftToView:self.superview margin:margin];
    [self.superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_alignLeftToView:(LYTView*)view
{
    return [self lyt_alignLeftToView:view margin:0];
}

- (NSLayoutConstraint*)lyt_alignLeftToView:(LYTView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByAligningLeftToView:view margin:margin];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSArray*)lyt_alignSidesToParent
{
    return [self lyt_alignSidesToParentWithMargin:0];
}

- (NSArray*)lyt_alignSidesToParentWithMargin:(CGFloat)margin
{
    NSArray *constraints = [self lyt_constraintsByAligningSidesToParentWithMargin:margin];
    [self.superview addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_alignSidesToView:(LYTView*)view
{
    return [self lyt_alignSidesToView:view margin:0];
}

- (NSArray*)lyt_alignSidesToView:(LYTView*)view margin:(CGFloat)margin
{
    NSArray *constraints = [self lyt_constraintsByAligningSidesToView:view margin:margin];
    [self lyt_addConstraints:constraints toAncestorSharedWithView:view];
    return constraints;
}

- (NSArray*)lyt_alignToParent
{
    return [self lyt_alignToParentWithMargin:0];
}

- (NSArray*)lyt_alignToParentWithMargin:(CGFloat)margin
{
    NSArray *constraints = [self lyt_constraintsByAligningToParentWithMargin:margin];
    [self.superview addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_alignToView:(LYTView*)view
{
    return [self lyt_alignToView:view margin:0];
}

- (NSArray*)lyt_alignToView:(LYTView*)view margin:(CGFloat)margin
{
    NSArray *constraints = [self lyt_constraintsByAligningToView:view margin:margin];
    [self.superview addConstraints:constraints];
    return constraints;
}

- (NSLayoutConstraint*)lyt_constraintByAligningTopToParent
{
    return [self lyt_constraintByAligningTopToParentWithMargin:0];
}

- (NSLayoutConstraint*)lyt_constraintByAligningTopToParentWithMargin:(CGFloat)margin
{
    return [self lyt_constraintByAligningTopToView:self.superview margin:margin];
}

- (NSLayoutConstraint*)lyt_constraintByAligningTopToView:(LYTView*)view
{
    return [self lyt_constraintByAligningTopToView:view margin:0];
}

- (NSLayoutConstraint*)lyt_constraintByAligningTopToView:(LYTView*)view margin:(CGFloat)margin
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:margin];
}

- (NSLayoutConstraint*)lyt_constraintByAligningRightToParent
{
    return [self lyt_constraintByAligningRightToParentWithMargin:0];
}

- (NSLayoutConstraint*)lyt_constraintByAligningRightToParentWithMargin:(CGFloat)margin
{
    return [self lyt_constraintByAligningRightToView:self.superview margin:margin];
}

- (NSLayoutConstraint*)lyt_constraintByAligningRightToView:(LYTView*)view
{
    return [self lyt_constraintByAligningRightToView:view margin:0];
}

- (NSLayoutConstraint*)lyt_constraintByAligningRightToView:(LYTView*)view margin:(CGFloat)margin
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:-margin];
}

- (NSLayoutConstraint*)lyt_constraintByAligningBottomToParent
{
    return [self lyt_constraintByAligningBottomToParentWithMargin:0];
}

- (NSLayoutConstraint*)lyt_constraintByAligningBottomToParentWithMargin:(CGFloat)margin
{
    return [self lyt_constraintByAligningBottomToView:self.superview margin:margin];
}

- (NSLayoutConstraint*)lyt_constraintByAligningBottomToView:(LYTView*)view
{
    return [self lyt_constraintByAligningBottomToView:view margin:0];
}

- (NSLayoutConstraint*)lyt_constraintByAligningBottomToView:(LYTView*)view margin:(CGFloat)margin
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:-margin];
}

- (NSLayoutConstraint*)lyt_constraintByAligningLeftToParent
{
    return [self lyt_constraintByAligningLeftToParentWithMargin:0];
}

- (NSLayoutConstraint*)lyt_constraintByAligningLeftToParentWithMargin:(CGFloat)margin
{
    return [self lyt_constraintByAligningLeftToView:self.superview margin:margin];
}

- (NSLayoutConstraint*)lyt_constraintByAligningLeftToView:(LYTView*)view
{
    return [self lyt_constraintByAligningLeftToView:view margin:0];
}

- (NSLayoutConstraint*)lyt_constraintByAligningLeftToView:(LYTView*)view margin:(CGFloat)margin
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1 constant:margin];
}

- (NSArray*)lyt_constraintsByAligningSidesToParentWithMargin:(CGFloat)margin
{
    return [self lyt_constraintsByAligningSidesToView:self.superview margin:margin];
}

- (NSArray*)lyt_constraintsByAligningSidesToView:(LYTView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *leftConstraint = [self lyt_constraintByAligningLeftToView:view margin:margin];
    NSLayoutConstraint *rightConstraint = [self lyt_constraintByAligningRightToView:view margin:margin];
    return @[leftConstraint, rightConstraint];
}

- (NSArray*)lyt_constraintsByAligningToParent
{
    return [self lyt_constraintsByAligningToView:self.superview margin:0];
}

- (NSArray*)lyt_constraintsByAligningToParentWithMargin:(CGFloat)margin
{
    return [self lyt_constraintsByAligningToView:self.superview margin:margin];
}

- (NSArray*)lyt_constraintsByAligningToView:(LYTView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *topConstraint = [self lyt_constraintByAligningTopToView:view margin:margin];
    NSLayoutConstraint *rightConstraint = [self lyt_constraintByAligningRightToView:view margin:margin];
    NSLayoutConstraint *bottomConstraint = [self lyt_constraintByAligningBottomToView:view margin:margin];
    NSLayoutConstraint *leftConstraint = [self lyt_constraintByAligningLeftToView:view margin:margin];
    return @[topConstraint, rightConstraint, bottomConstraint, leftConstraint];
}

#pragma mark Centering

- (NSLayoutConstraint*)lyt_centerXInParent
{
    return [self lyt_centerXInParentWithOffset:0];
}

- (NSLayoutConstraint*)lyt_centerXInParentWithOffset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [self lyt_constraintByCenteringXInParentWithOffset:offset];
    [self.superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_centerXWithView:(LYTView*)view
{
    return [self lyt_centerXWithView:view offset:0];
}

- (NSLayoutConstraint*)lyt_centerXWithView:(LYTView*)view offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [self lyt_constraintByCenteringXWithView:view offset:offset];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_centerYInParent
{
    return [self lyt_centerYInParentWithOffset:0];
}

- (NSLayoutConstraint*)lyt_centerYInParentWithOffset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [self lyt_constraintByCenteringYInParentWithOffset:offset];
    [self.superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_centerYWithView:(LYTView*)view
{
    return [self lyt_centerYWithView:view offset:0];
}

- (NSLayoutConstraint*)lyt_centerYWithView:(LYTView*)view offset:(CGFloat)offset
{
    NSLayoutConstraint *constraint = [self lyt_constraintByCenteringYWithView:view offset:offset];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSArray*)lyt_centerInParent
{
    return [self lyt_centerInParentWithOffset:0];
}

- (NSArray*)lyt_centerInParentWithOffset:(CGFloat)offset
{
    NSArray *constraints = [self lyt_constraintsByCenteringInParentWithOffset:offset];
    [self.superview addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_centerWithView:(LYTView*)view
{
    return [self lyt_centerWithView:view offset:0];
}

- (NSArray*)lyt_centerWithView:(LYTView*)view offset:(CGFloat)offset
{
    NSArray *constraints = [self lyt_constraintsByCenteringWithView:view offset:offset];
    [self lyt_addConstraints:constraints toAncestorSharedWithView:view];
    return constraints;
}

- (NSLayoutConstraint*)lyt_constraintByCenteringXInParent
{
    return [self lyt_constraintByCenteringXInParentWithOffset:0];
}

- (NSLayoutConstraint*)lyt_constraintByCenteringXInParentWithOffset:(CGFloat)offset
{
    return [self lyt_constraintByCenteringXWithView:self.superview offset:offset];
}

- (NSLayoutConstraint*)lyt_constraintByCenteringXWithView:(LYTView*)view
{
    return [self lyt_constraintByCenteringXWithView:view offset:0];
}

- (NSLayoutConstraint*)lyt_constraintByCenteringXWithView:(LYTView*)view offset:(CGFloat)offset
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1 constant:offset];
}

- (NSLayoutConstraint*)lyt_constraintByCenteringYInParent
{
    return [self lyt_constraintByCenteringYInParentWithOffset:0];
}

- (NSLayoutConstraint*)lyt_constraintByCenteringYInParentWithOffset:(CGFloat)offset
{
    return [self lyt_constraintByCenteringYWithView:self.superview offset:offset];
}

- (NSLayoutConstraint*)lyt_constraintByCenteringYWithView:(LYTView*)view
{
    return [self lyt_constraintByCenteringYWithView:view offset:0];
}

- (NSLayoutConstraint*)lyt_constraintByCenteringYWithView:(LYTView*)view offset:(CGFloat)offset
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:offset];
}

- (NSArray*)lyt_constraintsByCenteringInParent
{
    return [self lyt_constraintsByCenteringInParentWithOffset:0];
}

- (NSArray*)lyt_constraintsByCenteringInParentWithOffset:(CGFloat)offset
{
    return [self lyt_constraintsByCenteringWithView:self.superview offset:offset];
}

- (NSArray*)lyt_constraintsByCenteringWithView:(LYTView*)view
{
    return [self lyt_constraintsByCenteringWithView:view offset:0];
}

- (NSArray*)lyt_constraintsByCenteringWithView:(LYTView*)view offset:(CGFloat)offset
{
    NSLayoutConstraint *centerXConstraint = [self lyt_constraintByCenteringXWithView:view offset:offset];
    NSLayoutConstraint *centerYConstraint = [self lyt_constraintByCenteringYWithView:view offset:offset];
    return @[centerXConstraint, centerYConstraint];
}

#pragma mark Placement

- (NSLayoutConstraint*)lyt_placeAboveView:(LYTView*)view
{
    return [self lyt_placeAboveView:view margin:0];
}

- (NSLayoutConstraint*)lyt_placeAboveView:(LYTView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByPlacingAboveView:view margin:margin];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_placeRightOfView:(LYTView*)view
{
    return [self lyt_placeRightOfView:view margin:0];
}

- (NSLayoutConstraint*)lyt_placeRightOfView:(LYTView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByPlacingRightOfView:view margin:margin];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_placeBelowView:(LYTView*)view
{
    return [self lyt_placeBelowView:view margin:0];
}

- (NSLayoutConstraint*)lyt_placeBelowView:(LYTView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByPlacingBelowView:view margin:margin];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_placeLeftOfView:(LYTView*)view
{
    return [self lyt_placeLeftOfView:view margin:0];
}

- (NSLayoutConstraint*)lyt_placeLeftOfView:(LYTView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByPlacingLeftOfView:view margin:margin];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_constraintByPlacingAboveView:(LYTView*)view
{
    return [self lyt_constraintByPlacingAboveView:view margin:0];
}

- (NSLayoutConstraint*)lyt_constraintByPlacingAboveView:(LYTView*)view margin:(CGFloat)margin
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:-margin];
}

- (NSLayoutConstraint*)lyt_constraintByPlacingRightOfView:(LYTView*)view
{
    return [self lyt_constraintByPlacingRightOfView:view margin:0];
}

- (NSLayoutConstraint*)lyt_constraintByPlacingRightOfView:(LYTView*)view margin:(CGFloat)margin
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:margin];
}

- (NSLayoutConstraint*)lyt_constraintByPlacingBelowView:(LYTView*)view
{
    return [self lyt_constraintByPlacingBelowView:view margin:0];
}

- (NSLayoutConstraint*)lyt_constraintByPlacingBelowView:(LYTView*)view margin:(CGFloat)margin
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:margin];
}

- (NSLayoutConstraint*)lyt_constraintByPlacingLeftOfView:(LYTView*)view
{
    return [self lyt_constraintByPlacingLeftOfView:view margin:0];
}

- (NSLayoutConstraint*)lyt_constraintByPlacingLeftOfView:(LYTView*)view margin:(CGFloat)margin
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1 constant:-margin];
}

#pragma mark Position and Sizing

- (NSLayoutConstraint*)lyt_setX:(CGFloat)x
{
    NSLayoutConstraint *constraint = [self lyt_constraintBySettingX:x];
    [self.superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_setY:(CGFloat)y
{
    NSLayoutConstraint *constraint = [self lyt_constraintBySettingY:y];
    [self.superview addConstraint:constraint];
    return constraint;
}

- (NSArray*)lyt_setOrigin:(CGPoint)origin
{
    NSArray *constraints = [self lyt_constraintsBySettingOrigin:origin];
    [self.superview addConstraints:constraints];
    return constraints;
}

- (NSLayoutConstraint*)lyt_setWidth:(CGFloat)width
{
    NSLayoutConstraint *constraint = [self lyt_constraintBySettingWidth:width];
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_setMaxWidth:(CGFloat)width
{
    NSLayoutConstraint *constraint = [self lyt_constraintBySettingMaxWidth:width];
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_setMinWidth:(CGFloat)width
{
    NSLayoutConstraint *constraint = [self lyt_constraintBySettingMinWidth:width];
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_setHeight:(CGFloat)height
{
    NSLayoutConstraint *constraint = [self lyt_constraintBySettingHeight:height];
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_setMaxHeight:(CGFloat)height
{
    NSLayoutConstraint *constraint = [self lyt_constraintBySettingMaxHeight:height];
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint*)lyt_setMinHeight:(CGFloat)height
{
    NSLayoutConstraint *constraint = [self lyt_constraintBySettingMinHeight:height];
    [self addConstraint:constraint];
    return constraint;
}

- (NSArray*)lyt_setSize:(CGSize)size
{
    NSArray *constraints = [self lyt_constraintsBySettingSize:size];
    [self addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_setMaxSize:(CGSize)size
{
    NSArray *constraints = [self lyt_constraintsBySettingMaxSize:size];
    [self addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_setMinSize:(CGSize)size
{
    NSArray *constraints = [self lyt_constraintsBySettingMinSize:size];
    [self addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_setFrame:(CGRect)frame
{
    NSArray *originConstraints = [self lyt_constraintsBySettingOrigin:frame.origin];
    [self.superview addConstraints:originConstraints];
    NSArray *widthConstraints = [self lyt_constraintsBySettingSize:frame.size];
    [self addConstraints:widthConstraints];
    return [originConstraints arrayByAddingObjectsFromArray:widthConstraints];
}

- (NSLayoutConstraint*)lyt_matchWidthToView:(LYTView*)view
{
    NSLayoutConstraint *constraint = [self lyt_constraintByMatchingWidthToView:view];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_matchHeightToView:(LYTView*)view
{
    NSLayoutConstraint *constraint = [self lyt_constraintByMatchingHeightToView:view];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_matchWidthToView:(LYTView*)view multiplier:(CGFloat)multiplier
{
    NSLayoutConstraint *constraint = [self lyt_constraintByMatchingWidthToView:view multiplier:multiplier];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_matchHeightToView:(LYTView*)view multiplier:(CGFloat)multiplier
{
    NSLayoutConstraint *constraint = [self lyt_constraintByMatchingHeightToView:view multiplier:multiplier];
    [self lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint*)lyt_constraintBySettingX:(CGFloat)x
{
    return [self lyt_constraintByAligningLeftToParentWithMargin:x];
}

- (NSLayoutConstraint*)lyt_constraintBySettingY:(CGFloat)y
{
    return [self lyt_constraintByAligningTopToParentWithMargin:y];
}

- (NSArray*)lyt_constraintsBySettingOrigin:(CGPoint)origin
{
    NSLayoutConstraint *xConstraint = [self lyt_constraintBySettingX:origin.x];
    NSLayoutConstraint *yConstraint = [self lyt_constraintBySettingY:origin.y];
    return @[xConstraint, yConstraint];
}

- (NSLayoutConstraint*)lyt_constraintBySettingWidth:(CGFloat)width
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width];
}

- (NSLayoutConstraint*)lyt_constraintBySettingMaxWidth:(CGFloat)width
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width];
}

- (NSLayoutConstraint*)lyt_constraintBySettingMinWidth:(CGFloat)width
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width];
}

- (NSLayoutConstraint*)lyt_constraintBySettingHeight:(CGFloat)height
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
}

- (NSLayoutConstraint*)lyt_constraintBySettingMaxHeight:(CGFloat)height
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
}

- (NSLayoutConstraint*)lyt_constraintBySettingMinHeight:(CGFloat)height
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
}

- (NSArray*)lyt_constraintsBySettingSize:(CGSize)size
{
    NSLayoutConstraint *widthConstraint = [self lyt_constraintBySettingWidth:size.width];
    NSLayoutConstraint *heightConstraint = [self lyt_constraintBySettingHeight:size.height];
    return @[widthConstraint, heightConstraint];
}

- (NSArray*)lyt_constraintsBySettingMaxSize:(CGSize)size
{
    NSLayoutConstraint *widthConstraint = [self lyt_constraintBySettingMaxWidth:size.width];
    NSLayoutConstraint *heightConstraint = [self lyt_constraintBySettingMaxHeight:size.height];
    return @[widthConstraint, heightConstraint];
}

- (NSArray*)lyt_constraintsBySettingMinSize:(CGSize)size
{
    NSLayoutConstraint *widthConstraint = [self lyt_constraintBySettingMinWidth:size.width];
    NSLayoutConstraint *heightConstraint = [self lyt_constraintBySettingMinHeight:size.height];
    return @[widthConstraint, heightConstraint];
}

- (NSArray*)lyt_constraintsBySettingFrame:(CGRect)frame
{
    NSLayoutConstraint *xConstraint = [self lyt_constraintBySettingX:frame.origin.x];
    NSLayoutConstraint *yConstraint = [self lyt_constraintBySettingY:frame.origin.y];
    NSLayoutConstraint *widthConstraint = [self lyt_constraintBySettingWidth:frame.size.width];
    NSLayoutConstraint *heightConstraint = [self lyt_constraintBySettingHeight:frame.size.height];
    return @[xConstraint, yConstraint, widthConstraint, heightConstraint];
}

- (NSLayoutConstraint*)lyt_constraintByMatchingWidthToView:(LYTView*)view
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
}

- (NSLayoutConstraint*)lyt_constraintByMatchingHeightToView:(LYTView*)view
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
}

- (NSLayoutConstraint*)lyt_constraintByMatchingWidthToView:(LYTView*)view multiplier:(CGFloat)multiplier
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:multiplier constant:0];
}

- (NSLayoutConstraint*)lyt_constraintByMatchingHeightToView:(LYTView*)view multiplier:(CGFloat)multiplier
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeHeight multiplier:multiplier constant:0];
}

- (NSArray*)lyt_constraintsByMatchingSizeToView:(LYTView*)view
{
    NSLayoutConstraint *widthConstraint = [self lyt_constraintByMatchingWidthToView:view];
    NSLayoutConstraint *heightConstraint = [self lyt_constraintByMatchingHeightToView:view];
    return @[widthConstraint, heightConstraint];
}

@end

#if TARGET_OS_IPHONE

@implementation UIViewController (Lyt)

- (NSLayoutConstraint *)lyt_alignTopGuideAndView:(UIView*)view
{
    return [self lyt_alignTopGuideAndView:view margin:0];
}

- (NSLayoutConstraint *)lyt_alignTopGuideAndView:(UIView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByAligningTopGuideAndView:view margin:margin];
    [self.view lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint *)lyt_alignBottomGuideAndView:(UIView*)view
{
    return [self lyt_alignBottomGuideAndView:view margin:0];
}

- (NSLayoutConstraint *)lyt_alignBottomGuideAndView:(UIView*)view margin:(CGFloat)margin
{
    NSLayoutConstraint *constraint = [self lyt_constraintByAligningBottomGuideAndView:view margin:margin];
    [self.view lyt_addConstraint:constraint toAncestorSharedWithView:view];
    return constraint;
}

- (NSLayoutConstraint *)lyt_constraintByAligningTopGuideAndView:(UIView*)view
{
    return [self lyt_constraintByAligningTopGuideAndView:view margin:0];
}

- (NSLayoutConstraint *)lyt_constraintByAligningTopGuideAndView:(UIView*)view margin:(CGFloat)margin
{
    return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBaseline multiplier:1 constant:margin];
}

- (NSLayoutConstraint *)lyt_constraintByAligningBottomGuideAndView:(UIView*)view
{
    return [self lyt_constraintByAligningBottomGuideAndView:view margin:0];
}

- (NSLayoutConstraint *)lyt_constraintByAligningBottomGuideAndView:(UIView*)view margin:(CGFloat)margin
{
    return [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeBaseline multiplier:1 constant:-margin];
}

@end

#endif

@implementation NSArray (LytUtils)

- (void)lyt_addConstraints:(NSArray*)constraints
{
    LYTView *sharedAncestor = [self lyt_sharedAncestor];
    [sharedAncestor addConstraints:constraints];
}

- (LYTView*)lyt_sharedAncestor
{
    const NSInteger count = self.count;
    if (count == 0) return nil;
    LYTView *bestAncestor = [self firstObject];
    NSAssert([bestAncestor isKindOfClass:LYTView.class], @"Array must contain only views");
    for (NSInteger i = 1; i < count; i++)
    {
        LYTView *currentView = self[i];
        NSAssert([currentView isKindOfClass:LYTView.class], @"Array must contain only views");
        bestAncestor = [bestAncestor lyt_ancestorSharedWithView:currentView];
    }
    return bestAncestor;
}

- (NSArray*)lyt_constraintsByMatchingAttribute:(NSLayoutAttribute)currentAttribute
                                   toAttribute:(NSLayoutAttribute)previousAttribute
                                  withDistance:(CGFloat)distance
{
    const NSInteger count = self.count;
    if (count < 2) return @[];
    
    NSMutableArray *constraints = [NSMutableArray array];
    
    LYTView *previousView = [self firstObject];
    NSAssert([previousView isKindOfClass:LYTView.class], @"Array must contain only views");
    for (NSInteger i = 1; i < count; i++)
    {
        LYTView *currentView = self[i];
        NSAssert([currentView isKindOfClass:LYTView.class], @"Array must contain only views");
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:currentView attribute:currentAttribute relatedBy:NSLayoutRelationEqual toItem:previousView attribute:previousAttribute multiplier:1 constant:distance];
        [constraints addObject:constraint];
        previousView = currentView;
    }
    
    return constraints;
}

- (NSArray *)lyt_flattenMap:(id (^)(LYTView *view))block
{
    NSParameterAssert(block != nil);
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(LYTView *view, NSUInteger idx, BOOL *stop) {
        NSAssert([view isKindOfClass:LYTView.class], @"Array must contain only views");
        id value = block(view) ?: [NSNull null];
        if ([value isKindOfClass:NSArray.class])
        {
            [result addObjectsFromArray:value];
        }
        else
        {
            [result addObject:value];
        }
    }];
    return result;
}

@end

@implementation NSArray (Lyt)

#pragma mark Distribution

- (NSArray*)lyt_distributeXWithSpacing:(CGFloat)spacing
{
    NSArray *constraints = [self lyt_constraintsByDistributingXWithSpacing:spacing];
    [self lyt_addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_distributeYWithSpacing:(CGFloat)spacing
{
    NSArray *constraints = [self lyt_constraintsByDistributingYWithSpacing:spacing];
    [self lyt_addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_distributeTopWithDistance:(CGFloat)distance
{
    NSArray *constraints = [self lyt_constraintsByDistributingTopWithDistance:distance];
    [self lyt_addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_distributeCenterYWithDistance:(CGFloat)distance
{
    NSArray *constraints = [self lyt_constraintsByDistributingCenterYWithDistance:distance];
    [self lyt_addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_distributeBottomWithDistance:(CGFloat)distance
{
    NSArray *constraints = [self lyt_constraintsByDistributingBottomWithDistance:distance];
    [self lyt_addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_distributeLeftWithDistance:(CGFloat)distance
{
    NSArray *constraints = [self lyt_constraintsByDistributingLeftWithDistance:distance];
    [self lyt_addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_distributeCenterXWithDistance:(CGFloat)distance
{
    NSArray *constraints = [self lyt_constraintsByDistributingCenterXWithDistance:distance];
    [self lyt_addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_distributeRightWithDistance:(CGFloat)distance
{
    NSArray *constraints = [self lyt_constraintsByDistributingRightWithDistance:distance];
    [self lyt_addConstraints:constraints];
    return constraints;
}

- (NSArray*)lyt_constraintsByDistributingXWithSpacing:(CGFloat)spacing
{
    return [self lyt_constraintsByMatchingAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeRight withDistance:spacing];
}

- (NSArray*)lyt_constraintsByDistributingYWithSpacing:(CGFloat)spacing
{
    return [self lyt_constraintsByMatchingAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom withDistance:spacing];
}

- (NSArray*)lyt_constraintsByDistributingTopWithDistance:(CGFloat)distance
{
    return [self lyt_constraintsByMatchingAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeTop withDistance:distance];
}

- (NSArray*)lyt_constraintsByDistributingCenterYWithDistance:(CGFloat)distance
{
    return [self lyt_constraintsByMatchingAttribute:NSLayoutAttributeCenterY toAttribute:NSLayoutAttributeCenterY withDistance:distance];
}

- (NSArray*)lyt_constraintsByDistributingBottomWithDistance:(CGFloat)distance
{
    return [self lyt_constraintsByMatchingAttribute:NSLayoutAttributeBottom toAttribute:NSLayoutAttributeBottom withDistance:distance];
}

- (NSArray*)lyt_constraintsByDistributingLeftWithDistance:(CGFloat)distance
{
    return [self lyt_constraintsByMatchingAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeLeft withDistance:distance];
}

- (NSArray*)lyt_constraintsByDistributingCenterXWithDistance:(CGFloat)distance
{
    return [self lyt_constraintsByMatchingAttribute:NSLayoutAttributeCenterX toAttribute:NSLayoutAttributeCenterX withDistance:distance];
}

- (NSArray*)lyt_constraintsByDistributingRightWithDistance:(CGFloat)distance
{
    return [self lyt_constraintsByMatchingAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeRight withDistance:distance];
}

#pragma mark Alignment

- (NSArray*)lyt_alignTopToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignTopToParent]; }];
}

- (NSArray*)lyt_alignTopToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignTopToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_alignTopToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignTopToView:view]; }];
}

- (NSArray*)lyt_alignTopToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignTopToView:view margin:margin]; }];
}

- (NSArray*)lyt_alignRightToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignRightToParent]; }];
}

- (NSArray*)lyt_alignRightToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignRightToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_alignRightToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignRightToView:view]; }];
}

- (NSArray*)lyt_alignRightToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignRightToView:view margin:margin]; }];
}

- (NSArray*)lyt_alignBottomToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignBottomToParent]; }];
}

- (NSArray*)lyt_alignBottomToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignBottomToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_alignBottomToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignBottomToView:view]; }];
}

- (NSArray*)lyt_alignBottomToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignBottomToView:view margin:margin]; }];
}

- (NSArray*)lyt_alignLeftToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignLeftToParent]; }];
}

- (NSArray*)lyt_alignLeftToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignLeftToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_alignLeftToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignLeftToView:view]; }];
}

- (NSArray*)lyt_alignLeftToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignLeftToView:view margin:margin]; }];
}

- (NSArray*)lyt_alignSidesToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignSidesToParent]; }];
}

- (NSArray*)lyt_alignSidesToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignSidesToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_alignSidesToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignSidesToView:view]; }];
}

- (NSArray*)lyt_alignSidesToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignSidesToView:view margin:margin]; }];
}

- (NSArray*)lyt_alignToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignToParent]; }];
}

- (NSArray*)lyt_alignToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_alignToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_alignToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignToView:view]; }];
}

- (NSArray*)lyt_alignToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_alignToView:view margin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningTopToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByAligningTopToParent]; }];
}

- (NSArray*)lyt_constraintsByAligningTopToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByAligningTopToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningTopToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByAligningTopToView:view]; }];
}

- (NSArray*)lyt_constraintsByAligningTopToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByAligningTopToView:view margin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningRightToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByAligningRightToParent]; }];
}

- (NSArray*)lyt_constraintsByAligningRightToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByAligningRightToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningRightToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByAligningRightToView:view]; }];
}

- (NSArray*)lyt_constraintsByAligningRightToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByAligningRightToView:view margin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningBottomToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByAligningBottomToParent]; }];
}

- (NSArray*)lyt_constraintsByAligningBottomToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByAligningBottomToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningBottomToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByAligningBottomToView:view]; }];
}

- (NSArray*)lyt_constraintsByAligningBottomToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByAligningBottomToView:view margin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningLeftToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByAligningLeftToParent]; }];
}

- (NSArray*)lyt_constraintsByAligningLeftToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByAligningLeftToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningLeftToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByAligningLeftToView:view]; }];
}

- (NSArray*)lyt_constraintsByAligningLeftToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByAligningLeftToView:view margin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningSidesToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintsByAligningSidesToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningSidesToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintsByAligningSidesToView:view margin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningToParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintsByAligningToParent]; }];
}

- (NSArray*)lyt_constraintsByAligningToParentWithMargin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintsByAligningToParentWithMargin:margin]; }];
}

- (NSArray*)lyt_constraintsByAligningToView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintsByAligningToView:view margin:margin]; }];
}

#pragma mark Centering

- (NSArray*)lyt_centerXInParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_centerXInParent]; }];
}

- (NSArray*)lyt_centerXInParentWithOffset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_centerXInParentWithOffset:offset]; }];
}

- (NSArray*)lyt_centerXWithView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_centerXWithView:view]; }];
}

- (NSArray*)lyt_centerXWithView:(LYTView*)view offset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_centerXWithView:view offset:offset]; }];
}

- (NSArray*)lyt_centerYInParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_centerYInParent]; }];
}

- (NSArray*)lyt_centerYInParentWithOffset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_centerYInParentWithOffset:offset]; }];
}

- (NSArray*)lyt_centerYWithView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_centerYWithView:view]; }];
}

- (NSArray*)lyt_centerYWithView:(LYTView*)view offset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_centerYWithView:view]; }];
}

- (NSArray*)lyt_centerInParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_centerInParent]; }];
}

- (NSArray*)lyt_centerInParentWithOffset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_centerInParentWithOffset:offset]; }];
}

- (NSArray*)lyt_centerWithView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_centerWithView:view]; }];
}

- (NSArray*)lyt_centerWithView:(LYTView*)view offset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_centerWithView:view]; }];
}

- (NSArray*)lyt_constraintsByCenteringXInParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByCenteringXInParent]; }];
}

- (NSArray*)lyt_constraintsByCenteringXInParentWithOffset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByCenteringXInParentWithOffset:offset]; }];
}

- (NSArray*)lyt_constraintsByCenteringXWithView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByCenteringXWithView:view]; }];
}

- (NSArray*)lyt_constraintsByCenteringXWithView:(LYTView*)view offset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByCenteringXWithView:view offset:offset]; }];
}

- (NSArray*)lyt_constraintsByCenteringYInParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByCenteringYInParent]; }];
}

- (NSArray*)lyt_constraintsByCenteringYInParentWithOffset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintByCenteringYInParentWithOffset:offset]; }];
}

- (NSArray*)lyt_constraintsByCenteringYWithView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByCenteringYWithView:view]; }];
}

- (NSArray*)lyt_constraintsByCenteringYWithView:(LYTView*)view offset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByCenteringYWithView:view offset:offset]; }];
}

- (NSArray*)lyt_constraintsByCenteringInParent
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintsByCenteringInParent]; }];
}

- (NSArray*)lyt_constraintsByCenteringInParentWithOffset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintsByCenteringInParentWithOffset:offset]; }];
}

- (NSArray*)lyt_constraintsByCenteringWithView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintsByCenteringWithView:view]; }];
}

- (NSArray*)lyt_constraintsByCenteringWithView:(LYTView*)view offset:(CGFloat)offset
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintsByCenteringWithView:view offset:offset]; }];
}

#pragma mark Placement

- (NSArray*)lyt_placeAboveView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_placeAboveView:view]; }];
}

- (NSArray*)lyt_placeAboveView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_placeAboveView:view margin:margin]; }];
}

- (NSArray*)lyt_placeRightOfView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_placeRightOfView:view]; }];
}

- (NSArray*)lyt_placeRightOfView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_placeRightOfView:view margin:margin]; }];
}

- (NSArray*)lyt_placeBelowView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_placeBelowView:view]; }];
}

- (NSArray*)lyt_placeBelowView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_placeBelowView:view margin:margin]; }];
}

- (NSArray*)lyt_placeLeftOfView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_placeLeftOfView:view]; }];
}

- (NSArray*)lyt_placeLeftOfView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_placeLeftOfView:view margin:margin]; }];
}

- (NSArray*)lyt_constraintsByPlacingAboveView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByPlacingAboveView:view]; }];
}

- (NSArray*)lyt_constraintsByPlacingAboveView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByPlacingAboveView:view margin:margin]; }];
}

- (NSArray*)lyt_constraintsByPlacingRightOfView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByPlacingRightOfView:view]; }];
}

- (NSArray*)lyt_constraintsByPlacingRightOfView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByPlacingRightOfView:view margin:margin]; }];
}

- (NSArray*)lyt_constraintsByPlacingBelowView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByPlacingBelowView:view]; }];
}

- (NSArray*)lyt_constraintsByPlacingBelowView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByPlacingBelowView:view margin:margin]; }];
}

- (NSArray*)lyt_constraintsByPlacingLeftOfView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByPlacingLeftOfView:view]; }];
}

- (NSArray*)lyt_constraintsByPlacingLeftOfView:(LYTView*)view margin:(CGFloat)margin
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByPlacingLeftOfView:view margin:margin]; }];
}

#pragma mark Position and Sizing

- (NSArray*)lyt_setX:(CGFloat)x
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setX:x]; }];
}

- (NSArray*)lyt_setY:(CGFloat)y
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setY:y]; }];
}

- (NSArray*)lyt_setOrigin:(CGPoint)origin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setOrigin:origin]; }];
}

- (NSArray*)lyt_setWidth:(CGFloat)width
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setWidth:width]; }];
}

- (NSArray*)lyt_setMaxWidth:(CGFloat)width
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setMaxWidth:width]; }];
}

- (NSArray*)lyt_setMinWidth:(CGFloat)width
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setMinWidth:width]; }];
}

- (NSArray*)lyt_setHeight:(CGFloat)height
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setHeight:height]; }];
}

- (NSArray*)lyt_setMaxHeight:(CGFloat)height
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setMaxHeight:height]; }];
}

- (NSArray*)lyt_setMinHeight:(CGFloat)height
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setMinHeight:height]; }];
}

- (NSArray*)lyt_setSize:(CGSize)size
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setSize:size]; }];
}

- (NSArray*)lyt_setMaxSize:(CGSize)size
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setMaxSize:size]; }];
}

- (NSArray*)lyt_setMinSize:(CGSize)size
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setMinSize:size]; }];
}

- (NSArray*)lyt_setFrame:(CGRect)frame
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_setFrame:frame]; }];
}

- (NSArray*)lyt_matchWidthToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_matchWidthToView:view]; }];
}

- (NSArray*)lyt_matchHeightToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_matchHeightToView:view]; }];
}

- (NSArray*)lyt_matchWidthToView:(LYTView*)view multiplier:(CGFloat)multiplier
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_matchHeightToView:view multiplier:multiplier]; }];
}

- (NSArray*)lyt_matchHeightToView:(LYTView*)view multiplier:(CGFloat)multiplier
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_matchHeightToView:view multiplier:multiplier]; }];
}

- (NSArray*)lyt_constraintsBySettingX:(CGFloat)x
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintBySettingX:x]; }];
}

- (NSArray*)lyt_constraintsBySettingY:(CGFloat)y
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintBySettingY:y]; }];
}

- (NSArray*)lyt_constraintsBySettingOrigin:(CGPoint)origin
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintsBySettingOrigin:origin]; }];
}

- (NSArray*)lyt_constraintsBySettingWidth:(CGFloat)width
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintBySettingWidth:width]; }];
}

- (NSArray*)lyt_constraintsBySettingMaxWidth:(CGFloat)width
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintBySettingMaxWidth:width]; }];
}

- (NSArray*)lyt_constraintsBySettingMinWidth:(CGFloat)width
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintBySettingMinWidth:width]; }];
}

- (NSArray*)lyt_constraintsBySettingHeight:(CGFloat)height
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintBySettingHeight:height]; }];
}

- (NSArray*)lyt_constraintsBySettingMaxHeight:(CGFloat)height
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintBySettingMaxHeight:height]; }];
}

- (NSArray*)lyt_constraintsBySettingMinHeight:(CGFloat)height
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintBySettingMinHeight:height]; }];
}

- (NSArray*)lyt_constraintsBySettingSize:(CGSize)size
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintsBySettingSize:size]; }];
}

- (NSArray*)lyt_constraintsBySettingMaxSize:(CGSize)size
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintsBySettingMaxSize:size]; }];
}

- (NSArray*)lyt_constraintsBySettingMinSize:(CGSize)size
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintsBySettingMinSize:size]; }];
}

- (NSArray*)lyt_constraintsBySettingFrame:(CGRect)frame
{
    return [self lyt_flattenMap:^id(LYTView *view) { return [view lyt_constraintsBySettingFrame:frame]; }];
}

- (NSArray*)lyt_constraintsByMatchingWidthToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByMatchingWidthToView:view]; }];
}

- (NSArray*)lyt_constraintsByMatchingHeightToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByMatchingHeightToView:view]; }];
}

- (NSArray*)lyt_constraintsByMatchingWidthToView:(LYTView*)view multiplier:(CGFloat)multiplier
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByMatchingWidthToView:view multiplier:multiplier]; }];
}

- (NSArray*)lyt_constraintsByMatchingHeightToView:(LYTView*)view multiplier:(CGFloat)multiplier
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintByMatchingHeightToView:view multiplier:multiplier]; }];
}

- (NSArray*)lyt_constraintsByMatchingSizeToView:(LYTView*)view
{
    return [self lyt_flattenMap:^id(LYTView *currentView) { return [currentView lyt_constraintsByMatchingSizeToView:view]; }];
}

@end
