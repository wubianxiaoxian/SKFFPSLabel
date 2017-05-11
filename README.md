# SKFFPSLabel
一个检测页面滑动FPS的小工具
###这两天做了一个检测tablview滑动时fps的小工具，分享给大家
![fps检测.gif](http://upload-images.jianshu.io/upload_images/964698-60bab7cc814194d4.gif?imageMogr2/auto-orient/strip)
###
###使用很简单
####1，直接将SKFFPSLabel.h SKFFPSLabel.m文件拖入工程

####2，引入头文件#import "SKFFPSLabel.h"

####3，添加属性

    @property (nonatomic, strong) SKFFPSLabel *SkfFPSLabel;
#### 4，在需要使用的地方添加以下方法
     #pragma mark  配置SKFFPSLabel的方法
    -(void)configureSKFFPSLabel{
    _SkfFPSLabel = [[SKFFPSLabel alloc]init];
    _SkfFPSLabel.frame = CGRectMake(10, 74, 50, 30);
    //    _SkfFPSLabel setb
    [self.view addSubview:_SkfFPSLabel];
    [self.view bringSubviewToFront:_SkfFPSLabel];
     }
      #pragma mark    开启FPS监测的方法
    -(void)startTheFPSLabel{
    if (_SkfFPSLabel == nil) {
        [self configureSKFFPSLabel];
    }
     }

    #pragma mark    关闭FPS监测方法
    -(void)closeTheFPSLabel{    
    [_SkfFPSLabel SKFFPSstopDisplayLink];
    _SkfFPSLabel = nil;    
     }
####5，方法添加完后在需要的地方调用即可
