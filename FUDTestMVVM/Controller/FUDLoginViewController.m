//
//  FUDLoginViewController.m
//  FUDTestMVVM
//
//  Created by 兰福东 on 2019/1/22.
//  Copyright © 2019 fudo. All rights reserved.
//

#import "FUDLoginViewController.h"
#import "FUDLoginViewModel.h"
#import "FUDUser.h"

@interface FUDLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) FUDLoginViewModel *viewModel;

@end

@implementation FUDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[FUDLoginViewModel alloc] initWithUser:[[FUDUser alloc] init]];
    [self.viewModel addObserver:self forKeyPath:@"isLogin" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.usernameField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.passwordField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (IBAction)loginButtonTapped:(id)sender {
    [self.viewModel login];
}

- (void)textFieldChanged:(UITextField *)textField {
    if (textField == self.usernameField) {
        self.viewModel.user.name = textField.text;
    } else if (textField == self.passwordField) {
        self.viewModel.user.password = textField.text;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"isLogin"]) {
        if ([change[NSKeyValueChangeNewKey] boolValue]) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSLog(@"登录失败");
        }
    }
}

@end
