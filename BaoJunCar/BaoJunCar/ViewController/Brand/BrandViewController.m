//
//  BrandViewController.m
//  BaoJunCar
//
//  Created by doujingxuan on 13-11-1.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "BrandViewController.h"

@interface BrandViewController ()

@end

@implementation BrandViewController
@synthesize imageView,scrollView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"宝骏文化";
    UIButton * backButton = [NavButton createPopButtonWithImage:@"baojun_630"];
    [backButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = barButton;
//    self.imageView.backgroundColor = [UIColor redColor];
//    self.scrollView.backgroundColor = [UIColor redColor];
    self.imageView.image = [UIImage imageNamed:@"brand-1.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
-(void)backClicked:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(IBAction)segControllerClicked:(id)sender
{
    UISegmentedControl * controller = (UISegmentedControl*)sender;
    switch (controller.selectedSegmentIndex) {
        case 0:{
            self.imageView.image = [UIImage imageNamed:@"brand-1.png"];
        }
            break;
        case 1:{
            self.imageView.image = [UIImage imageNamed:@"brand-2.png"];
        }
            break;
        case 2:{
            self.imageView.image = [UIImage imageNamed:@"brand-3.png"];
        }
            break;
        case 3:{
            self.imageView.image = [UIImage imageNamed:@"brand-4.png"];
        }
            break;
        default:
            break;
    }

    
}
@end
