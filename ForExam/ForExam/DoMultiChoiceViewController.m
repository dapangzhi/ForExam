//
//  DoMultiChoiceViewController.m
//  ForExam
//
//  Created by terrPang on 16/6/13.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "DoMultiChoiceViewController.h"

@interface DoMultiChoiceViewController ()

@end

@implementation DoMultiChoiceViewController{
    NSInteger nowDoNum;
    BOOL isOK;
    BOOL isRight;
    NSArray* multiChoiceList;
    NSMutableDictionary* choiceList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    nowDoNum = 0;
    
    multiChoiceList = [_pushDic objectForKey:@"multi_choice"];
    
    [self updateTheSubject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTheSubject{
    
    self.title = @"";
    isOK = NO;
    isRight = YES;
    choiceList = [[NSMutableDictionary alloc] init];
    
    if (multiChoiceList.count > 0) {
        _lbSubject.text = [NSString stringWithFormat:@"%ld，%@",nowDoNum+1,[multiChoiceList[nowDoNum] objectForKey:@"name"]];
    }
    
    _btPre.hidden = nowDoNum == 0?YES:NO;
    _btNext.hidden = nowDoNum+1 == multiChoiceList.count?YES:NO;
    
    [_tableViewMy reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (multiChoiceList.count > 0) {
        return [[multiChoiceList[nowDoNum] objectForKey:@"choice"] count];
    }else{
        return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"singleChoiceCell" forIndexPath:indexPath];
    [(UILabel *)[cell viewWithTag:1] setText:[NSString stringWithFormat:@"%@.%@",k_letterList[indexPath.row],[[multiChoiceList[nowDoNum] objectForKey:@"choice"][indexPath.row] objectForKey:@"connent"]]];
    [(UIButton *)[cell viewWithTag:2] setSelected:[choiceList objectForKey:@(indexPath.row)]];
    
    if (isOK) {
        NSArray* answerNum = [multiChoiceList[nowDoNum] objectForKey:@"answer"];
        
        if ([answerNum containsObject:[NSString stringWithFormat:@"%ld",indexPath.row]]) {
            cell.backgroundColor = k_MyGreen_b;
            
            if (![choiceList.allKeys containsObject:@(indexPath.row)]) {
                isRight = NO;
            }
        }else if([choiceList.allKeys containsObject:@(indexPath.row)]){
            cell.backgroundColor = k_myRed_b;
            isRight = NO;
        }else{
            cell.backgroundColor = [UIColor whiteColor];
        }
        
        //判断做的对错
        if (indexPath.row+1 == [[multiChoiceList[nowDoNum] objectForKey:@"choice"] count] && !isRight) {
            self.title = k_String_wrongAlert;
        }else{
            self.title = k_String_rightAlert;
        }
    }else{
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (!isOK) {
        if ([choiceList objectForKey:@(indexPath.row)]) {
            [choiceList removeObjectForKey:@(indexPath.row)];
        }else{
            [choiceList setObject:@"1" forKey:@(indexPath.row)];
        }
        
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

- (IBAction)clickSubmit {
    isOK = YES;
    [_tableViewMy reloadData];
}

@end
