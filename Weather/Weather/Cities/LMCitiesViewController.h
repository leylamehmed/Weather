//
//  LMCitiesViewController.h
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMCitiesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *woeidsArray;
@property (strong, nonatomic) NSMutableArray *woidsData;
@property (strong, nonatomic) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
