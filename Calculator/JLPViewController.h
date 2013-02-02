//
//  JLPViewController.h
//  Calculator
//
//  Created by Josh Pearlstein on 1/14/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLPViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *calcOutput;
- (IBAction)buttonNum0:(UIButton *)sender;
- (IBAction)buttonNum1:(UIButton *)sender;
- (IBAction)buttonNum2:(UIButton *)sender;
- (IBAction)buttonNum3:(UIButton *)sender;
- (IBAction)buttonNum4:(UIButton *)sender;
- (IBAction)buttonNum5:(UIButton *)sender;
- (IBAction)buttonNum6:(UIButton *)sender;
- (IBAction)buttonNum7:(UIButton *)sender;
- (IBAction)buttonNum8:(UIButton *)sender;
- (IBAction)buttonNum9:(UIButton *)sender;
- (IBAction)buttonPeriod:(UIButton *)sender;
- (IBAction)buttonEquals:(UIButton *)sender;
- (IBAction)buttonPlus:(UIButton *)sender;
- (IBAction)buttonMinus:(UIButton *)sender;
- (IBAction)buttonMult:(UIButton *)sender;
- (IBAction)buttonDivide:(UIButton *)sender;
- (IBAction)buttonNeg:(UIButton *)sender;
- (IBAction)buttonClear:(UIButton *)sender;
- (IBAction)buttonPi:(UIButton *)sender;
- (IBAction)buttonExponent:(UIButton *)sender;
- (IBAction)buttonLParenthesis:(UIButton *)sender;
- (IBAction)buttonRParenthesis:(UIButton *)sender;

@end
