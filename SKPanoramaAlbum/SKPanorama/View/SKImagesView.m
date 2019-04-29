//
//  SKImagesView.m
//  DaoJiaLe
//
//  Created by Somer.King on 17/3/20.
//  Copyright © 2017年 Somer. All rights reserved.
//

#import "SKImagesView.h"
#import "SKVRAblumCell.h"
#define kMargin 15 // 默认边距
#define kVRImagesHeight 60
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface SKImagesView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) SKVRAblumCell *preCell;

@property (assign, nonatomic) NSInteger count;

@end

static NSString *const CollectionID = @"vr_imageCell";
@implementation SKImagesView

- (void)setImages:(NSArray *)images{
    _images = images;
    [self setImageV];
}

+ (instancetype)imagesView{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)setImageV{
    self.count = self.images.count;
    [self setupPictureView];
}

- (void)setupPictureView{
    // 创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat magin = 8;
    layout.minimumLineSpacing = kMargin - 8;
//    layout.minimumInteritemSpacing = kMargin - 5;
    layout.sectionInset = UIEdgeInsetsMake(magin, magin, magin, magin);
    
    // 宽高
    CGFloat itemW = kVRImagesHeight;
    CGFloat itemH = kVRImagesHeight;
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 创建UICollectionView
    CGFloat contentW = self.count * kVRImagesHeight + (self.count - 1) * (kMargin - 8) + 2 * magin;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kMargin-5, contentW > kScreenW ? kScreenW : contentW, itemH) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];

    [self insertSubview:collectionView atIndex:0];
    _collectionView = collectionView;
    
    collectionView.bounces = YES;
    collectionView.showsHorizontalScrollIndicator = NO;
    
    // 设置数据源
    collectionView.dataSource = self;
    // 设置代理;监听滚动完成
    collectionView.delegate = self;
    // 注册cell
    [collectionView registerNib:[UINib nibWithNibName:@"SKVRAblumCell" bundle:nil] forCellWithReuseIdentifier:CollectionID];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self collectionView:_collectionView didSelectItemAtIndexPath:indexPath];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.count;
}

// 什么时候调用:有新的cell出现的时候才会调用
// 作用:返回指定indexPath的cell外观
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SKVRAblumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionID forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        if (_preCell == nil) {
            cell.sk_selected = YES;
            _preCell = cell;
//            self.changeVRimage(0);
        }
    }
    cell.pItem = self.images[indexPath.item];
    cell.contentView.backgroundColor = [UIColor greenColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SKVRAblumCell *cell = (SKVRAblumCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [self selectedCell:cell];
    
    if (self.changeVRimage) {
        self.changeVRimage(indexPath.row);
    }
    
}

- (void)selectedCell:(SKVRAblumCell *)cell{
    self.preCell.sk_selected = NO;
    cell.sk_selected = YES;
    self.preCell = cell;
}

#pragma mark - 懒加载
- (SKVRAblumCell *)preCell{
    if (!_preCell) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        _preCell = (SKVRAblumCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    }
    return _preCell;
}
@end
