//
//  SKVRAblumCell.m
//  DaoJiaLe
//
//  Created by Somer.King on 17/3/24.
//  Copyright © 2017年 Somer. All rights reserved.
//

#import "SKVRAblumCell.h"
#import "SKPanoramaItem.h"

@interface SKVRAblumCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UIImageView *chose_icon;
@property (weak, nonatomic) IBOutlet UIImageView *imageName;

@property (weak, nonatomic) IBOutlet UIImageView *contentImage;

@end

@implementation SKVRAblumCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor clearColor].CGColor;
}

- (void)setPItem:(SKPanoramaItem *)pItem{
    _pItem = pItem;
    self.titleName.text = pItem.name;
//    self.imageName.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",pItem.name]];
    self.imageName.backgroundColor = [UIColor lightGrayColor];
}

- (void)setSk_selected:(BOOL)sk_selected{
    _sk_selected = sk_selected;
    if (sk_selected) {
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.chose_icon.hidden = NO;
        self.userInteractionEnabled = NO;
    }else{
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.chose_icon.hidden = YES;
        self.userInteractionEnabled = YES;
    }
}

@end
