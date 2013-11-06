//
//  BrandViewController.h
//  BaoJunCar
//
//  Created by doujingxuan on 13-11-1.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandViewController : UIViewController
@property (nonatomic,strong)IBOutlet UIImageView * imageView;
@property (nonatomic,strong)IBOutlet UIScrollView * scrollView;
@property (nonatomic,strong)IBOutlet UISegmentedControl * segController;
-(IBAction)segControllerClicked:(id)sender;
@end
