//
//  ViewController.m
//  UIAlertNet
//
//  Created by 纵昂 on 2021/5/29.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *tanchuangBtn;
@property (nonatomic,assign) NSInteger typeIndex;
@property (nonatomic, strong) NSMutableArray *dataThree;

//
@property (nonatomic,strong) NSString *dictLabelID; //传id
@property (nonatomic, strong) UILabel *leixingType; //名字

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self loadRequest];
    
    
    _tanchuangBtn = [UIButton new];
    [self.view addSubview:_tanchuangBtn];
    [_tanchuangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.mas_equalTo(self.view).mas_offset(90);
           make.left.mas_equalTo(self.view).mas_offset(20);
           make.right.mas_equalTo(self.view).mas_offset(-30);
           make.height.mas_offset(50);
    }];
    [_tanchuangBtn setBackgroundColor:[UIColor redColor]];
    [_tanchuangBtn addTarget:self action:@selector(hhhhhhh) forControlEvents:UIControlEventTouchUpInside];
    [_tanchuangBtn setTitle:@"网络请求弹窗" forState:UIControlStateNormal];
    
//    显示内容
    _leixingType =[[UILabel alloc]initWithFrame:CGRectMake(5, 170, 350, 35)];
    _leixingType.textAlignment = NSTextAlignmentCenter;
    _leixingType.textColor = [UIColor blackColor];
    [self.view addSubview:_leixingType];
    
    
    _typeIndex = 0;
    _dataThree = [NSMutableArray new];
    
    
}

#pragma mark - 网络请求    http://218.108.196.46:3580/zjystj/queryLowDepartment.action
-(void)loadRequest{
    
    CHHTTPTool * servicel = [[CHHTTPTool alloc]init];
    
//    NSDictionary *dic = @{
//                          @"parentId":@"4"
//                          };
    
    [servicel POST:@"https://api.apiopen.top/getWangYiNews" parameters:nil headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

    } progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"+++++++++++++++++++++%@",responseObject);
        if ([responseObject[@"code"]integerValue] == 200){
            NSArray * firstArr = responseObject[@"result"];
            if ([firstArr isKindOfClass:[NSArray class]] && firstArr.count > 0){
                if (self->_typeIndex == 0){
                    [self->_dataThree addObjectsFromArray:firstArr];
                }
                
            }else{
                
                if (self->_typeIndex == 1){

            }
        }
            
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
    

    
}

#pragma mark - 触发请求
-(void)hhhhhhh{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"网络请求弹窗" message:nil preferredStyle:  UIAlertControllerStyleAlert];

    for (NSInteger i = 0; i < _dataThree.count; i++) {
        NSDictionary * dic = _dataThree[i];
        NSString * titStr = mStringWith(dic[@"title"]);
        UIAlertAction * action = [UIAlertAction actionWithTitle:titStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            self->_leixingType.text = titStr; //选中的标题
            self->_dictLabelID = mStringWith(dic[@"passtime"]); //冒充下id。真实项目中填写后台返回的id
            NSLog(@"选择的标题为:%@---id为:%@",titStr,mStringWith(dic[@"passtime"]));
            
        }];
        [action setValue:[UIColor blackColor] forKey:@"_titleTextColor"];
        [alert addAction:action];
    }

    
   UIAlertAction* ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
    [alert dismissViewControllerAnimated: YES completion: nil];
    }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"取消"
    style:UIAlertActionStyleDefault
    handler:^(UIAlertAction* action){
    [alert dismissViewControllerAnimated: YES completion: nil];

    }];

    [alert addAction: ok];
    [alert addAction: cancel];
    [self presentViewController: alert animated: YES completion: nil];
    
    
}
@end
