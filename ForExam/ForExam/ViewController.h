//
//  ViewController.h
//  ForExam
//
//  Created by terrPang on 16/5/31.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "WKViewController.h"

@interface ViewController : WKViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewMy;

- (IBAction)clickAddClass:(id)sender;

@end

