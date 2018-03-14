//
//  DoJudgeViewController.h
//  ForExam
//
//  Created by terrPang on 16/6/13.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "WKViewController.h"

@interface DoJudgeViewController : WKViewController

@property (strong, nonatomic) NSDictionary* pushDic;

@property (weak, nonatomic) IBOutlet UITextView *tvSubject;
@property (weak, nonatomic) IBOutlet UIButton *btPre;
@property (weak, nonatomic) IBOutlet UIButton *btNext;
@property (weak, nonatomic) IBOutlet UIButton *btRight;
@property (weak, nonatomic) IBOutlet UIButton *btWrong;

- (IBAction)clickPre;
- (IBAction)clickNext;
- (IBAction)clickSubmit:(UIButton *)sender;

@end
