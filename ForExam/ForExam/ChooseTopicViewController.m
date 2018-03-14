//
//  ChooseTopicViewController.m
//  ForExam
//
//  Created by terrPang on 16/6/15.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "ChooseTopicViewController.h"

@interface ChooseTopicViewController ()

@end

@implementation ChooseTopicViewController{
    NSArray* topicList;
    NSDictionary* pushDic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    topicList = @[@"单选",@"多选",@"判断"];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    pushDic = [[[NSArray alloc] initWithContentsOfFile:k_plist_exam] objectAtIndex:_pushIndex.integerValue];
    
    self.title = [pushDic objectForKey:@"name"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger *)indexPath{
    
    return topicList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topicCell" forIndexPath:indexPath];
    
    [(UILabel *)[cell viewWithTag:1] setText:topicList[indexPath.row]];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            if (_scTab.selectedSegmentIndex == 1) {
                [self performSegueWithIdentifier:@"goEditSingleChoice" sender:_pushIndex];
                break;
            }
            
            if ([[pushDic objectForKey:@"single_choice"] count] > 0) {
                [self performSegueWithIdentifier:@"goDoSingleChoice" sender:pushDic];
            }else{
                [self showMessage:@"试题为空，请添加后再试"];
            }
            break;
        }
        case 1:{
            
            if (_scTab.selectedSegmentIndex == 1) {
                [self performSegueWithIdentifier:@"goEditMultiChoice" sender:_pushIndex];
                break;
            }
            
            if ([[pushDic objectForKey:@"multi_choice"] count] > 0) {
                [self performSegueWithIdentifier:@"goDoMultiChoice" sender:pushDic];
            }else{
                [self showMessage:@"试题为空，请添加后再试"];
            }
            break;
        }
        case 2:{
            
            if (_scTab.selectedSegmentIndex == 1) {
                [self performSegueWithIdentifier:@"goEditJudge" sender:_pushIndex];
                break;
            }
            
            if ([[pushDic objectForKey:@"judge"] count] > 0) {
                [self performSegueWithIdentifier:@"goDoJudge" sender:pushDic];
            }else{
                [self showMessage:@"试题为空，请添加后再试"];
            }
            break;
        }
        default:
            break;
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqual:@"goDoSingleChoice"] || [segue.identifier isEqual:@"goDoMultiChoice"] || [segue.identifier isEqual:@"goDoJudge"]) {
        [[segue destinationViewController] setValue:pushDic forKey:@"pushDic"];
    }else if([segue.identifier isEqual:@"goEditSingleChoice"] || [segue.identifier isEqual:@"goEditMultiChoice"]){
        [[segue destinationViewController] setValue:_pushIndex forKey:@"pushIndex"];
        [[segue destinationViewController] setValue:[segue.identifier isEqual:@"goEditSingleChoice"]?@"1":@"0" forKey:@"pushIsSingle"];
    }else if ([segue.identifier isEqual:@"goEditJudge"]){
        [[segue destinationViewController] setValue:_pushIndex forKey:@"pushIndex"];
    }
}

@end
