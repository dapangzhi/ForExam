//
//  WKUnit.h
//  ForExam
//
//  Created by terrPang on 16/6/13.
//  Copyright © 2016年 terrPang. All rights reserved.
//

#import <Foundation/Foundation.h>


#define k_MyGreen [UIColor colorWithRed:18.00/255.00 green:136.00/255.00 blue:0/255.0 alpha:1]

#define k_MyGreen_b [UIColor colorWithRed:18.00/255.00 green:136.00/255.00 blue:0/255.0 alpha:0.5]

#define k_myRed [UIColor colorWithRed:238.00/255.00 green:53.00/255.00 blue:62.00/255.00 alpha:1]

#define k_myRed_b [UIColor colorWithRed:238.00/255.00 green:53.00/255.00 blue:62.00/255.00 alpha:0.5]

#define k_myBlue [UIColor colorWithRed:14.00/255.00 green:199.00/255.00 blue:255.00/255.00 alpha:1]

#define k_myBlue_b [UIColor colorWithRed:14.00/255.00 green:199.00/255.00 blue:255.00/255.00 alpha:0.1]

#define k_letterList @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J"]

#define k_String_rightAlert @"恭喜答对^_^"
#define k_String_wrongAlert @"做错啦→_→"

//保存题目列表plist的路径
#define k_plist_exam [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0] stringByAppendingPathComponent:@"exam.plist"]

@interface WKUnit : NSObject


@end
