//
//  DoMultiChoiceViewController.h
//  ForExam
//
//  Created by terrPang on 16/6/13.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "WKViewController.h"

@interface DoMultiChoiceViewController : WKViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSDictionary* pushDic;

@property (weak, nonatomic) IBOutlet UIButton *btPre;
@property (weak, nonatomic) IBOutlet UIButton *btNext;
@property (weak, nonatomic) IBOutlet UILabel *lbSubject;
@property (weak, nonatomic) IBOutlet UITableView *tableViewMy;
- (IBAction)clickPre;
- (IBAction)clickNext;
- (IBAction)clickSubmit;
@end
