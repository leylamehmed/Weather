//
//  LMCitiesViewController.m
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMCitiesViewController.h"
#import "LMCityTableViewCell.h"
#import "LMWeatherData.h"
#import "LMWeather.h"

@interface LMCitiesViewController ()

@property LMWeatherData *weatherData;
@property UIRefreshControl *refreshControl;
@end

@implementation LMCitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init table view
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.contentInset = UIEdgeInsetsMake(0,0,0,0);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    _weatherData     = [LMWeatherData sharedInstance];
    _woeidsArray     = _weatherData.woeids;
    _tableView.translatesAutoresizingMaskIntoConstraints = false;

    [self addRefreshControl];
    [self fetchData];
 
}

#pragma mark - UITableViewDataSource
// number of section(s)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;

}

// number of row in the section
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [_weatherData woeidDatasArray].count;

}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cityCell";
    
    LMCityTableViewCell *cell = (LMCityTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        [_tableView registerNib:[UINib nibWithNibName:@"LMCustomCityCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
        cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    
    cell.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    return cell;
}


-(void) tableView:(UITableView *)tableView willDisplayCell:(LMCityTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // load data from array
    NSDictionary *dict = [_woidsData objectAtIndex:indexPath.row];

    cell.cityName.text = dict[@"title"];
    [cell.cityName sizeToFit];

}

#pragma mark - UITableViewDelegate
// user tap the row
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %li row", (long)indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void) fetchData {
    //check isDataLoaded
//    if ([_weatherData isDataFetched]) {
//        NSLog(@"LMDEBUG isDataFetched 1 -- %@ --", [_weatherData isDataFetched] ? @"Yes" : @"No");
//        [self.view addSubview:_tableView];
//    } else {
        for (NSString *woeid in _woeidsArray) {
            
            [_weatherData fetchWoeidDataForWoeid:woeid withCompletionBlock:^(NSMutableDictionary *woeidsDict, NSError *completionBlockError) {
                if (!completionBlockError) {
                    
                    //Check if all data are fetched
                    if ((int)[self->_weatherData woeidDatasArray].count == (int) self->_woeidsArray.count ) {
                        
                        self.woidsData = [NSMutableArray arrayWithArray:[self->_weatherData woeidDatasArray]];
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            //set is data fetched property to true
                            [self.weatherData setIsDataFetched:true];
                            NSLog(@"LMDEBUG isDataFetched 2 -- %@ --", [self.weatherData isDataFetched] ? @"Yes" : @"No");
                            
                            // add tableview
                            [self.view addSubview:self->_tableView];
                        });
                    }
                    
                }
                else
                {
                    NSLog(@"ERROR  %@ ", completionBlockError.description);
                    
                }
                
            }];
            
        }
  //  }
}
- (void) addRefreshControl {
    
    _refreshControl = [[UIRefreshControl alloc]init];
    [_refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    NSLog(@"LMDEBUG addRefreshControl " );
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = _refreshControl;
    } else {
        [self.tableView addSubview:_refreshControl];
    }
}
- (void)refreshTable {
    NSLog(@"LMDEBUG refreshTable " );

    //set is data fetch to false
    [_weatherData setIsDataFetched:false];
    
    [self fetchData];
    
    //end refreshing
    [_refreshControl endRefreshing];

}
@end

