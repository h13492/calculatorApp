//
//  ViewController.h
//  calculatorApp
//
//  Created by Himanshu Rajput on 21/01/16.
//  Copyright © 2016 Himanshu Rajput. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableString *firstNumber, *secondNumber, *finalResult, *display;
}
@property (weak, nonatomic) IBOutlet UILabel *dialedValue;
@property (weak, nonatomic) IBOutlet UILabel *resultValue;
- (IBAction)typeDigit:(id)sender;

- (IBAction)arithmaticOperation:(id)sender;


- (IBAction)clearScreen:(id)sender;
- (IBAction)decimalPoint:(id)sender;
- (IBAction)deleteDigit:(id)sender;
- (IBAction)equalTo:(id)sender;
- (IBAction)signAction:(id)sender;
@end

