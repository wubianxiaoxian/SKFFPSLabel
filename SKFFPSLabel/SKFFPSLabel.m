//
//  SKFFPSLabel.m
//  HaoJiXingDayi
//
//  Created by 孙凯峰 on 16/7/18.
//  Copyright © 2016年 Kevin Sun. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SKFFPSLabel.h"
@interface SKFFPSLabel()
{
    NSTimeInterval lastTime;
    NSUInteger count;
}
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) UILabel *label;
@end
@implementation SKFFPSLabel
- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.500];
        self.font = [UIFont systemFontOfSize:14];
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
        
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}
- (void)handleDisplayLink:(CADisplayLink *)displayLink
{
    if (lastTime == 0) {
        lastTime = self.displayLink.timestamp;
        return;
    }
    count++;
    NSTimeInterval timeout = self.displayLink.timestamp - lastTime;
    if (timeout < 1) return;
    lastTime = self.displayLink.timestamp;
    float fps = count / timeout;
    count = 0;
    self.text = [NSString stringWithFormat:@"%.f FPS",fps];
}

- (void)SKFFPSstopDisplayLink
{
    [self.displayLink invalidate];
    self.displayLink = nil;
    [self removeFromSuperview];
}

@end
