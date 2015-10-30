//
//  ViewController.m
//  录音与播放[oc]
//
//  Created by 余丽丽 on 15/10/30.
//  Copyright © 2015年 余丽丽. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property(nonatomic,strong) NSURL * fileUrl;
@property(nonatomic,strong) AVAudioRecorder * recoder;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",self.fileUrl);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)start:(id)sender {
    [self.recoder record];
    NSLog(@"开始录音");
    
}
- (IBAction)stop:(id)sender {
    [self.recoder stop];
    NSLog(@"停止录音");
    
}
- (IBAction)play:(id)sender {
    
    SystemSoundID soundID = 0;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(self.fileUrl), &soundID);
    AudioServicesPlaySystemSound(soundID);
    
    
}

-(NSURL*)fileUrl{
    if (_fileUrl == nil) {
        
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSLog(@"%@",path);
        NSString * filePath = [path stringByAppendingPathComponent:@"123.caf"];
        NSURL *fileURL = [NSURL fileURLWithPath:filePath];
        _fileUrl = fileURL;
    
    }
    return _fileUrl;

}

-(AVAudioRecorder *)recoder{

    if (_recoder == nil) {
        NSMutableDictionary * setting = [NSMutableDictionary dictionary];
        setting[AVEncoderAudioQualityKey] = [NSNumber numberWithInteger:AVAudioQualityHigh];
        _recoder = [[AVAudioRecorder alloc] initWithURL:self.fileUrl settings:setting error:nil];
    }
    return _recoder;
}

@end
