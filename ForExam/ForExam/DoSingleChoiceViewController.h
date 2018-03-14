//
//  DoSingleChoiceViewController.h
//  ForExam
//
//  Created by terrPang on 16/6/13.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "WKViewController.h"

@interface DoSingleChoiceViewController : WKViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSDictionary* pushDic;

@property (weak, nonatomic) IBOutlet UILabel *lbSubject;
@property (weak, nonatomic) IBOutlet UITableView *tableViewMy;
@property (weak, nonatomic) IBOutlet UIButton *btPre;
@property (weak, nonatomic) IBOutlet UIButton *btNext;

- (IBAction)clickPre;
- (IBAction)clickNext;

@end
