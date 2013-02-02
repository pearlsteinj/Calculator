//
//  JLPViewController.m
//  Calculator
//
//  Created by Josh Pearlstein on 1/14/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "JLPViewController.h"

@interface JLPViewController ()

@end

@implementation JLPViewController
@synthesize calcOutput;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Add background Image
    UIImage *patternImage = [UIImage imageNamed:@"low_contrast_linen.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:patternImage];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonNum7:(UIButton *)sender {
}

- (IBAction)buttonNum8:(UIButton *)sender {
}

- (IBAction)buttonNum9:(UIButton *)sender {
}

- (IBAction)buttonPeriod:(UIButton *)sender {
}

- (IBAction)buttonEquals:(UIButton *)sender {
}

- (IBAction)buttonPlus:(UIButton *)sender {
}

- (IBAction)buttonMinus:(UIButton *)sender {
}

- (IBAction)buttonMult:(UIButton *)sender {
}

- (IBAction)buttonDivide:(UIButton *)sender {
}

- (IBAction)buttonNeg:(UIButton *)sender {
}

- (IBAction)buttonClear:(UIButton *)sender {
}

- (IBAction)buttonPi:(UIButton *)sender {
}

- (IBAction)buttonExponent:(UIButton *)sender {
}

- (IBAction)buttonLParenthesis:(UIButton *)sender {
}

- (IBAction)buttonRParenthesis:(UIButton *)sender {
}
- (IBAction)buttonNum0:(UIButton *)sender {
}

- (IBAction)buttonNum1:(UIButton *)sender {
}

- (IBAction)buttonNum2:(UIButton *)sender {
}

- (IBAction)buttonNum3:(UIButton *)sender {
}

- (IBAction)buttonNum4:(UIButton *)sender {
}

- (IBAction)buttonNum5:(UIButton *)sender {
}

- (IBAction)buttonNum6:(UIButton *)sender {
}

@end
