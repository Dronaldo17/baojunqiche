//
//  ExperienceVC.h
//  BaoJunCar
//
//  Created by doujingxuan on 13-11-5.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TapkuLibrary.h"
#import <UIKit/UIKit.h>

@interface ExperienceVC : UIViewController<TKCoverflowViewDataSource,TKCoverflowViewDelegate>

@property (nonatomic,strong) TKCoverflowView *coverflow;
@property (nonatomic,strong) NSArray *covers;


@end
