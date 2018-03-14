//
//  ChooseTopicViewController.h
//  ForExam
//
//  Created by terrPang on 16/6/15.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import "WKViewController.h"

@interface ChooseTopicViewController : WKViewController

@property (strong, nonatomic) NSString* pushIndex;

@property (weak, nonatomic) IBOutlet UISegmentedControl *scTab;
@end
