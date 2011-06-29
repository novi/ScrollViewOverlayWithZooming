//
//  ContainerView.m
//  ScrollViewOverlay
//
//  Created by ito on 平成23/06/19.
//  Copyright 23 __MyCompanyName__. All rights reserved.
//

#import "ContainerView.h"
#import "OverlayView.h"

@implementation ContainerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.autoresizesSubviews = NO;
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
