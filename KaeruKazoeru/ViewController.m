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
@property (weak, nonatomic) IBOutlet UIButton *kaeru1;
@property (weak, nonatomic) IBOutlet UIButton *kaeru2;
@property (weak, nonatomic) IBOutlet UIButton *kaeru3;
@property (weak, nonatomic) IBOutlet UIButton *kaeru4;
@property (weak, nonatomic) IBOutlet UIButton *kaeru5;
@property (weak, nonatomic) IBOutlet UIButton *kaeru6;
@property (weak, nonatomic) IBOutlet UIButton *kaeru7;
@property (weak, nonatomic) IBOutlet UIButton *kaeru8;
@property (weak, nonatomic) IBOutlet UIButton *kaeru9;
@property (weak, nonatomic) IBOutlet UIButton *kaeru10;

@property (weak, nonatomic) IBOutlet UIButton *kaeruButton;
- (IBAction)kaeruTouch:(id)sender;
@end

static int displayCount = 0;
UIButton * kaeruarray[10];
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    kaeruarray[0] = self.kaeru1;
    kaeruarray[1] = self.kaeru2;
    kaeruarray[2] = self.kaeru3;
    kaeruarray[3] = self.kaeru4;
    kaeruarray[4] = self.kaeru5;
    kaeruarray[5] = self.kaeru6;
    kaeruarray[6] = self.kaeru7;
    kaeruarray[7] = self.kaeru8;
    kaeruarray[8] = self.kaeru9;
    kaeruarray[9] = self.kaeru10;
    for (int i=0; i<10; i++) {
        kaeruarray[i].hidden = YES;
    }
    audio = [AVAudioPlayer alloc];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"start" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    audio = [audio initWithContentsOfURL:url error:nil];
    [audio play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)kaeruTouch:(id)sender {
    if (displayCount == 10) {
        displayCount = 0;
        for (int i=0; i<10; i++) {
            kaeruarray[i].hidden = YES;
        }
    }
    
    kaeruarray[displayCount].hidden = NO;
    
    displayCount++;
    NSString* moji;
    moji = [ NSString stringWithFormat : @"%d", displayCount];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:moji ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    audio = [audio initWithContentsOfURL:url error:nil];
    //audio.volume = 0.1;
    //audio.numberOfLoops = 1;
    //[audio prepareToPlay];
    [audio play];
    self.countLabel.text = moji;
}
@end
