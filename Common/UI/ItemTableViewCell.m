//
//  ItemCollectionViewController.m
//  DestinyHelper
//
//  Created by Bertle on 3/23/21.
//  Copyright © 2021 Agile Mobile Solutions. All rights reserved.
//

#import "ItemTableViewCell.h"
#import "ItemCollectionView.h"
#import "Utilities.h"
#import "Constants.h"
#import "AppDelegate.h"

@implementation ItemTableViewCell

- (IBAction)lockStateAction:(id)sender{
    
}

- (IBAction)sendVaultAction:(id)sender{
    
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(5,5, 5, 5);
    layout.itemSize = CGSizeMake(80, 80);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[ItemCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    [self.collectionView setBackgroundColor:[UIColor blackColor]];
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
   
    [self.contentView addSubview:self.collectionView];
    
     
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
     
    [self.collectionView setFrame:self.contentView.bounds];
 
}

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource,
                                             UICollectionViewDelegate>)dataSourceDelegate
                                  indexPath:(NSIndexPath *)indexPath{
    
    [self.collectionView setDataSource:dataSourceDelegate];
    [self.collectionView setDelegate: dataSourceDelegate];
    
    [self.collectionView setIndexPath:indexPath];
    
 
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    
    if (! [self.collectionView hasUncommittedUpdates]){
        [self.collectionView reloadData];
    }
}

@end
