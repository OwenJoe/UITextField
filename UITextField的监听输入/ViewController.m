//
//  ViewController.m
//  UITextField的监听输入
//
//  Created by owen on 16/5/19.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITextFieldDelegate>

/**
 *  输入框 uitextfield
 */
@property (nonatomic,strong) UITextField *dTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initTextFieldMethod];
 
}

/**
 *  初始化
 */
-(void)initTextFieldMethod{

    
    //只有初始化,才能写代理,东西都么有,哪里来的各种属性,很容易空指针,野指针,虽然不报错,但是非常危险
    self.dTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50)];

    //代理不要忘了写
    self.dTextField.delegate = self;
    
    //删除的叉叉号
    self.dTextField.clearButtonMode = UITextFieldViewModeAlways;
    
    //字符变成密码..
    self.dTextField.secureTextEntry = YES;
    
    //默认保持文本长度,文本太长会自动滚动
    self.dTextField.adjustsFontSizeToFitWidth = YES;
    
    //更改键盘return样式
    self.dTextField.returnKeyType =UIReturnKeySearch;
    
    
    self.dTextField.placeholder = @"请输入关键字";
    self.dTextField.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_dTextField];

    
    //监听的动作是:UIControlEventEditingChanged
    [self.dTextField addTarget:self action:@selector(textFieldClick:) forControlEvents:UIControlEventEditingChanged];
}


/**
 *  监听文本框输入
 *
 */
-(void)textFieldClick:(UITextField *)sender{

    NSLog(@"正在输入的文字:%@",[sender text]);
    
}


/**
 *  监听键盘return按键
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSLog(@"监听return:%@",textField.text);
    return YES;
}





@end
