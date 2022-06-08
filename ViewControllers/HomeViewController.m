//
//  ViewController.m
//  DestinyHelper
//
//  Created by Bertle on 9/28/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "GuardianViewController.h"
#import "Utilities.h"
#import "Constants.h"

@interface HomeViewController ()
{
    BOOL isFirstLaunch,
         useTableView,
         isLoggedIn,
         spewDebug;
    
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
            if (self->spewDebug){
                NSLog(@"%@",message);
            }
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
        
        //[self.btnLogin setHidden:isLoggedIn];
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
    self->spewDebug  = NO;
    
    appDelegate = [AppDelegate currentDelegate];
    
    [self setupButtons];
    [self setupImages];
    
    
    if (useTableView){
      [self initTableView];
    }
    
    
    if (! isLoggedIn){
        //show login view controller
       // [self performSegueWithIdentifier:@"segLogin" sender:self];
    }

}

-(void) setupButtons{
    
    
    [self.btnGuardians.layer setMasksToBounds:YES];
    [self.btnGuardians.layer  setCornerRadius:5];
    
    [self.btnGuardians setFont:[UIFont fontWithName:kDefaultFontName
                                              size:self.btnGuardians.font.pointSize]];
 
    [self.btnInventory.layer setMasksToBounds:YES];
    [self.btnInventory.layer  setCornerRadius:5];
    [self.btnInventory setFont:[UIFont fontWithName:kDefaultFontName
                                              size:self.btnInventory.font.pointSize]];
    
    [self.btnLogin.layer setMasksToBounds:YES];
    [self.btnLogin.layer  setCornerRadius:5];
    [self.btnLogin setFont:[UIFont fontWithName:kDefaultFontName
                                              size:self.btnLogin.font.pointSize]];
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
                if (self->spewDebug){
                    NSLog(@"%@",message);
                }
            }
           
            message =  @"";
            
        }
    
}

- (IBAction)GroupAction:(UIButton *)sender {
    [self endTimer];
}

- (IBAction)guardiansAction:(UIButton *)sender {
    [self performSegueWithIdentifier:@"segGuardians" sender:sender];
    [self endTimer];
}

- (IBAction)loginAction:(UIButton *)sender {
    
    if (self->spewDebug){
        NSLog(@"HomeViewController:loginAction:Invoked...");
    }
    
    [self endTimer];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    GuardianViewController *targetVC = nil;
    
    NSArray *memberships = nil,
            *characters  = nil;
    @try {
        
        
        targetVC =  (GuardianViewController *) segue.destinationViewController;
       
        if (targetVC){
         memberships = (NSArray *) [appDelegate.destinyMemberships copy];
        
         characters =   (NSArray *) [appDelegate.destinyCharacters copy];
        
        if ([targetVC isKindOfClass:[GuardianViewController class]]){
             [targetVC setDestChars:characters];
             [targetVC setMemberships:memberships];
         }
     }
        
    } @catch (NSException *exception) {
        NSLog(@"HomeViewController:prepareForSegue:GuardianViewController:Error->%@...",exception.description);
    } @finally {
        targetVC = nil;
        
        memberships = nil;
          characters  = nil;
        
    }

   
    
}

-(void) endTimer{
    if (self.timer != nil){
        [self.timer invalidate];
    }
    if (self->spewDebug){
        NSLog(@"HomeView Timer Stopped");
    }
    self.timer = nil;
}

-(void) startTimer{
    
   // return;

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
    
    UIImage  *image           = nil,
             *cImage          = nil;
    
    NSInteger randomImage     = -1;
    
    @try {
        
           message = @"HomeViewController:timerFireMethod:Image Change:%@->%@";
        
            randomImage = arc4random_uniform(backgroundImages.count);
        
            newImageName = [backgroundImages objectAtIndex:randomImage];
        
             
        if (![newImageName isEqualToString:currentImageName]){
            
            if (self->spewDebug){
                NSLog(message,currentImageName,newImageName);
            }
            
            image =  [UIImage imageNamed:newImageName];
            
            cImage = _imgBackView.image;
            
            if (cImage){
                imageSize = cImage.size;
            }
            
            title = newImageName;
            
            title = [title stringByReplacingOccurrencesOfString:@"1.jpg" withString:@""];
            
            title = [title stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
            
            title = [title stringByReplacingOccurrencesOfString:@".png" withString:@""];
           
             
            if (image != nil){
                image =   [Utilities imageResize:image andResizeTo:imageSize];
                
                
                
                 [_imgBackView.layer setMasksToBounds:YES];
                 [_imgBackView.layer setCornerRadius:15];
                 [_imgBackView.layer setBorderWidth:1];
                 [_imgBackView.layer setShadowOffset: CGSizeMake(0, 0)];
                 [_imgBackView.layer setBorderColor:[UIColor darkGrayColor].CGColor];
                 [_imgBackView setImage:image];
                
                //[_lblTitle setText:title];
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
        
            if (self->spewDebug){
                    NSLog(@"HomeViewController:setupImages:backgroundImages-> %lu",
                          (unsigned long)backgroundImages.count);
            }
        
        }
         
        if(isFirstLaunch){
            
            
             [_imgBackView.layer setMasksToBounds:YES];
             [_imgBackView.layer setCornerRadius:15];
             [_imgBackView.layer setBorderWidth:1];
             [_imgBackView.layer setShadowOffset: CGSizeMake(0, 0)];
             [_imgBackView.layer setBorderColor:[UIColor systemOrangeColor].CGColor];
            
            img =  [UIImage imageNamed:currentImageName];
            
            title = currentImageName;
            
            title = [title stringByReplacingOccurrencesOfString:@"1.jpg" withString:@""];
            
            title = [title stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
            
            title = [title stringByReplacingOccurrencesOfString:@".png" withString:@""];
            
            imageSize = img.size;
           
            if (img != nil){
                
                //[_lblTitle setText:title];

                [_imgBackView setImage:img];
            }
            
            self->isFirstLaunch = NO;
            
            if (! useTableView){
             [self startTimer];
            }
        }
        
    } @catch (NSException *exception) {
        if (self->spewDebug){
            NSLog(@"HomeViewController:setupImages:Exception-> %@",exception.description);
        }
    } @finally {
        img = nil;
    }
}



-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
    NSString *sourceVCTitle = segue.sourceViewController.title;
    
    if (self->spewDebug){
        NSLog(@"HomeViewController:prepareForUnwind:Invoked:For:%@",sourceVCTitle);
    }
    
    if ([sourceVCTitle isEqualToString:@"Login"]){
        //Refresh UI
        [self refreshUI];
    }
    
}

@end
