//
//  ExperienceVC.m
//  BaoJunCar
//
//  Created by doujingxuan on 13-11-5.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "ExperienceVC.h"
#import "BrowseViewController.h"


@implementation ExperienceVC
- (NSUInteger) supportedInterfaceOrientations{
	return  UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
		return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
	return YES;
}


#pragma mark View Lifecycle
- (void) loadView{
	
	CGRect rect = [UIScreen mainScreen].bounds;
	rect = CGRectApplyAffineTransform(rect, CGAffineTransformMakeRotation(90 * M_PI / 180.));
	rect.origin = CGPointZero;
	
	self.view = [[UIView alloc] initWithFrame:rect];
	
	self.view.backgroundColor = [UIColor whiteColor];
	self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	
	self.coverflow = [[TKCoverflowView alloc] initWithFrame:self.view.bounds];
	self.coverflow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.coverflow.coverflowDelegate = self;
	self.coverflow.coverflowDataSource = self;
	self.coverflow.tag = 0;
	if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
		self.coverflow.coverSize = CGSizeMake(500, 400);
	}
	
	[self.view addSubview:self.coverflow];
	
    
//	CGSize s = self.view.bounds.size;
//	
//	UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
//	[infoButton addTarget:self action:@selector(info) forControlEvents:UIControlEventTouchUpInside];
//	infoButton.frame = CGRectMake(s.width-50, 5, 50, 30);
//	[self.view addSubview:infoButton];
	
	
	UIView *center = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2.0, 0,1, 1000)];
	center.backgroundColor = [UIColor redColor];
	center.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
	//[self.view addSubview:center];
	
	
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Tap Me" style:UIBarButtonItemStyleBordered target:self action:@selector(info)];
	self.toolbarItems = @[item];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}
- (void) viewDidLoad {
    [super viewDidLoad];
	if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone){
		self.covers = @[[UIImage imageNamed:@"cover_2.jpg"],[UIImage imageNamed:@"cover_1.jpg"],
                        [UIImage imageNamed:@"cover_3.jpg"],[UIImage imageNamed:@"cover_4.jpg"],
                        [UIImage imageNamed:@"cover_5.jpg"],[UIImage imageNamed:@"cover_6.jpg"],
                        [UIImage imageNamed:@"cover_7.jpg"],[UIImage imageNamed:@"cover_8.jpg"],
                        [UIImage imageNamed:@"cover_9.jpeg"]];
	}else{
		self.covers = @[[UIImage imageNamed:@"ipadcover_2.jpg"],[UIImage imageNamed:@"ipadcover_1.jpg"],
                        [UIImage imageNamed:@"ipadcover_3.jpg"],[UIImage imageNamed:@"ipadcover_4.jpg"],
                        [UIImage imageNamed:@"ipadcover_5.jpg"],[UIImage imageNamed:@"ipadcover_6.jpg"],
                        [UIImage imageNamed:@"ipadcover_7.jpg"],[UIImage imageNamed:@"ipadcover_8.jpg"],
                        [UIImage imageNamed:@"ipadcover_9.jpg"]];
	}
	
    self.title = @"车型展示";
    UIButton * backButton = [NavButton createPopButtonWithImage:@"baojun_630"];
    [backButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = barButton;

	[self.coverflow reloadData];
	[self.coverflow setCurrentCoverAtIndex:4 animated:NO];
    
}
- (void) viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
		[[UIApplication sharedApplication] setStatusBarHidden:YES];
		[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
	}
	
}
- (void) viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
	
}
- (void) viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	
	if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
		[[UIApplication sharedApplication] setStatusBarHidden:NO];
		[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
	}
}

- (void) info{
	if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone && self.coverflow.tag != 0){
		[self dismissViewControllerAnimated:YES completion:nil];
		return;
	}
	
	
	if(self.coverflow.tag == 0){
		
		CGFloat a = 30 * M_PI / 180.0;
		CGFloat z = -100;
		CGFloat x = self.coverflow.coverSize.width / 3;
		
		self.coverflow.leftTransform = CATransform3DConcat(CATransform3DMakeRotation(50 * M_PI / 180.0, 0, 1, 0), CATransform3DMakeTranslation(-x, 0, z));
		self.coverflow.rightTransform = CATransform3DConcat(CATransform3DMakeRotation(a, 0, 1, 0), CATransform3DMakeTranslation(x , 0, z));
        
		
		self.coverflow.leftIncrementalDistanceFromCenter = 100;
		self.coverflow.rightIncrementalDistanceFromCenter = 100;
		self.coverflow.spacing =  self.coverflow.coverSize.width - 100;
		self.coverflow.tag = 1;
		[self.coverflow reloadData];
		
		return;
	}else{
		
		self.coverflow.tag = 0;
        
		
		CGFloat x = self.coverflow.coverSize.width / 2;
		CATransform3D lt = CATransform3DMakeRotation(80 * M_PI / 180.0, 0, 1, 0);
		self.coverflow.leftTransform = CATransform3DConcat(lt, CATransform3DMakeTranslation(-x, 0, -200));
		
		CATransform3D rt = CATransform3DMakeRotation(-80 * M_PI / 180.0, 0, 1, 0);
		self.coverflow.rightTransform = CATransform3DConcat(rt, CATransform3DMakeTranslation(x, 0, -200));
        
	}
	
	[self.coverflow reloadData];
    
    
}

- (NSInteger) numberOfCoversInCoverflowView:(TKCoverflowView *)coverflowView{
	return self.covers.count;
}
- (TKCoverflowCoverView *) coverflowView:(TKCoverflowView *)coverflowView coverForIndex:(NSInteger)index{
	
	TKCoverflowCoverView *cover = [coverflowView dequeueReusableCoverView];
	
	if(cover == nil){
		CGRect rect = CGRectMakeWithSize(0, 0, self.coverflow.coverSize);
		
		cover = [[TKCoverflowCoverView alloc] initWithFrame:rect reflection:YES]; // 224
	}
	cover.image = self.covers[index%[self.covers count]];
	return cover;
	
}

- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasBroughtToFront:(NSInteger)index{
	NSLog(@"Cover at index %d was brought to front",index);
}
- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasTappedInFront:(NSInteger)index tapCount:(NSInteger)tapCount
{
    NSLog(@"Cover WasTapped index %d was brought to front",index);
    
    
    UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BrowseViewController *controller = [stryBoard instantiateViewControllerWithIdentifier:@"BrowseViewControllerID"];
    controller.image = self.covers[index];
    UINavigationController * nav =[[UINavigationController alloc] initWithRootViewController:controller];
    nav.navigationBar.barStyle = UIBarStyleBlack;
    nav.modalPresentationStyle =UIModalPresentationFormSheet;
    [self presentViewController:nav animated:NO completion:nil];

}
-(void)backClicked:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
