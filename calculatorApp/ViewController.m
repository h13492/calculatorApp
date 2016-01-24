//
//  ViewController.m
//  calculatorApp
//
//  Created by Himanshu Rajput on 21/01/16.
//  Copyright © 2016 Himanshu Rajput. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{

}

@end

@implementation ViewController
{
    BOOL edit, stillEdit,result1,firstOp,flag;
     NSMutableString *operator1;
}
@synthesize dialedValue, resultValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    firstOp=YES;
    dialedValue.text=@"";
    resultValue.text=@"";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)typeDigit:(UIButton *)sender {
    NSMutableString *currentDigit=(NSMutableString *)sender.currentTitle;
    if (edit==YES) {
        dialedValue.text=[dialedValue.text stringByAppendingString:currentDigit];
        firstNumber =[NSMutableString stringWithString:dialedValue.text];
        }
    else if (stillEdit)
    {
        dialedValue.text=[dialedValue.text stringByAppendingString:currentDigit];
        if (secondNumber==nil) {
            secondNumber=currentDigit;
        }
        else{
            secondNumber=[[secondNumber stringByAppendingString:currentDigit]mutableCopy];
        }
       [self PerformOperation:firstNumber andNum2:secondNumber andOp:operator1];
        result1=YES;
       }
    else{
        dialedValue.text=currentDigit;
        firstNumber=[NSMutableString stringWithString:dialedValue.text];
        edit=YES;
    }
}

- (IBAction)arithmaticOperation:(UIButton *)sender {
    edit=NO;
    operator1=[NSMutableString stringWithString:sender.currentTitle];
    flag=YES;
    if (firstOp==NO) {
        firstNumber=finalResult;
        dialedValue.text=firstNumber;
    }
    firstOp=NO;
    if (flag) {
        dialedValue.text=[dialedValue.text stringByAppendingString:operator1];
        stillEdit=YES;
    }
    secondNumber=nil;
}

- (IBAction)clearScreen:(id)sender {
    dialedValue.text=@"";
    resultValue.text=@"";
    firstNumber=nil;
    secondNumber=nil;
    finalResult=nil;
    flag=NO;
    firstOp=YES;
    edit=NO;
    result1=NO;
    stillEdit=NO;
}

- (IBAction)decimalPoint:(id)sender {
    if (firstNumber) {
        dialedValue.text=[dialedValue.text stringByAppendingString:@"."];
    }else if (secondNumber){
        secondNumber=[[secondNumber stringByAppendingString:@"."] mutableCopy];
    }
    
}

- (IBAction)deleteDigit:(id)sender {
    finalResult=[[finalResult substringToIndex:[finalResult length]-1]mutableCopy];
}

- (IBAction)equalTo:(id)sender {
    [self PerformOperation:firstNumber andNum2:secondNumber andOp:operator1];
}

- (IBAction)signAction:(id)sender {
}
-(void)PerformOperation:(NSMutableString *)num1 andNum2:(NSMutableString *)num2 andOp:(NSMutableString *)operator{
    
    float no1, no2;
    no1=[num1 floatValue];
    no2=[num2 floatValue];
    float result=0;
    
    if ([operator isEqualToString:@"+"]) {
        result = no1+no2;
        resultValue.text=[NSString stringWithFormat:@"%.4f",result];
    }
    else if ([operator isEqualToString:@"-"]) {
        result = no1-no2;
        resultValue.text=[NSString stringWithFormat:@"%.4f",result];
    }
    else if ([operator isEqualToString:@"*"]) {
        result = no1*no2;
        resultValue.text=[NSString stringWithFormat:@"%.4f",result];
    }
    else if ([operator isEqualToString:@"/"]) {
        result = no1/no2;
        resultValue.text=[NSString stringWithFormat:@"%.4f",result];
    }
    else if ([operator isEqualToString:@"%"]) {
        stillEdit=NO;
        edit=NO;
        result = no1 / 100;
        resultValue.text=[NSString stringWithFormat:@"%.4f",result];
    }
    finalResult=[NSMutableString stringWithFormat:@"%.4f",result];
}
@end
