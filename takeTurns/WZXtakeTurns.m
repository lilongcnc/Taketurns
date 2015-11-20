//
//  WZXtakeTurns.m
//  takeTurns
//
//  Created by wordoor－z on 15/11/18.
//  Copyright © 2015年 wordoor－z. All rights reserved.
//

#import "WZXtakeTurns.h"
#define offSize 20
@implementation WZXtakeTurns
{
    UIScrollView *_myScrollview;
    NSInteger _num;
    UIPageControl * _page;
    UIView * _backView;
    UIView * _whiteView;
    BOOL _isHave;
    CGSize _size;
    NSMutableArray *_imgArr;
    NSInteger _index;
    
}
-(instancetype)initWithFrame:(CGRect)frame 
{
    if (self==[super initWithFrame:frame])
    {
        _num=0;
        _index=0;
        _isHave=NO;
        _imgArr = [[NSMutableArray alloc]init];
        _myScrollview =[[UIScrollView alloc]initWithFrame:self.bounds];
        _myScrollview.pagingEnabled=YES;
        _myScrollview.showsHorizontalScrollIndicator=NO;
        _myScrollview.bounces=NO;
        _myScrollview.contentSize =frame.size;
        _myScrollview.scrollEnabled=NO;
      
        UISwipeGestureRecognizer *leftSwipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
        leftSwipe.direction= UISwipeGestureRecognizerDirectionRight;
        UISwipeGestureRecognizer *rightSwipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
        rightSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
        
        [_myScrollview addGestureRecognizer:leftSwipe];
        [_myScrollview addGestureRecognizer:rightSwipe];
        [self addSubview:_myScrollview];
    }
    return self;
}
-(void)leftSwipe:(UISwipeGestureRecognizer *)sender
{
    [self left];
}
-(void)rightSwipe:(UISwipeGestureRecognizer *)sender
{
    [self right];
}
-(void)addImg:(UIImage *)img
{
    [_imgArr addObject:img];
    if (_whiteView)
    {
        _whiteView.frame=CGRectMake(0, _size.height-4, (float)_size.width/_num, 2);
    }
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(_num*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    imgView.image =img;
    _num ++;
    [_myScrollview addSubview:imgView];
    _myScrollview.contentSize = CGSizeMake(self.frame.size.width*_num, self.frame.size.height);
}
-(void)addPageframe:(CGRect)pageFrame andType:(NSInteger)type
{
        switch (type)
        {
            case 0:
            {
                _page = [[UIPageControl alloc]initWithFrame:pageFrame];
                _page.numberOfPages = _num;
                [self addSubview:_page];
            }
            break;
                
            case 1:
            {
                 _size = pageFrame.size;
                _backView=[[UIView alloc]initWithFrame:pageFrame];
                UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, pageFrame.size.height-2, pageFrame.size.width, 2)];
                lineView.backgroundColor = [UIColor whiteColor];
                [_backView addSubview:lineView];
                _whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, pageFrame.size.height-4, (float)pageFrame.size.width/_num, 2)];
                _whiteView.backgroundColor=[UIColor whiteColor];
                [_backView addSubview:_whiteView];
                
                [self addSubview:_backView];
            }
            break;
                
            default:
            break;
        }
    _isHave = YES;
}

-(void)left
{
    if (_index==0)
    {
        _index = _imgArr.count-1;
    }
    else
    {
        _index--;
    }
    [UIView animateWithDuration:0.5 animations:^{
        _myScrollview.contentOffset = CGPointMake(_index*self.frame.size.width, 0);
    }];
    [self pageChange];
}
-(void)right
{
    if (_index==_imgArr.count-1)
    {
        _index = 0;
    }
    else
    {
        _index ++;
    }
    [UIView animateWithDuration:0.3 animations:^{
        _myScrollview.contentOffset = CGPointMake(_index*self.frame.size.width, 0);
    }];
     [self pageChange];
}
-(void)pageChange
{
    if (_isHave)
    {
        if (_page)
        {
            _page.currentPage =_index;
        }
        if (_whiteView)
        {
            _whiteView.frame=CGRectMake(_index*(float)_size.width/_num,_size.height-4, (float)_size.width/_num, 2);
        }
    }
}
@end
