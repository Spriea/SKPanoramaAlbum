//
//  SKVRAblumCell.h
//  DaoJiaLe
//
//  Created by Somer.King on 17/3/24.
//  Copyright © 2017年 Somer. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SKPanoramaItem;

@interface SKVRAblumCell : UICollectionViewCell

@property (assign, nonatomic) BOOL sk_selected;

@property (strong, nonatomic) SKPanoramaItem *pItem;

@end
