//
//  DoSingleChoiceViewController.m
//  ForExam
//
//  Created by terrPang on 16/6/13.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "DoSingleChoiceViewController.h"

@interface DoSingleChoiceViewController ()

@end

@implementation DoSingleChoiceViewController{
    NSInteger nowDoNum;
    NSInteger choiceNum;
    NSArray* singleChoiceList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    nowDoNum = 0;
    singleChoiceList = [_pushDic objectForKey:@"single_choice"];
    
    [self updateTheSubject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTheSubject{
    self.title = @"";
    choiceNum = -1;
    
    if (singleChoiceList.count > 0) {
        _lbSubject.text = [NSString stringWithFormat:@"%ld，%@",nowDoNum+1,[singleChoiceList[nowDoNum] objectForKey:@"name"]];
    }
    
    _btPre.hidden = nowDoNum == 0?YES:NO;
    _btNext.hidden = nowDoNum+1 == singleChoiceList.count?YES:NO;
    
    [_tableViewMy reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (singleChoiceList.count > 0) {
        return [[singleChoiceList[nowDoNum] objectForKey:@"choice"] count];
    }else{
        return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"singleChoiceCell" forIndexPath:indexPath];
    [(UILabel *)[cell viewWithTag:1] setText:[NSString stringWithFormat:@"%@.%@",k_letterList[indexPath.row],[[singleChoiceList[nowDoNum] objectForKey:@"choice"][indexPath.row] objectForKey:@"connent"]]];
    if (choiceNum != -1) {
        
        NSInteger answerNum = [[singleChoiceList[nowDoNum] objectForKey:@"answer"] integerValue];
        
        if (indexPath.row == answerNum) {
            cell.backgroundColor = k_MyGreen_b;
            if (answerNum == choiceNum) {
                self.title = k_String_rightAlert;
            }
        }else if (indexPath.row == choiceNum){
            cell.backgroundColor = k_myRed_b;
            self.title = k_String_wrongAlert;
        }else{
            cell.backgroundColor = [UIColor whiteColor];
        }
    }else{
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (choiceNum==-1) {
        choiceNum = indexPath.row;
        [tableView reloadData];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickPre {
    nowDoNum--;
    [self updateTheSubject];
}

- (IBAction)clickNext {
    nowDoNum++;
    [self updateTheSubject];
}

@end
