//
//  EditSingleChoiceViewController.h
//  ForExam
//
//  Created by terrPang on 16/6/15.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "WKViewController.h"

@interface EditSingleChoiceViewController : WKViewController<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>

@property (strong, nonatomic) NSString* pushIndex;
@property (strong, nonatomic) NSString* pushIsSingle;

@property (weak, nonatomic) IBOutlet UITextView *tvQuestion;
@property (weak, nonatomic) IBOutlet UITableView *tableViewMy;

- (IBAction)clickAdd;
- (IBAction)clickList;
- (IBAction)clickCheckBox:(UIButton *)sender;
- (IBAction)clickChangeChoice:(UIStepper *)sender;
@end
