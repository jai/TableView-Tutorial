//
//  JGFirstViewController.m
//  TableView
//
//  Created by Jai Govindani on 5/29/14.
//  Copyright (c) 2014 Jai Govindani. All rights reserved.
//

#import "JGFirstViewController.h"
#import <Masonry/Masonry.h>

@interface JGFirstViewController ()

@end

@implementation JGFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.tableView.superview.mas_top);
        make.width.equalTo(self.tableView.superview.mas_width);
//        make.bottom.equalTo(self.tableView.superview.mas_bottom);
//        make.bottom.equalTo(self.tabBarController.tabBar.mas_top);
//        make.bottom.equalTo(self.tableView.superview.mas_bottom).with.offset(-1*self.tabBarController.tabBar.frame.size.height);
        make.height.equalTo(self.tableView.superview.mas_height).with.offset(-1*self.tabBarController.tabBar.frame.size.height);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"RegularCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSString *cellText = [NSString stringWithFormat:@"Row Number: %d", indexPath.row];
    
    [[cell textLabel] setText:cellText];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Cell Selected!", @"Alert view title for when cell is selected")
                                                        message:[NSString stringWithFormat:NSLocalizedString(@"You selected cell # %d", @"Message when user selects a particular cell"), indexPath.row]
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"Cancel", nil)
                                              otherButtonTitles:nil, nil];
    [alertView show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
