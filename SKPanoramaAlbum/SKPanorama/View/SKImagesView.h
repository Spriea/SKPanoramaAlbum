//
//  SKImagesView.h
//  DaoJiaLe
//
//  Created by Somer.King on 17/3/20.
//  Copyright © 2017年 Somer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKImagesView : UIView

@property (strong, nonatomic) void(^changeVRimage)(NSInteger row);

+ (instancetype)imagesView;

@property (strong, nonatomic) NSArray *images;

- (void)setImageV;

@end
