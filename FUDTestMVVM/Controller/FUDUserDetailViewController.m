//
//  FUDUserDetailViewController.m
//  FUDTestMVVM
//
//  Created by 兰福东 on 2019/1/23.
//  Copyright © 2019 fudo. All rights reserved.
//

#import "FUDUserDetailViewController.h"
#import "FUDUserViewModel.h"

@interface FUDUserDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;

@end

@implementation FUDUserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = [self.viewModel userName];
    self.sexLabel.text = [self.viewModel sexString];
    self.birthdayLabel.text = [self.viewModel birthday];
    
    [self.viewModel downloadThumbnailCompletion:^(UIImage * _Nonnull image) {
        if (image) {
            self.imageView.image = image;
        }
    }];
}

@end
