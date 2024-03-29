//
//  LMCitiesViewController.h
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMMainViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMCitiesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *woeidsArray;
@property (strong, nonatomic) NSMutableArray *woidsData;
@property (strong, nonatomic) UITableView *tableView;
@property BOOL tableReload;

-(void) setNavigationBar;
- (BOOL)connected;

@end

NS_ASSUME_NONNULL_END
