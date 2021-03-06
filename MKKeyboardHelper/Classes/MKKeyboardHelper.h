//
// Created by Michael Kuck on 11/10/15.
// Copyright (c) 2015 Michael Kuck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MKKeyboardHelperOnKeyboardShow)(CGRect keyboardFrame, UIView *firstResponder, CGFloat animationDuration,
        UIViewAnimationCurve animationCurve);
typedef void (^MKKeyboardHelperOnKeyboardHide)(CGFloat animationDuration, UIViewAnimationCurve animationCurve);

/**
 * - Move the screen up if keyboard covers a UITextField
 * - Hide keyboard if screen is tapped outside a UITextField
 */
@interface MKKeyboardHelper : NSObject

@property (nonatomic, weak, nullable) UIView *view;

/*
 * Defaults to 60.0f
 */ 
@property (nonatomic, assign) CGFloat additionalOffset;
@property (nonatomic, strong, nonnull) NSArray<UIView *> *ignoredViews;

@property (nonatomic, copy, nullable) MKKeyboardHelperOnKeyboardShow onKeyboardShow;
@property (nonatomic, copy, nullable) MKKeyboardHelperOnKeyboardHide onKeyboardHide;

- (instancetype)initWithView:(UIView *)view;

- (void)startObserving;
- (void)stopObserving;

@end

NS_ASSUME_NONNULL_END
