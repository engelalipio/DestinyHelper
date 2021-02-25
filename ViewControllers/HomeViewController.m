//
//  ViewController.m
//  DestinyHelper
//
//  Created by Bertle on 9/28/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
{
    BOOL isFirstLaunch;
    
    NSString *currentImageName;
    NSArray  *backgroundImages;
    
    AppDelegate *appDelegate;
}


@end

@implementation HomeViewController

@synthesize imgBackView = _imgBackView;
@synthesize stackView = _stackView;

#pragma mark - TableView Events


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *selectedTitle = @"";
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(selectedCell){
        selectedTitle = selectedCell.textLabel.text;
        
        [self setTitle:selectedTitle];
    }
    
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    NSString *message = @"",
             *imageName = @"";
    
    UIImage *image = nil;
    @try {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
        
        if (! cell){
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imgCell"];
        }
        
        imageName = [backgroundImages objectAtIndex:indexPath.row];
        
        [cell.textLabel setText:imageName];
        if (imageName){
            image = [UIImage imageNamed:imageName];
            [cell.imageView setImage:image];
            
        }
        
        
    } @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger iRows = 0;
    
    if (backgroundImages){
        iRows = backgroundImages.count;
    }
    
    return iRows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (void) viewDidDisappear:(BOOL)animated{
    
    [self endTimer];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isFirstLaunch = YES;
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    
    
    [self setupImages];
    [self initTableView];

}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSInteger size = 200;
     
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
   // return CGFLOAT_MIN;
    NSInteger size =1.0f;//90;

    
  
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSInteger size = 1.0f;//90;
    
    return size;
}

-(void) initTableView{
    
    NSString *message = nil;
    @try {
        
        if (! self.tableView){
            self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 100.0,self.view.frame.size.width, self.view.frame.size.height)];
            
            [self.view addSubview:self.tableView];
        }
        
        [self.tableView setDelegate:self];
        [self.tableView setDataSource:self];
      }
        @catch (NSException *exception) {
            message = [exception description];
        }
        @finally {
            
            if ([message length] > 0){
                NSLog(@"%@",message);
            }
           
            message =  @"";
            
        }
    
}

-(void) endTimer{
    if (self.timer != nil){
        [self.timer invalidate];
    }
    NSLog(@"HomeView Timer Stopped");
    self.timer = nil;
}

-(void) startTimer{
    

    double interval = [appDelegate interval];
    
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                              interval:interval target:self
                                              selector:@selector(timerFireMethod:)
                                              userInfo:nil
                                               repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
    
        [self.loop addTimer:self.timer forMode:NSDefaultRunLoopMode];
 
    
}

 

-(void) setupImages{
    
    UIImage *img = nil;
    
    @try {
        
        if (! backgroundImages){
        backgroundImages = [[NSArray alloc] initWithObjects:@"Venus.jpg",@"Dreadnaught1.jpg",
                                            @"Vex.jpg", @"Ship.jpg",@"Haaken.jpg", @"Mars.jpg", @"GuardianLootHall.jpg",
                                            @"City.jpg", @"ExoGuardian.jpg", @"Cabal.jpg",@"Ketch.jpg", @"MercurySun.jpg",
                                            @"Mercury.jpg", @"Loot.jpg", @"Dreadnaught.jpg", nil];
        }
         
        if(isFirstLaunch){
            
             
            currentImageName = @"DefaultEmblem.png";
            
            img =  [UIImage imageNamed:currentImageName];
            
            if (img != nil){
               
            //    [_imgBackView setImage:img];
            }
            
            isFirstLaunch = NO;
            
           // [self startTimer];
        }
        
    } @catch (NSException *exception) {
       // NSLog(exception.description);
    } @finally {
        img = nil;
    }
}

- (void)timerFireMethod:(NSTimer *)t{
    
    NSString *message         = @"";
    UIImage  *image           = nil;
    
    NSInteger randomImage     = -1;
    
    @try {
        
            
            randomImage = arc4random_uniform(backgroundImages.count);
           
            currentImageName = [backgroundImages objectAtIndex:randomImage];
            
            image =  [UIImage imageNamed:currentImageName];
             
            if (image != nil){
                [_imgBackView setImage:image];
            }
            
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
       
        randomImage = 0;
        
    }
    
    
}

@end
