//
//  DoJudgeViewController.m
//  ForExam
//
//  Created by terrPang on 16/6/13.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "DoJudgeViewController.h"

@interface DoJudgeViewController ()

@end

@implementation DoJudgeViewController{
    NSInteger nowDoNum;
    NSArray* judgeList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    nowDoNum = 0;
    judgeList = [_pushDic objectForKey:@"judge"];
    
    [self updateTheSubject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTheSubject{
    
    self.title = @"";
    
    if (judgeList.count > 0) {
        _tvSubject.text = [NSString stringWithFormat:@"%ld，%@",nowDoNum+1,[judgeList[nowDoNum] objectForKey:@"name"]];
    }
    
    _btPre.hidden = nowDoNum == 0?YES:NO;
    _btNext.hidden = nowDoNum+1 == judgeList.count?YES:NO;
    
    _btRight.backgroundColor = k_myBlue_b;
    _btWrong.backgroundColor = k_myBlue_b;
    
    _btRight.enabled = YES;
    _btWrong.enabled = YES;
}

- (IBAction)clickPre {
    nowDoNum--;
    [self updateTheSubject];
}

- (IBAction)clickNext {
    nowDoNum++;
    [self updateTheSubject];
}

- (IBAction)clickSubmit:(UIButton *)sender {
    
    BOOL clickRight = sender==_btRight;
    BOOL isRight = [[judgeList[nowDoNum] objectForKey:@"is_right"] boolValue];
    
    if (isRight == clickRight) {
        
        self.title = k_String_rightAlert;
        sender.backgroundColor = k_MyGreen_b;
    }else{
        
        self.title = k_String_wrongAlert;
        _btRight.backgroundColor = k_MyGreen_b;
        _btWrong.backgroundColor = k_MyGreen_b;
        sender.backgroundColor = k_myRed_b;
    }
    
    _btRight.enabled = NO;
    _btWrong.enabled = NO;
}

@end
