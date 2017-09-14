//
//  ViewController.m
//  collection
//
//  Created by 彭盛凇 on 2017/9/14.
//  Copyright © 2017年 huangbaoche. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataList = [@[@"啦啦啦啦啦啦", @"啦啦啦啦啦啦", @"啦啦啦啦啦啦", @"啦啦啦啦啦啦", @"啦啦啦啦啦啦", @"啦啦啦啦啦啦", @"啦啦啦啦啦啦"] mutableCopy];
    
    self.collectionView.frame = CGRectMake(0, 100, self.view.frame.size.width, 60);
    
    [self.view addSubview:self.collectionView];
    
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.prefetchDataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        _collectionView.pagingEnabled = YES;
        
    }
    return _collectionView;
}

/*
 @property (nonatomic) CGFloat minimumLineSpacing;
 @property (nonatomic) CGFloat minimumInteritemSpacing;
 @property (nonatomic) CGSize itemSize;
 @property (nonatomic) CGSize estimatedItemSize NS_AVAILABLE_IOS(8_0); // defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:
 @property (nonatomic) UICollectionViewScrollDirection scrollDirection; // default is UICollectionViewScrollDirectionVertical
 @property (nonatomic) CGSize headerReferenceSize;
 @property (nonatomic) CGSize footerReferenceSize;
 @property (nonatomic) UIEdgeInsets sectionInset;
 
 // Set these properties to YES to get headers that pin to the top of the screen and footers that pin to the bottom while scrolling (similar to UITableView).
 @property (nonatomic) BOOL sectionHeadersPinToVisibleBounds NS_AVAILABLE_IOS(9_0);
 @property (nonatomic) BOOL sectionFootersPinToVisibleBounds NS_AVAILABLE_IOS(9_0);
 */

/*
 typedef NS_ENUM(NSInteger, UICollectionViewScrollDirection) {
 UICollectionViewScrollDirectionVertical,
 UICollectionViewScrollDirectionHorizontal
 };
 */

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = CGSizeMake(self.view.frame.size.width / 3, 60);
        _layout.minimumLineSpacing = 10;//纵
        _layout.minimumInteritemSpacing = 0;//横
        _layout.headerReferenceSize = CGSizeMake(10, 100);
        _layout.footerReferenceSize = CGSizeMake(10, 100);
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _layout;
}

#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];

    NSString *title = [self.dataList objectAtIndex:indexPath.row];
    
    UILabel *label = [[UILabel alloc] init];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.backgroundColor = [UIColor redColor];
    
    label.text = title;
    
    cell.backgroundView = label;
    
    return cell;
}

#pragma mark -- UICollectionViewDataSourcePrefetching

- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths NS_AVAILABLE_IOS(10_0) {
    
}

#pragma mark -- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    UILabel *label = (UILabel *)cell.backgroundView;
    
    return CGSizeMake(100, 100);
}

#pragma mark -- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
}


@end
