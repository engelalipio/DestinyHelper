//
//  ItemCollectionViewController.h
//  DestinyHelper
//
//  Created by Bertle on 3/23/21.
//  Copyright © 2021 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>


static NSString *CollectionViewCellIdentifier = @"CollectionViewCellIdentifier";

@interface ItemCollectionView : UICollectionView

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

 
