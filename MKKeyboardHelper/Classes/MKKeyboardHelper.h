//
// Created by Michael Kuck on 11/10/15.
// Copyright (c) 2015 Michael Kuck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * - Move the screen up if keyboard covers a UITextField
 * - Hide keyboard if screen is tapped outside a UITextField
 */
@interface MKKeyboardHelper : NSObject

@property (nonatomic, assign, nullable) UIView *view;

- (instancetype)initWithView:(UIView *)view;

- (void)startObserving;
- (void)stopObserving;

@end

NS_ASSUME_NONNULL_END
