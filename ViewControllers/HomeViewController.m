//
//  ViewController.m
//  DestinyHelper
//
//  Created by Bertle on 9/28/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "Utilities.h"

@interface HomeViewController ()
{
    BOOL isFirstLaunch,
         useTableView,
         isLoggedIn;
    
    NSString *currentImageName;
    NSArray  *backgroundImages;
    
    CGSize   imageSize;
    
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

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self refreshUI];
    
    [self startTimer];
}

-(void) refreshUI{
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    
    if (appDelegate != nil){
        
        if ([appDelegate currentAccessToken]){
            self->isLoggedIn = YES;
         }
        
        [self.btnLogin setHidden:isLoggedIn];
        [self.btnInventory setHidden:!isLoggedIn];
        [self.btnGuardians setHidden:!isLoggedIn];
    }
    
}

- (void) viewDidDisappear:(BOOL)animated{
    
    [self endTimer];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self->isFirstLaunch = YES;
    self->useTableView = NO;
    self->isLoggedIn = NO;
    
    appDelegate = [AppDelegate currentDelegate];
    
    [self setupImages];
    
    if (useTableView){
      [self initTableView];
    }
    
    
    if (! isLoggedIn){
        //show login view controller
       // [self performSegueWithIdentifier:@"segLogin" sender:self];
    }

}

/*
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    LoginViewController *loginVC = nil;
    @try {
        
        if (segue.destinationViewController != nil){
        
            if ([segue.destinationViewController isKindOfClass:[LoginViewController class]]){
                loginVC = (LoginViewController*) segue.destinationViewController;
                if (loginVC){
                
                }
            }
        }
        
    } @catch (NSException *exception) {
        NSLog(exception.description);
    } @finally {
        loginVC = nil;
    }
}
 */

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSInteger size = 200;
     
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
   // return CGFLOAT_MIN;
    NSInteger size = 1.0f;//90;

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
            self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 100.0,self.view.frame.size.width, self.view.frame.size.height/3)];
            
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

- (IBAction)GroupAction:(UIButton *)sender {
    [self endTimer];
}

- (IBAction)guardiansAction:(UIButton *)sender {
    [self endTimer];
}

- (IBAction)loginAction:(UIButton *)sender {
    
    NSLog(@"HomeViewController:loginAction:Invoked...");
    
    [self endTimer];
}

-(void) endTimer{
    if (self.timer != nil){
        [self.timer invalidate];
    }
    NSLog(@"HomeView Timer Stopped");
    self.timer = nil;
}

-(void) startTimer{
    
    return;

    double interval = [appDelegate interval];
       
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                              interval:interval target:self
                                              selector:@selector(timerFireMethod:)
                                              userInfo:nil
                                               repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
    
        [self.loop addTimer:self.timer forMode:NSDefaultRunLoopMode];
 
    
}


- (void)timerFireMethod:(NSTimer *)t{
    
    NSString *newImageName    = @"",
             *message         = @"",
             *title           = @"";
    
    UIImage  *image           = nil;
    
    NSInteger randomImage     = -1;
    
    @try {
        
           message = @"HomeViewController:timerFireMethod:Image Change:%@->%@";
        
            randomImage = arc4random_uniform(backgroundImages.count);
        
            newImageName = [backgroundImages objectAtIndex:randomImage];
        
             
        if (! [newImageName isEqualToString:currentImageName]){
            
          //  NSLog(message,currentImageName,newImageName);
            
            image =  [UIImage imageNamed:newImageName];
            
            title = newImageName;
            
            title = [title stringByReplacingOccurrencesOfString:@"1.jpg" withString:@""];
            
            title = [title stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
            
            title = [title stringByReplacingOccurrencesOfString:@".png" withString:@""];
           
             
            if (image != nil){
                image =   [Utilities imageResize:image andResizeTo:imageSize];
                
                [_imgBackView setImage:image];
                [_lblTitle setText:title];
                currentImageName = newImageName;
            }
           
            
        }else{
              message = @"HomeViewController:timerFireMethod:Same Image:%@->%@";
              //NSLog(message,currentImageName,newImageName);
        }
            
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        newImageName = @"";
        randomImage = 0;
        
    }
    
    
}

 

-(void) setupImages{
    
    UIImage *img = nil;
    
    NSString *title = @"";
    
    @try {
        
        currentImageName = @"Icons.png";
        
        if (! backgroundImages){
            
        backgroundImages = [[NSArray alloc] initWithObjects:@"Venus.jpg",@"Dreadnaught1.jpg",
                                            @"Vex.jpg", @"Ship.jpg",@"Haaken.jpg", @"Mars.jpg", @"GuardianLootHall.jpg",
                                            @"City.jpg", @"ExoGuardian.jpg", @"Cabal.jpg",@"Ketch.jpg", @"MercurySun.jpg",
                                            @"Mercury.jpg", @"Loot.jpg", @"Dreadnaught.jpg", nil];
        
        NSLog(@"HomeViewController:setupImages:backgroundImages-> %lu",(unsigned long)backgroundImages.count);
            
        
        }
         
        if(isFirstLaunch){
            img =  [UIImage imageNamed:currentImageName];
            
            title = currentImageName;
            
            title = [title stringByReplacingOccurrencesOfString:@"1.jpg" withString:@""];
            
            title = [title stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
            
            title = [title stringByReplacingOccurrencesOfString:@".png" withString:@""];
            
            imageSize = img.size;
           
            if (img != nil){
                [_imgBackView setImage:img];
                [_lblTitle setText:title];
            }
            
            self->isFirstLaunch = NO;
            
            if (! useTableView){
             [self startTimer];
            }
        }
        
    } @catch (NSException *exception) {
        NSLog(@"HomeViewController:setupImages:Exception-> %@",exception.description);
    } @finally {
        img = nil;
    }
}



-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
    NSString *sourceVCTitle = segue.sourceViewController.title;
    
    NSLog(@"HomeViewController:prepareForUnwind:Invoked:For:%@",sourceVCTitle);
    
    if ([sourceVCTitle isEqualToString:@"Login"]){
        //Refresh UI
        [self refreshUI];
    }
    
}

@end
