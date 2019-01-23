//
//  FUDMainViewController.m
//  FUDTestMVVM
//
//  Created by 兰福东 on 2019/1/22.
//  Copyright © 2019 fudo. All rights reserved.
//

#import "FUDMainViewController.h"
#import "FUDLoginViewController.h"
#import "FUDUserDetailViewController.h"
#import "FUDUserViewModel.h"

@interface FUDMainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray<FUDUserViewModel *> *viewModels;

@end

@implementation FUDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FUDLoginViewController *loginVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"FUDLoginViewController"];
    [self.navigationController presentViewController:loginVC animated:YES completion:nil];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.viewModels = [FUDUserViewModel viewModels];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FUDUserViewModel *viewModel = self.viewModels[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = viewModel.userName;
    cell.detailTextLabel.text = viewModel.introduction;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FUDUserDetailViewController *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FUDUserDetailViewController"];
    detailVC.viewModel = self.viewModels[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
