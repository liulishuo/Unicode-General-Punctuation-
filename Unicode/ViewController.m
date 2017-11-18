//
//  ViewController.m
//  Unicode
//
//  Created by liulishuo on 2017/11/17.
//  Copyright © 2017年 liulishuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSDictionary *dataDict;
@property (nonatomic, strong) NSMutableDictionary *reveDataDict;
@property (nonatomic, strong) NSArray *keyArray;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *resultArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self demo1];
    _dataDict = @{
                  @"En Quad":@"\U00002000",
                  @"Em Quad":@"\U00002001",
                  @"En Space":@"\U00002002",
                  @"Em Space":@"\U00002003",
                  @"Three-Per-Em Space":@"\U00002004",
                  @"Four-Per-Em Space":@"\U00002005",
                  @"Six-Per-Em Space":@"\U00002006",
                  @"Figure Space":@"\U00002007",
                  @"Punctuation Space":@"\U00002008",
                  @"Thin Space":@"\U00002009",
                  @"Hair Space":@"\U0000200a",
                  @"Zero Width Space":@"\U0000200b",
                  @"Zero Width Non-Joiner":@"\U0000200c",
                  @"Zero Width Joiner":@"\U0000200d",
                  @"Left-To-Right Mark":@"\U0000200e",
                  @"Right-To-Left Mark":@"\U0000200f",
                  @"Hyphen":@"\U00002010",
                  @"Non-Breaking Hyphen":@"\U00002011",
                  @"Figure Dash":@"\U00002012",
                  @"En Dash":@"\U00002013",
                  @"Em Dash":@"\U00002014",
                  @"Horizontal Bar":@"\U00002015",
                  @"Double Vertical Line":@"\U00002016",
                  @"Double Low Line":@"\U00002017",
                  @"Left Single Quotation Mark":@"\U00002018",
                  @"Right Single Quotation Mark":@"\U00002019",
                  @"Single Low-9 Quotation Mark":@"\U0000201a",
                  @"Single High-Reversed-9 Quotation Mark":@"\U0000201b",
                  @"Left Double Quotation Mark":@"\U0000201c",
                  @"Right Double Quotation Mark":@"\U0000201d",
                  @"Double Low-9 Quotation Mark":@"\U0000201e",
                  @"Double High-Reversed-9 Quotation Mark":@"\U0000201f",
                  @"Dagger":@"\U00002020",
                  @"Double Dagger":@"\U00002021",
                  @"Bullet":@"\U00002022",
                  @"Triangular Bullet":@"\U00002023",
                  @"One Dot Leader":@"\U00002024",
                  @"Two Dot Leader":@"\U00002025",
                  @"Horizontal Ellipsis":@"\U00002026",
                  @"Hyphenation Point":@"\U00002027",
                  @"Line Separator":@"\U00002028",
                  @"Paragraph Separator":@"\U00002029",
                  @"Left-To-Right Embedding":@"\U0000202a",
                  @"Right-To-Left Embedding":@"\U0000202b",
                  @"Pop Directional Formatting":@"\U0000202c",
                  @"Left-To-Right Override":@"\U0000202d",
                  @"Right-To-Left Override":@"\U0000202e",
                  @"Narrow No-Break Space":@"\U0000202f",
                  @"Per Mille Sign":@"\U00002030",
                  @"Per Ten Thousand Sign":@"\U00002031",
                  @"Prime":@"\U00002032",
                  @"Double Prime":@"\U00002033",
                  @"Triple Prime":@"\U00002034",
                  @"Reversed Prime":@"\U00002035",
                  @"Reversed Double Prime":@"\U00002036",
                  @"Reversed Triple Prime":@"\U00002037",
                  @"Caret":@"\U00002038",
                  @"Single Left-Pointing Angle Quotation Mark":@"\U00002039",
                  @"Single Right-Pointing Angle Quotation Mark":@"\U0000203a",
                  @"Reference Mark":@"\U0000203b",
                  @"Double Exclamation Mark":@"\U0000203c",
                  @"Interrobang":@"\U0000203d",
                  @"Overline":@"\U0000203e",
                  @"Undertie":@"\U0000203f",
                  @"Character Tie":@"\U00002040",
                  @"Caret Insertion Point":@"\U00002041",
                  @"Asterism":@"\U00002042",
                  @"Hyphen Bullet":@"\U00002043",
                  @"Fraction Slash":@"\U00002044",
                  @"Left Square Bracket With Quill":@"\U00002045",
                  @"Right Square Bracket With Quill":@"\U00002046",
                  @"Double Question Mark":@"\U00002047",
                  @"Question Exclamation Mark":@"\U00002048",
                  @"Exclamation Question Mark":@"\U00002049",
                  @"Tironian Sign Et":@"\U0000204a",
                  @"Reversed Pilcrow Sign":@"\U0000204b",
                  @"Black Leftwards Bullet":@"\U0000204c",
                  @"Black Rightwards Bullet":@"\U0000204d",
                  @"Low Asterisk":@"\U0000204e",
                  @"Reversed Semicolon":@"\U0000204f",
                  @"Close Up":@"\U00002050",
                  @"Two Asterisks Aligned Vertically":@"\U00002051",
                  @"Commercial Minus Sign":@"\U00002052",
                  @"Swung Dash":@"\U00002053",
                  @"Inverted Undertie":@"\U00002054",
                  @"Flower Punctuation Mark":@"\U00002055",
                  @"Three Dot Punctuation":@"\U00002056",
                  @"Quadruple Prime":@"\U00002057",
                  @"Four Dot Punctuation":@"\U00002058",
                  @"Five Dot Punctuation":@"\U00002059",
                  @"Two Dot Punctuation":@"\U0000205a",
                  @"Four Dot Mark":@"\U0000205b",
                  @"Dotted Cross":@"\U0000205c",
                  @"Tricolon":@"\U0000205d",
                  @"Vertical Four Dots":@"\U0000205e",
                  @"Medium Mathematical Space":@"\U0000205f",
                  @"Word Joiner":@"\U00002060",
                  @"Function Application":@"\U00002061",
                  @"Invisible Times":@"\U00002062",
                  @"Invisible Separator":@"\U00002063",
                  @"Invisible Plus":@"\U00002064",
                  @"Left-To-Right Isolate":@"\U00002066",
                  @"Right-To-Left Isolate":@"\U00002067",
                  @"First Strong Isolate":@"\U00002068",
                  @"Pop Directional Isolate":@"\U00002069",
                  @"Inhibit Symmetric Swapping":@"\U0000206a",
                  @"Activate Symmetric Swapping":@"\U0000206b",
                  @"Inhibit Arabic Form Shaping":@"\U0000206c",
                  @"Activate Arabic Form Shaping":@"\U0000206d",
                  @"National Digit Shapes":@"\U0000206e",
                  @"Nominal Digit Shapes":@"\U0000206f",
                  };
    _keyArray = _dataDict.allKeys;
    
    _reveDataDict = [[NSMutableDictionary alloc] init];
    //数据源字典key、value反转
    [_dataDict enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *objString = [self ignoreEscapeSymbols:obj];
        _reveDataDict[objString] = key;
    }];
    _resultArray = [NSMutableArray new];
    
    // 创建UISearchController, 这里使用当前控制器来展示结果
    UISearchController *search = [[UISearchController alloc] initWithSearchResultsController:nil];
    // 设置结果更新代理
    search.searchResultsUpdater = self;
    // 因为在当前控制器展示结果, 所以不需要这个透明视图
    search.dimsBackgroundDuringPresentation = NO;
    // 是否自动隐藏导航
    //    search.hidesNavigationBarDuringPresentation = NO;
    self.searchController = search;
    // 将searchBar赋值给tableView的tableHeaderView
    self.tableView.tableHeaderView = search.searchBar;
    
    search.searchBar.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Response
#pragma mark - Network
#pragma mark - Delegate
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 这里通过searchController的active属性来区分展示数据源是哪个
    if (self.searchController.active) {
        return self.resultArray.count ;
    }
    return _keyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xxx"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"xxx"];
    }
    NSString *key = nil;
    if (self.searchController.active ) {
        key = _resultArray[indexPath.row];
        
    } else {
        key = _keyArray[indexPath.row];
    }
    NSString *title = [NSString stringWithFormat:@"%ld+%@-%@",indexPath.row,_dataDict[key],@"字符集"];
    cell.textLabel.text = title;
    cell.detailTextLabel.text = key;
    return cell;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *inputStr = searchController.searchBar.text ;
    [self.resultArray removeAllObjects];
    
    for (NSString *str in _reveDataDict.allKeys) {
        if ([str.lowercaseString rangeOfString:inputStr.lowercaseString].location != NSNotFound) {
            NSString *key = _reveDataDict[str];
            [self.resultArray addObject:key];
        }
    }
    
    [self.tableView reloadData];
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
}
#pragma mark - Methods
- (NSString *)ignoreEscapeSymbols:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSUnicodeStringEncoding];
    NSString *resultString = @"";
    for (NSUInteger i = data.length - 1; i > 1; i--) {
        NSData *subData = [data subdataWithRange:NSMakeRange(i, 1)];
        int n = 0;
        [subData getBytes:&n length:1];
        NSString *numString = [NSString stringWithFormat:@"%02x",n];
        resultString = [resultString stringByAppendingString:numString];
    }
    
    return resultString;
}

//- (void)demo1 {
//    NSString *userName = @"果壳网";
//    NSString *msg = @"撤回了一条消息";
//    NSString *result = [NSString stringWithFormat:@"%@%@%@",userName,@"\U0000202d",msg];
//    NSLog(@"%@",result);
//
//    userName = [NSString stringWithFormat:@"%@%@%@",userName,@"\U0000202e",@"手短小只一了扔你向并"];
//    result = [NSString stringWithFormat:@"%@%@%@",userName,@"\U0000202d",msg];
//    NSLog(@"%@",result);
//}
#pragma mark - Navigation
#pragma mark - Setter and Getter

@end
