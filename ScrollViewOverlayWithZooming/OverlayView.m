//
//  OverlayView.m
//  ScrollViewOverlay
//
//  Created by ito on 平成23/06/19.
//  Copyright 23 __MyCompanyName__. All rights reserved.
//

#import "OverlayView.h"

@implementation OverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor redColor];
		self.autoresizesSubviews = NO;
		
		UITapGestureRecognizer* tapgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapped:)];
		[self addGestureRecognizer:tapgr];
		[tapgr release];
		
		UIPanGestureRecognizer* pangr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(_pan:)];
		[self addGestureRecognizer:pangr];
		[pangr release];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)_tapped:(UITapGestureRecognizer*)gr
{
	NSLog(@"%s, %@, containerview: %@, scrollview:%@", __func__, NSStringFromCGPoint([gr locationInView:gr.view]), NSStringFromCGPoint([gr locationInView:self.superview])
		  ,NSStringFromCGPoint([gr locationInView:gr.view.superview.superview]));
}

-(void)_pan:(UIPanGestureRecognizer*)gr
{
	NSLog(@"%s, %@, containerview: %@, scrollview:%@", __func__, NSStringFromCGPoint([gr locationInView:gr.view]), NSStringFromCGPoint([gr locationInView:self.superview])
		  ,NSStringFromCGPoint([gr locationInView:gr.view.superview.superview]));
	
	self.center = [gr locationInView:self.superview];
}

-(void)setTransform:(CGAffineTransform)transform
{
	[super setTransform:transform];
		NSLog(@"%s, t:%@, f:%@, b:%@", __func__, NSStringFromCGAffineTransform(self.transform), NSStringFromCGRect(self.frame), NSStringFromCGRect(self.bounds));
}

-(void)setFrame:(CGRect)frame
{
	[super setFrame:frame];
		NSLog(@"%s, t:%@, f:%@, b:%@", __func__, NSStringFromCGAffineTransform(self.transform), NSStringFromCGRect(self.frame), NSStringFromCGRect(self.bounds));
}

@end
