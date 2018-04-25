//
//  ViewController.m
//  Firebase
//
//  Created by Elkins on 2018/4/24.
//  Copyright © 2018 Elkins. All rights reserved.
//

#import "ViewController.h"
#import <TwitterKit/TWTRKit.h>
#import <FirebaseAuth/FirebaseAuth.h>

#define kScreenSize [UIScreen mainScreen].bounds.size

@import Firebase;

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
        if (session) {
            NSString *authToken = session.authToken;
            NSString *authTokenSecret = session.authTokenSecret;
            
            FIRAuthCredential *credentials = [FIRTwitterAuthProvider credentialWithToken:authToken secret:authTokenSecret];
            
            [[FIRAuth auth] signInWithCredential:credentials completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                
            }];
        } else {
            // ...
        }
    }];
    
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
