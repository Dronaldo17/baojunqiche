//
//  NavButton.h
//  uilib
//
//  Created by doujingxuan on 13-3-10.
//  Copyright (c) 2013年 FCNN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum XTFBarButtonEnum
{
    XTFBarButtonLeft,
    XTFBarButtonRight,
    XTFBarButtonCount
}XFTBarButtonType;

@protocol BarButtonDelegate
-(void)barButtonFinfished:(XFTBarButtonType)type;
@end

@interface NavButton : NSObject

+ (void)addNavBackGroundView:(UINavigationController*)nav;
+ (UIButton *)createNavButtonWithTitle:(NSString *)title withHorPadding:(CGFloat)padding;
+ (UIButton *)createPopButton:(NSString*)title withHorPadding:(CGFloat)padding;
+(UIButton*)createPopButtonWithImage:(NSString*)imageName;
@end
