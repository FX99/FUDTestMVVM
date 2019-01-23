//
//  FUDUserDetailViewController.h
//  FUDTestMVVM
//
//  Created by 兰福东 on 2019/1/23.
//  Copyright © 2019 fudo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FUDUserViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface FUDUserDetailViewController : UIViewController

@property (nonatomic, strong) FUDUserViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
