//
//  EditSingleChoiceViewController.m
//  ForExam
//
//  Created by terrPang on 16/6/15.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "EditSingleChoiceViewController.h"

@interface EditSingleChoiceViewController ()

@end

@implementation EditSingleChoiceViewController{
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
                     @"choice":[NSMutableArray arrayWithObjects:
                                [NSMutableDictionary dictionaryWithObjectsAndKeys:@"0",@"id",@"",@"connent", nil],
                                [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"id",@"",@"connent", nil],
                                [NSMutableDictionary dictionaryWithObjectsAndKeys:@"2",@"id",@"",@"connent", nil],
                                [NSMutableDictionary dictionaryWithObjectsAndKeys:@"3",@"id",@"",@"connent", nil], nil],
                     @"answer":[_pushIsSingle isEqual:@"1"]?@"0":[NSMutableArray arrayWithArray:@[@"0"]],
                     @"wrong_num":@"0",
                     @"dis":@""}];
    
    _tvQuestion.text = [theQuestion objectForKey:@"name"];
    
    [_tableViewMy reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[theQuestion objectForKey:@"choice"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"editChoiceCell" forIndexPath:indexPath];
    [(UILabel *)[cell viewWithTag:3] setText:k_letterList[indexPath.row]];
    
    UIButton* checkBt = (UIButton *)[cell viewWithTag:2];
    checkBt.layer.name = [NSString stringWithFormat:@"%ld",indexPath.row];
    [checkBt setSelected:[_pushIsSingle isEqual:@"1"] ? [[theQuestion objectForKey:@"answer"] integerValue] == indexPath.row : [[theQuestion objectForKey:@"answer"] containsObject:[NSString stringWithFormat:@"%ld",indexPath.row]]];
    
    UITextView* tvConnent = (UITextView *)[cell viewWithTag:1];
    tvConnent.layer.name = [NSString stringWithFormat:@"%ld",indexPath.row];
    [tvConnent setText:[[theQuestion objectForKey:@"choice"][indexPath.row] objectForKey:@"connent"]];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView == _tvQuestion) {
        [theQuestion setObject:textView.text forKey:@"name"];
    }else{
        
        [[[NSMutableArray arrayWithArray:[theQuestion objectForKey:@"choice"]] objectAtIndex:textView.layer.name.integerValue] setObject:textView.text forKey:@"connent"];
    }
}

- (IBAction)clickAdd {
    
    if ([[theQuestion objectForKey:@"name"] length] == 0) {
        [self showMessage:@"请输入题目"];
        return;
    }
    
    NSMutableArray* allData = [[NSMutableArray alloc] initWithContentsOfFile:k_plist_exam];
    [[[allData objectAtIndex:_pushIndex.integerValue] objectForKey:[_pushIsSingle isEqual:@"1"]?@"single_choice":@"multi_choice"] addObject:theQuestion];
    [allData writeToFile:k_plist_exam atomically:YES];
    
    [self updateTheSubject];
}

- (IBAction)clickList {
}

- (IBAction)clickCheckBox:(UIButton *)sender {
    if ([_pushIsSingle isEqual:@"1"]) {
        [theQuestion setObject:sender.layer.name forKey:@"answer"];
    }else{
        
        if ([[theQuestion objectForKey:@"answer"] containsObject:sender.layer.name]) {
            if ([[theQuestion objectForKey:@"answer"] count] > 1) {
                [[theQuestion objectForKey:@"answer"] removeObject:sender.layer.name];
            }else{
                [self showMessage:@"确保至少有一个答案"];
            }
        }else{
            [[theQuestion objectForKey:@"answer"] addObject:sender.layer.name];
        }
    }
    
    [_tableViewMy reloadData];
}

- (IBAction)clickChangeChoice:(UIStepper *)sender {
    
    sender.maximumValue = [k_letterList count];
    
    if (sender.value-[[theQuestion objectForKey:@"choice"] count] > 0) {
        [[theQuestion objectForKey:@"choice"] addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%ld",[[theQuestion objectForKey:@"choice"] count]],@"id",@"",@"connent", nil]];
    }else{
        [[theQuestion objectForKey:@"choice"] removeLastObject];
        [theQuestion setObject:[_pushIsSingle isEqual:@"1"]?@"0":[NSMutableArray arrayWithArray:@[@"0"]] forKey:@"answer"];
    }
    [_tableViewMy reloadData];
}

@end