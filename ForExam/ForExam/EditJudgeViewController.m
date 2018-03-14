//
//  EditJudgeViewController.m
//  ForExam
//
//  Created by terrPang on 16/6/15.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "EditJudgeViewController.h"

@interface EditJudgeViewController ()

@end

@implementation EditJudgeViewController{
    NSMutableDictionary* theQuestion;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateTheSubject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTheSubject{
    
    theQuestion = [NSMutableDictionary dictionaryWithDictionary:
                   @{@"name":@"",
                     @"is_right":@"1",
                     @"wrong_num":@"0",
                     @"dis":@""}];
    
    _tvQuestion.text = [theQuestion objectForKey:@"name"];
    
    _btRight.backgroundColor = k_MyGreen_b;
    _btWrong.backgroundColor = k_myBlue_b;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickRightOrWrong:(UIButton *)sender {
    _btRight.backgroundColor = k_myBlue_b;
    _btWrong.backgroundColor = k_myBlue_b;
    
    sender.backgroundColor = k_MyGreen_b;
    
    [theQuestion setObject:sender == _btRight?@"1":@"0" forKey:@"is_right"];
}

- (IBAction)clickAdd {
    if (_tvQuestion.text.length > 0) {
        
        [theQuestion setObject:_tvQuestion.text forKey:@"name"];
        
        NSMutableArray* allData = [[NSMutableArray alloc] initWithContentsOfFile:k_plist_exam];
        [[[allData objectAtIndex:_pushIndex.integerValue] objectForKey:@"judge"] addObject:theQuestion];
        [allData writeToFile:k_plist_exam atomically:YES];
        
        [self updateTheSubject];
    }else{
        [self showMessage:@"请输入题目内容"];
    }
}

- (IBAction)clickList {
    
}
@end
