//
//  ViewController.m
//  KaeruKazoeru
//
//  Created by Kakimoto Masaaki on 2014/05/14.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (weak, nonatomic) IBOutlet UIButton *kaeruButton;
- (IBAction)kaeruTouch:(id)sender;
@end

static int displayCount = 0;
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)kaeruTouch:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    //audio.volume = 0.1;
    //audio.numberOfLoops = 1;
    //[audio prepareToPlay];
    [audio play];
    displayCount++;
    NSString* moji;
    moji = [ NSString stringWithFormat : @"%d", displayCount];
    self.countLabel.text = moji;
}
@end
