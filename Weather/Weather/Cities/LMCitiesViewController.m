//
//  LMCitiesViewController.m
//  Weather
//
//  Created by LeyLa Mehmed on 28.10.19.
//  Copyright © 2019 LM. All rights reserved.
//

#import "LMCitiesViewController.h"
#import "LMCityTableViewCell.h"

@interface LMCitiesViewController ()
{
    UITableView *tableView;
    NSArray *arr;
}

@end

@implementation LMCitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init table view
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.contentInset = UIEdgeInsetsMake(44,0,0,0);

    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    tableView.delegate = self;
    tableView.dataSource = self;
    
    //  tableView.backgroundColor = [UIColor cyanColor];
    arr=[[NSArray alloc]initWithObjects:@"ABC",@"XYZ", nil];

    // add to canvas
    [self.view addSubview:tableView];
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
    return arr.count;

}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CityCell";
    
    LMCityTableViewCell *cell = (LMCityTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[LMCityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.descriptionLabel.text = [arr objectAtIndex:indexPath.row];

    return cell;
}

#pragma mark - UITableViewDelegate
// user tap the row
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %li row", (long)indexPath.row);
}

@end

    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor blueColor];
//    _citiesTable.backgroundColor = [UIColor blueColor];
//
//
//    names = [[NSArray alloc]initWithObjects:@"Sofia",@"New York",@"Tokyo",
//            nil];
//    images = [[NSArray
//               alloc]initWithObjects:@"mobilestitle.jpg",@"costumetitle.jpeg",
//              @"shoestitle.png",nil];
    
    
//
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//#pragma mark - UITableView
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
//(NSInteger)section
//{
//    return 3;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView
//         cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//
//    static NSString *cellId = @"tableview";
//
//    LMCityTableViewCell  *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
//
//
//    cell.cellTxt .text = [name objectAtIndex:indexPath.row];
//
//    cell.cellImg.image = [UIImage imageNamed:[images
//                                              objectAtIndex:indexPath.row]];
//
//    return cell;
//
//
//
//}
//
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
//(NSIndexPath *)indexPath
//{
//    selectindex = indexPath.row;
//    [self performSegueWithIdentifier:@"second" sender:self];
//}
//
//
//
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//  //  if ([segue.identifier isEqualToString:@"second"])
//
////    {
////        CollectionViewController *obj = segue.destinationViewController;
////        obj.receivename = [name objectAtIndex:selectindex];
////
////    }
////
//
//
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//
//}
//
////- (void)viewDidLoad
////{
////    [super viewDidLoad];
////    // init table view
//// UITableView*   tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
////
////    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
////    tableView.delegate = self;
////    tableView.dataSource = self;
////
////    tableView.backgroundColor = [UIColor cyanColor];
////
////    // add to canvas
////    [self.view addSubview:tableView];
////}
////
////#pragma mark - UITableViewDataSource
////// number of section(s), now I assume there is only 1 section
////- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
////{
////    return 1;
////}
////
////// number of row in the section, I assume there is only 1 row
////- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
////{
////    return 1;
////}
////
////// the cell will be returned to the tableView
////- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
////{
////    static NSString *cellIdentifier = @"HistoryCell";
////
////    // Similar to UITableViewCell, but
////    JSCustomCell *cell = (JSCustomCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
////    if (cell == nil) {
////        cell = [[JSCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
////    }
////    // Just want to test, so I hardcode the data
////    cell.descriptionLabel.text = @"Testing";
////
////    return cell;
////}
////
////#pragma mark - UITableViewDelegate
////// when user tap the row, what action you want to perform
////- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
////{
////    NSLog(@"selected %d row", indexPath.row);
////}


