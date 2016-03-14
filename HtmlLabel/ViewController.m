//
//  ViewController.m
//  HtmlLabel
//
//  Created by pencho on 16/2/16.
//  Copyright © 2016年 pencho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
     !!! !!!!同步操作 需要加异步处理

      NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
     */
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 20)];
    [self.view addSubview:lab];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString * htmlString = @"<div style='background-color:#F1F1F1; font-size:14px; color:#304182;text-align:center; margin-left:10px; padding-right:10px'><p>iOS<span style='font-size:18px; color:#E88834;'>Developer</span>Tips</p></div>";
        NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];

        dispatch_async(dispatch_get_main_queue(), ^{
            lab.attributedText = attrStr;

        });
        
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
