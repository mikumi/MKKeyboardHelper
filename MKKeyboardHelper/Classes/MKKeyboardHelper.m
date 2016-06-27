//
// Created by Michael Kuck on 11/10/15.
// Copyright (c) 2015 inLine. All rights reserved.
//

#import "MKKeyboardHelper.h"

//============================================================
//== Private Interface
//============================================================
@interface MKKeyboardHelper ()

@property (nonatomic, strong, nullable) UITapGestureRecognizer *tapRecognizer;

@end

//============================================================
//== Implementation
//============================================================
@implementation MKKeyboardHelper

#pragma mark - Life Cycle

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {
        _view = view;
    }
    return self;
}

- (void)dealloc
{
    [self stopObserving];
}

#pragma mark - Public Implementation

- (void)startObserving
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)
            name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)
            name:UIKeyboardWillHideNotification object:nil];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc]
            initWithTarget:self action:@selector(didSingleTap:)];
    self.tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:self.tapRecognizer];
}

- (void)stopObserving
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.view removeGestureRecognizer:self.tapRecognizer];
    self.tapRecognizer = nil;
}

#pragma mark - Private Implementation

- (void)keyboardWillHide:(NSNotification *)notification
{
    CGFloat const animationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    UIViewAnimationCurve const animationCurve = (UIViewAnimationCurve)[notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    [UIView animateWithDuration:animationDuration delay:0.0 options:(UIViewAnimationOptions)(animationCurve << 16) animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0.0f;
        self.view.frame = frame;
    } completion:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    // TODO: this is just a temporary solution for the LINE demo. This needs to be improved, at least remove recursion
    UIView *const firstResponder = [self findFirstResponderInView:self.view];
    if (firstResponder) {
        CGFloat const endY = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
        CGRect const frameInView = [firstResponder convertRect:firstResponder.bounds toView:self.view];
        CGFloat const offsetY = endY - CGRectGetMaxY(frameInView) - 60.f;
        if (offsetY < 0) {
            CGFloat const animationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
            UIViewAnimationCurve const animationCurve = (UIViewAnimationCurve)[notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
            [UIView animateWithDuration:animationDuration delay:0.0 options:(UIViewAnimationOptions)(animationCurve << 16) animations:^{
                CGRect frame = self.view.frame;
                frame.origin.y = offsetY;
                self.view.frame = frame;
            } completion:nil];
        }
    }
}

- (UIView *)findFirstResponderInView:(UIView *)view {
    if (view.isFirstResponder) {
        return view;
    }

    UIView *firstResponder = nil;
    for (UIView *const subView in view.subviews) {
        firstResponder = [self findFirstResponderInView:subView];
        if (firstResponder) {
            return firstResponder;
        }
    }
    return firstResponder;
}

- (void)didSingleTap:(UITapGestureRecognizer *)sender
{
    UIView *const firstResponder = [self findFirstResponderInView:self.view];
    CGPoint touchPoint = [sender locationInView:firstResponder];
    if (![firstResponder pointInside:touchPoint withEvent:nil]) {
        [self.view endEditing:YES];
    }
}

@end
