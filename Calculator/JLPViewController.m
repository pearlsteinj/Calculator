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
NSMutableArray *stack;
NSString *display;
int size;
bool showingResult; 
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Add background Image
    UIImage *patternImage = [UIImage imageNamed:@"low_contrast_linen.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:patternImage];
    display = @"0";
    stack = [[NSMutableArray alloc] init];
    showingResult = NO;
    [self updateDisplay];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) updateDisplay {
    [calcOutput setText: display];
    
}
- (IBAction)buttonNum7:(UIButton *)sender {
    if(([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]) && !showingResult){
        display = [display stringByAppendingString:@"7"];
    }
    else
        display = @"7";
    showingResult = NO;
    [self updateDisplay];
    
  
}

- (IBAction)buttonNum8:(UIButton *)sender {
    if(([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]) && !showingResult){
        display = [display stringByAppendingString:@"8"];
    }
    else
        display = @"8";
    showingResult = NO;
    [self updateDisplay];
}

- (IBAction)buttonNum9:(UIButton *)sender {
    if(([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]) && !showingResult){
        display = [display stringByAppendingString:@"9"];
    }
    else
        display = @"9";
    showingResult = NO;
    [self updateDisplay];
}

- (IBAction)buttonPeriod:(UIButton *)sender {
    if([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]){
        display = [display stringByAppendingString:@"."];
    }
    else
        display = @"0.";
    [self updateDisplay];
}



- (IBAction)buttonEquals:(UIButton *)sender {
    double result = 0;
    
    if([stack count] == 1 || [stack count] == 0){
            double num = [display doubleValue];
            result = num;
        return;
    }
    [self moveToStack];

    if([stack count] >1){
    NSDecimalNumber *num1 = [stack objectAtIndex:0];
        double num_1 = [num1 doubleValue];
        [stack removeObjectAtIndex:0];
        size--;
        NSString *op = [stack objectAtIndex:0];
        [stack removeObjectAtIndex:0];
        size--;
        NSDecimalNumber *num2 = [stack objectAtIndex:0];
        double num_2 = [num2 doubleValue];
        [stack removeObjectAtIndex:0];
        size--;
        if([stack count]>0){
            NSString *op2 = [stack objectAtIndex:0];
            if([op2 isEqualToString:@"/"] || [op2 isEqualToString:@"*"] || [op2 isEqualToString:@"^"]){
                [stack removeObjectAtIndex:0];
                size--;
                double num_3 = [num2 doubleValue];
                [stack removeObjectAtIndex:0];
                size--;
                if([op2 isEqualToString:@"/"]){
                    num_2 = num_2 / num_3;
                }
                else if([op2 isEqualToString:@"*"]){
                    num_2 = num_2 * num_3;
                }
                else if([op2 isEqualToString:@"^"]){
                    num_2 = pow(num_2,num_3);
                }
            }
        }
        
        if([op isEqualToString:@"+"]){
            result = num_1 + num_2;
        }
        if([op isEqualToString:@"*"]){
            result = num_1 * num_2;
        }
        if([op isEqualToString:@"/"]){
            result = num_1 / num_2;
        }
        if([op isEqualToString:@"—"]){
            result = num_1 - num_2;
        }
        if([op isEqualToString:@"^"]){
            result = pow(num_1,num_2);
        }
    }
    
                while ([stack count] > 0) {
                    NSString *op = [stack objectAtIndex:0];
                    [stack removeObjectAtIndex:0];
                    size--;
                    NSDecimalNumber *num2 = [stack objectAtIndex:0];
                    double num_22 = [num2 doubleValue];
                    [stack removeObjectAtIndex:0];
                    size--;
                    if([stack count]>0){
                        NSString *op2 = [stack objectAtIndex:0];
                        if([op2 isEqualToString:@"/"] || [op2 isEqualToString:@"*"] || [op2 isEqualToString:@"^"]){
                            [stack removeObjectAtIndex:0];
                            size--;
                            double num_3 = [num2 doubleValue];
                            [stack removeObjectAtIndex:0];
                            size--;
                            if([op2 isEqualToString:@"/"]){
                                result = result / num_3;
                            }
                            else if([op2 isEqualToString:@"*"]){
                                result = result * num_3;
                            }
                            else if([op2 isEqualToString:@"^"]){
                                result = pow(result,num_3);
                            }
                        }
                    }
                    if([op isEqualToString:@"+"]){
                        result = result + num_22;
                    }
                    if([op isEqualToString:@"*"]){
                        result = result * num_22;
                    }
                    if([op isEqualToString:@"/"]){
                        result = result / num_22;
                    }
                    if([op isEqualToString:@"—"]){
                        result = result - num_22;
                    }
                    if([op isEqualToString:@"^"]){
                        result = pow(result,num_22);
                    }
                }
            
    
    
    display = [NSString stringWithFormat:@"%.2f",result];
    showingResult = YES;
    [self updateDisplay];
    
    }

- (IBAction)buttonPlus:(UIButton *)sender {
    [self moveToStack];
    NSString *plus = @"+";
    [stack addObject:plus];
    display = @"+";
    showingResult = NO;
    [self updateDisplay];
    
}

- (IBAction)buttonMinus:(UIButton *)sender {
    [self moveToStack];
    NSString *minus = @"—";
    [stack addObject:minus];
    display = @"—";
    showingResult = NO;
    [self updateDisplay];
    
}

- (IBAction)buttonMult:(UIButton *)sender {
    [self moveToStack];
    NSString *mult = @"*";
    [stack addObject:mult];
    display = @"*";
    showingResult = NO;

    [self updateDisplay];
    
}

- (IBAction)buttonDivide:(UIButton *)sender {
    [self moveToStack];
    NSString *div = @"/";
    [stack addObject:div];
    display = @"/";
    showingResult = NO;

    [self updateDisplay];
    
}

- (IBAction)buttonNeg:(UIButton *)sender {
    if([display doubleValue] != 0){
        NSRange range = NSMakeRange (0, 1);
        if(![[display substringWithRange:range] isEqual: @"-"]){
        NSString *str = [NSString stringWithFormat:@"-%@",display];
        display = str;
        }
    }
    else
        display = @"-";
    showingResult = NO;

    [self updateDisplay];
    
}

- (IBAction)buttonClear:(UIButton *)sender {
    display = @"0";
    [stack removeAllObjects];
    showingResult = NO;
    [self updateDisplay];
}

- (IBAction)buttonPi:(UIButton *)sender {
    if(([display doubleValue] != 0) && !showingResult){
        display = [display stringByAppendingString:@"3.14159"];
    }
    else
        display = @"3.14159";
    showingResult = NO;

    [self updateDisplay];
    
}

- (IBAction)buttonExponent:(UIButton *)sender {
    [self moveToStack];
    NSString *exp = @"^";
    [stack addObject:exp];
    display = @"^";
    showingResult = NO;

    [self updateDisplay];
    
}

- (IBAction)buttonLParenthesis:(UIButton *)sender {
    [self moveToStack];
    NSString *lP = @"(";
    [stack addObject:lP];
    display = @"(";
    showingResult = NO;

    [self updateDisplay];
    
}

- (IBAction)buttonRParenthesis:(UIButton *)sender {
    [self moveToStack];
    NSString *rP = @")";
    [stack addObject:rP];
    display = @")";
    showingResult = NO;
    [self updateDisplay];
    
}
- (IBAction)buttonNum0:(UIButton *)sender {
    if(([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]) && !showingResult){
        display = [display stringByAppendingString:@"0"];
    }
    else
        display = @"0";
    showingResult = NO;
    [self updateDisplay];
}

- (IBAction)buttonNum1:(UIButton *)sender {
    if(([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]) && !showingResult){
        display = [display stringByAppendingString:@"1"];
    }
    else
        display = @"1";
    showingResult = NO;
    [self updateDisplay];
}

- (IBAction)buttonNum2:(UIButton *)sender {
    if(([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]) && !showingResult){
        display = [display stringByAppendingString:@"2"];
    }
    else
        display = @"2";
    showingResult = NO;
    [self updateDisplay];
}

- (IBAction)buttonNum3:(UIButton *)sender {
    if(([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]) && !showingResult){
        display = [display stringByAppendingString:@"3"];
    }
    else
        display = @"3";
    showingResult = NO;
    [self updateDisplay];
}

- (IBAction)buttonNum4:(UIButton *)sender {
    if(([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]) && !showingResult){
        display = [display stringByAppendingString:@"4"];
    }
    else
        display = @"4";
    showingResult = NO;
    [self updateDisplay];
}

- (IBAction)buttonNum5:(UIButton *)sender {
    if(([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]) && !showingResult){
        display = [display stringByAppendingString:@"5"];
    }
    else
        display = @"5";
    showingResult = NO;
    [self updateDisplay];
}

- (IBAction)buttonNum6:(UIButton *)sender {
    if(([display doubleValue] != 0 || [display isEqualToString:@"-"]|| [display isEqualToString:@"0."]) && !showingResult){
        display = [display stringByAppendingString:@"6"];
    }
    else
        display = @"6";
    showingResult = NO;
    [self updateDisplay];
}

-(void) moveToStack {
    size++;
    NSDecimalNumber *num = [NSDecimalNumber decimalNumberWithString:display];   
    [stack addObject:num];
    display = @"";
    [self updateDisplay];
}

@end
