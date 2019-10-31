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
@end

@implementation LMCitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init table view
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.contentInset = UIEdgeInsetsMake(44,0,0,0);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _weatherData     = [LMWeatherData sharedInstance];
    _woeidsArray     = _weatherData.woeids;
 
    for (NSString *woeid in _woeidsArray) {
        
        [_weatherData fetchWoeidDataForWoeid:woeid withCompletionBlock:^(NSMutableDictionary *woeidsDict, NSError *completionBlockError) {
            if (!completionBlockError) {
                
                //Check if all data are fetched
                if ((int)[self->_weatherData woeidDatasArray].count == (int) self->_woeidsArray.count ) {
                    
                    self->_woidsData = [NSMutableArray arrayWithArray:[self->_weatherData woeidDatasArray]];

                    dispatch_async(dispatch_get_main_queue(), ^{
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
    static NSString *cellIdentifier = @"CityCell";
    
    LMCityTableViewCell *cell = (LMCityTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[LMCityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
  //  NSString *name = dict [@"title"];
    NSDictionary *dict = [_woidsData objectAtIndex:indexPath.row];
    NSLog(@"DICT_LM  %@ ", dict);

    cell.cityName.text = dict[@"title"];;
    return cell;
}

#pragma mark - UITableViewDelegate
// user tap the row
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %li row", (long)indexPath.row);
}

@end
