//
//  OverlayScrollView.m
//  ScrollViewOverlay
//
//  Created by ito on 平成23/06/19.
//  Copyright 23 __MyCompanyName__. All rights reserved.
//

#import "OverlayScrollView.h"
#import "OverlayView.h"
#import "ContainerView.h"

@interface OverlayScrollView()

@property (nonatomic, assign) ContainerView* containerView;
@property (nonatomic, assign) OverlayView* knob;

@end

@implementation OverlayScrollView

@synthesize containerView;
@synthesize knob;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor blackColor];
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
		self.minimumZoomScale = 0.3;
		self.maximumZoomScale = 5;
		self.delegate = self;
		self.bouncesZoom = YES;
		self.bounces = YES;
		self.alwaysBounceVertical = YES;
		self.alwaysBounceHorizontal = YES;
		
		ContainerView* aContainerView  = [[ContainerView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width*0.5, self.bounds.size.height*0.5)];
		aContainerView.backgroundColor = [UIColor darkGrayColor];
		self.containerView = aContainerView;
		[self addSubview:aContainerView];
		[aContainerView release];
		
		/*
		UIView* dummyView = [[UIView alloc] initWithFrame:CGRectInset(aContainerView.bounds, 10, 10)];
		dummyView.autoresizesSubviews = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
		dummyView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:0.2];
		[containerView addSubview:dummyView];
		[dummyView release];
		*/
		
		OverlayView* aKnob = [[OverlayView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
		self.knob = aKnob;
		[containerView addSubview:aKnob];
		[aKnob release];
    }
    return self;
}

- (void)dealloc 
{
    self.containerView = nil;
	self.knob = nil;
    [super dealloc];
}

- (void)_logViews
{
	NSLog(@"Knob View: %@", NSStringFromCGRect(knob.frame));
	NSLog(@"Container View: %@", NSStringFromCGRect(containerView.frame));NSLog(@" ");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)layoutSubviews
{
	[super layoutSubviews];
	
	NSLog(@"%s", __func__);
	
	knob.transform = CGAffineTransformInvert(containerView.transform);
	
	if ( ! CGRectContainsRect(containerView.bounds, knob.frame)) {
		CGRect cr = containerView.frame;
		CGRect newf = CGRectMake(cr.size.width*0.5, cr.size.height*0.5, 40, 40);
		knob.frame = CGRectApplyAffineTransform(newf, knob.transform);
	}
	
	
	[self _logViews];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return self.containerView;
}

-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
	NSLog(@"%s", __func__);
	[self _logViews];
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
	NSLog(@"%s, scale: %f", __func__, scale);
	[self _logViews];
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
	NSLog(@"%s", __func__);
	[self _logViews];
}

@end