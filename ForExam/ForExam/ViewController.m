//
//  ViewController.m
//  ForExam
//
//  Created by terrPang on 16/5/31.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSMutableArray* allData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*@[@{
                     @"id":@"0",
                     @"name":@"高数一",
                     @"single_choice":@[@{
                                           @"name":@"试算平衡是通过编制试算平衡表进行的。试算平衡表通常是在期末结出各账户的本期发生额合计和期末余额后编制的，试算平衡表中一般应设置“期初余额”“本期发生额”和“期末余额”三大栏目，其下分设“借方”和“贷方”两个小栏。各大栏中的借方合计与贷方合计应该平衡相等。否则，便存在记账错误。",
                                           @"choice":@[@{@"id":@"0",@"connent":@"hehasdfffffdddsaaaaaaaaaaaaaaaaaaaaaaaaasdasdasdasdasdsdasdasdasdadasdadasddaeda"},
                                                       @{@"id":@"1",@"connent":@"hesdda"},
                                                       @{@"id":@"2",@"connent":@"hsdeda"},
                                                       @{@"id":@"3",@"connent":@"adsheda"}],
                                           @"answer":@"2",
                                           @"wrong_num":@"0",
                                           @"dis":@"这是解析"},
                                        @{
                                            @"name":@"测试题顶！d=====(￣▽￣*)b",
                                            @"choice":@[@{@"id":@"0",@"connent":@"hehasdfffffdddsaaaaaaaaaaaaaaaaaaaaaaaaasdasdasdasdasdsdasdasdasdadasdadasddaeda"},
                                                        @{@"id":@"1",@"connent":@"hesdda"},
                                                        @{@"id":@"2",@"connent":@"hsdeda"},
                                                        @{@"id":@"3",@"connent":@"adsheda"}],
                                            @"answer":@"0",
                                            @"wrong_num":@"0",
                                            @"dis":@"这是解析"},
                                        @{
                                            @"name":@"测试dsfdg题顶！d=====(￣▽￣*)b",
                                            @"choice":@[@{@"id":@"0",@"connent":@"hehasdfffffdddsaaaaaaaaaaaaaaaaaaaaaaaaasdasdasdasdasdsdasdasdasdadasdadasddaeda"},
                                                        @{@"id":@"1",@"connent":@"hesdda"},
                                                        @{@"id":@"2",@"connent":@"hsdeda"},
                                                        @{@"id":@"3",@"connent":@"adsheda"}],
                                            @"answer":@"3",
                                            @"wrong_num":@"0",
                                            @"dis":@"这是解析"},
                                        @{
                                            @"name":@"测asd试题顶！d=====(￣▽￣*)b",
                                            @"choice":@[@{@"id":@"0",@"connent":@"hehasdfffffdddsaaaaaaaaaaaaaaaaaaaaaaaaasdasdasdasdasdsdasdasdasdadasdadasddaeda"},
                                                        @{@"id":@"1",@"connent":@"hesdda"},
                                                        @{@"id":@"2",@"connent":@"hsdeda"},
                                                        @{@"id":@"3",@"connent":@"adsheda"}],
                                            @"answer":@"1",
                                            @"wrong_num":@"0",
                                            @"dis":@"这是解析"}],
                     @"multi_choice":@[@{
                                          @"name":@"下面的哪个单词是对的？",
                                          @"choice":@[@{@"id":@"0",@"connent":@"heheda"},
                                                      @{@"id":@"1",@"connent":@"hesdda"},
                                                      @{@"id":@"2",@"connent":@"hsdeda"},
                                                      @{@"id":@"3",@"connent":@"adsheda"},
                                                      @{@"id":@"4",@"connent":@"adsheda"}],
                                          @"answer":@[@"0",@"1"],
                                          @"wrong_num":@"0",
                                          @"dis":@"这是解析"},
                                       @{
                                           @"name":@"下面的哪个单asd词是对的？",
                                           @"choice":@[@{@"id":@"0",@"connent":@"heheda"},
                                                       @{@"id":@"1",@"connent":@"hesdda"},
                                                       @{@"id":@"2",@"connent":@"hsdeda"},
                                                       @{@"id":@"3",@"connent":@"adsheda"}],
                                           @"answer":@[@"0",@"1",@"2",@"3"],
                                           @"wrong_num":@"0",
                                           @"dis":@"这是解析"},
                                       @{
                                           @"name":@"下面的哪个单词是sggg对的？",
                                           @"choice":@[@{@"id":@"0",@"connent":@"heheda"},
                                                       @{@"id":@"1",@"connent":@"hesdda"},
                                                       @{@"id":@"2",@"connent":@"hsdeda"},
                                                       @{@"id":@"3",@"connent":@"adsheda"}],
                                           @"answer":@[@"1",@"2"],
                                           @"wrong_num":@"0",
                                           @"dis":@"这是解析"},
                                       @{
                                           @"name":@"下面ddd的哪个单词是对的？",
                                           @"choice":@[@{@"id":@"0",@"connent":@"heheda"},
                                                       @{@"id":@"1",@"connent":@"hesdda"},
                                                       @{@"id":@"2",@"connent":@"hsdeda"},
                                                       @{@"id":@"3",@"connent":@"adsheda"}],
                                           @"answer":@[@"0",@"1",@"3"],
                                           @"wrong_num":@"0",
                                           @"dis":@"这是解析"}],
                     @"judge":@[@{@"name":@"我说我是超人。",
                                  @"is_right":@"0",
                                  @"wrong_num":@"0"},
                                @{@"name":@"我说我是按时开放及健康超人。",
                                  @"is_right":@"1",
                                  @"wrong_num":@"0"},
                                @{@"name":@"我爱是房间诶屋内如说我是超人。",
                                  @"is_right":@"0",
                                  @"wrong_num":@"0"},
                                @{@"name":@"我说按时打卡上浪费麻烦我是超人。",
                                  @"is_right":@"0",
                                  @"wrong_num":@"0"},
                                @{@"name":@"爱上了看法了看法吗我说我是超人。",
                                  @"is_right":@"1",
                                  @"wrong_num":@"0"}]},
                 @{
                     @"id":@"1",
                     @"name":@"线性代数",
                     @"single_choice":@[@{
                                           @"name":@"下面的哪个单词是对的？",
                                           @"choice":@[@{@"id":@"0",@"connent":@"heheda"},
                                                       @{@"id":@"1",@"connent":@"hesdda"},
                                                       @{@"id":@"2",@"connent":@"hsdeda"},
                                                       @{@"id":@"3",@"connent":@"adsheda"}],
                                           @"answer":@"1",
                                           @"wrong_num":@"0",
                                           @"dis":@"这是解析"}],
                     @"multi_choice":@[@{
                                          @"name":@"下面的哪个单词是对的？",
                                          @"choice":@[@{@"id":@"0",@"connent":@"heheda"},
                                                      @{@"id":@"1",@"connent":@"hesdda"},
                                                      @{@"id":@"2",@"connent":@"hsdeda"},
                                                      @{@"id":@"3",@"connent":@"adsheda"}],
                                          @"answer":@[@"0",@"1"],
                                          @"wrong_num":@"0",
                                          @"dis":@"这是解析"}],
                     @"judge":@[@{@"name":@"我说我是超人。",
                                  @"is_right":@"0",
                                  @"wrong_num":@"0"}]}];*/
    [self updateTheSubject];
}

- (void)updateTheSubject{
    
    allData = [[NSMutableArray alloc] initWithContentsOfFile:k_plist_exam];
    
    [_tableViewMy reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [allData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"subjectName" forIndexPath:indexPath];
    
    [(UILabel *)[cell viewWithTag:1] setText:[allData[indexPath.row] objectForKey:@"name"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"showChooseTopic" sender:[NSString stringWithFormat:@"%ld",indexPath.row]];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{                       // 左滑删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要删除此门科目吗？删除后此科目下的所有试题数据也会被清除。" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            
            [allData removeObjectAtIndex:indexPath.row];
            
            [allData writeToFile:k_plist_exam atomically:YES];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation: UITableViewRowAnimationAutomatic];
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqual:@"showChooseTopic"]) {
        [[segue destinationViewController] setValue:sender forKey:@"pushIndex"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickAddClass:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"添加一门科目" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"请输入科目名称";
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        UITextField *nameTF = alertController.textFields.firstObject;
        
        if (nameTF.text.length > 0) {
            
            if (allData.count == 0) {
                
                //创建初始数据
                [@[@{
                       @"name":nameTF.text,
                       @"single_choice":@[],
                       @"multi_choice":@[],
                       @"judge":@[]}] writeToFile:k_plist_exam atomically:YES];
                
                [self updateTheSubject];
            }else{
                BOOL isInclude = NO;
                for (NSDictionary* subjectDic in allData) {
                    if ([[subjectDic objectForKey:@"name"] isEqual:nameTF.text]) {
                        isInclude = YES;
                    }
                }
                
                if (!isInclude) {
                    //添加新科目
                    [allData addObject:@{
                                           @"name":nameTF.text,
                                           @"single_choice":@[],
                                           @"multi_choice":@[],
                                           @"judge":@[]}];
                    [allData writeToFile:k_plist_exam atomically:YES];
                    
                    [self updateTheSubject];
                }else{
                    //已有此科目
                    [self showMessage:@"已有此科目"];
                }
            }
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
