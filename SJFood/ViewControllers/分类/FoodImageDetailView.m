//
//  FoodImageDetailView.m
//  SJFood
//
//  Created by 叶帆 on 14/12/21.
//  Copyright (c) 2014年 Ye Fan. All rights reserved.
//

#import "FoodImageDetailView.h"

@interface FoodImageDetailView ()
@property (nonatomic, strong) NSMutableString *htmlString;
@property (nonatomic, strong) NSMutableString *imageUrl;
@end

@implementation FoodImageDetailView
@synthesize htmlString,webview;
@synthesize imageUrl;

#pragma mark - Public Methods
- (void)reloadWithFoodDetail:(FoodDetail *)foodDetail
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ImageTemplete" ofType:@"html"];
    self.htmlString = [NSMutableString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    self.imageUrl = [NSMutableString stringWithString:foodDetail.info];
    [self.imageUrl insertString:@"<body><p><img src=\"" atIndex:0];
    [self.imageUrl appendString:@"\" width=100% /></p>"];
    NSString *image = [self.imageUrl stringByReplacingOccurrencesOfString:@"," withString:@"\" width=100% /></p><p><img src=\""];
    NSString *html = [self.htmlString stringByReplacingOccurrencesOfString:@"<body>" withString:image];
    [self.webview loadHTMLString:html baseURL:nil];
}

#pragma mark - UIView methods
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.webview.hidden = YES;
}

@end
