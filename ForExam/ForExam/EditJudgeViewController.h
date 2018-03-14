//
//  EditJudgeViewController.h
//  ForExam
//
//  Created by terrPang on 16/6/15.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "WKViewController.h"

@interface EditJudgeViewController : WKViewController

@property (strong, nonatomic) NSString* pushIndex;

@property (weak, nonatomic) IBOutlet UIButton *btRight;
@property (weak, nonatomic) IBOutlet UIButton *btWrong;
@property (weak, nonatomic) IBOutlet UITextView *tvQuestion;
- (IBAction)clickRightOrWrong:(UIButton *)sender;
- (IBAction)clickAdd;
- (IBAction)clickList;
@end
