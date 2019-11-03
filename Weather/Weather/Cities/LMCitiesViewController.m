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
#import "NSNumber+LMNumber.h"
#import "UIImage+LMImage.h"

@interface LMCitiesViewController ()

@property LMWeatherData *weatherData;
@property UIRefreshControl *refreshControl;
@end

@implementation LMCitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init table view
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.contentInset = UIEdgeInsetsMake(UIApplication.sharedApplication.statusBarFrame.size.height,0,0,0);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.autoresizesSubviews = true;
    
     [self setTableReload:false];
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _weatherData     = [LMWeatherData sharedInstance];
    _woeidsArray     = _weatherData.woeids;

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
    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    return cell;
}


-(void) tableView:(UITableView *)tableView willDisplayCell:(LMCityTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // load data from array
    NSDictionary *dict = [self.woidsData objectAtIndexedSubscript:indexPath.row];
    NSString *temperature = [NSString stringWithFormat:@"%@", @"\u00B0"];
 
    NSString *cityNameStr = [NSString stringWithFormat: @"%@, %@", dict[@"title"], dict[@"parent"][@"title"]];
    
    NSString* maxTempStr = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][0][@"max_temp"]];
    NSString *maxTempRounded = [NSString stringWithFormat:@"max: %@ %@",  [NSNumber getRoundedNumber:[maxTempStr floatValue]], temperature];
    
    NSString* minTempStr = [NSString stringWithFormat:@"%@", dict[@"consolidated_weather"][0][@"min_temp"]];
    NSString *minTempRounded = [NSString stringWithFormat:@"min: %@ %@",  [NSNumber getRoundedNumber:[minTempStr floatValue]], temperature];
    
    NSString *weatherStateNameStr = [NSString stringWithFormat: @"%@", dict[@"consolidated_weather"][0][@"weather_state_name"]];

    NSString *weatherStateAbbrStr = [NSString stringWithFormat: @"%@", dict[@"consolidated_weather"][0][@"weather_state_abbr"]];

    //Get/set weather image
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.metaweather.com/static/img/weather/ico/%@.ico",weatherStateAbbrStr]];
    
    [_weatherData getDataTaskForUrl:url withCompletionBlock:^(NSData * _Nonnull data, NSError * _Nonnull completionBlockError) {
        if (!completionBlockError) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *img = [UIImage imageWithImage:[UIImage imageWithData: data] convertToSize:CGSizeMake(50, 50)];
                cell.icon.image = img;
                [cell.icon sizeToFit];
                
            });
            
        }else{
            NSLog(@"completionBlockError %@", completionBlockError.description);
        }

    }];
    
    cell.cityName.text = cityNameStr;
    cell.maxTemp.text = maxTempRounded;
    cell.minTemp.text = minTempRounded;
    cell.weatherStateName.text = weatherStateNameStr;

    
    [cell.cityName sizeToFit];
    [cell.maxTemp sizeToFit];
    [cell.minTemp sizeToFit];
    [cell.weatherStateName sizeToFit];
    
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
    if ([_weatherData isDataFetched]) {
        [self.tableView reloadData];
    } else {
        for (NSString *woeid in _woeidsArray) {
            
            [_weatherData fetchWoeidDataForWoeid:woeid withCompletionBlock:^(NSMutableDictionary *woeidsDict, NSError *completionBlockError) {
                if (!completionBlockError) {
                    
                    //Check if all data are fetched
                    
                    if ((int)[self->_weatherData woeidDatasArray].count == (int) self.weatherData.woeids.count ) {
                        
                        self.woidsData = [NSMutableArray arrayWithArray:[self->_weatherData woeidDatasArray]];
                    
                            dispatch_async(dispatch_get_main_queue(), ^{
                                
                                //set is data fetched property to true
                                [self.weatherData setIsDataFetched:true];
                                
                                if (self.tableReload) {
                                    //reload table
                                    [self.tableView reloadData];
        
                                    //set table reload to false
                                    [self setTableReload:false];
        
                                    //end refreshing
                                    [self.refreshControl endRefreshing];
                                    
                                } else {
                                    
                                    // add tableview
                                    [self.view addSubview:self->_tableView];
                                }
                                
                            });
                    }
                    
                }
                else
                {
                    NSLog(@"ERROR  %@ ", completionBlockError.description);
                    
                }
                
            }];
            
        }
    }
}
- (void) addRefreshControl {
    
    _refreshControl = [[UIRefreshControl alloc]init];
    [_refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = _refreshControl;
    } else {
        [self.tableView addSubview:_refreshControl];
    }
}
- (void)refreshTable {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [_weatherData setWoeidDatasArray:arr];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [_weatherData setWoeidsDict:dict];
    
    [self setTableReload:true];
    
    //set is data fetch to false
    [_weatherData setIsDataFetched:false];
    
    [self fetchData];
    
}

@end

