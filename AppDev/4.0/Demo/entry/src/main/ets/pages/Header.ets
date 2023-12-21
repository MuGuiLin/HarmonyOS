import router from '@ohos.router';

@Component
export struct HeaderComponent{

  // @Link 装饰的变量，可以和父组件中 @State装饰的变量 建业双向数据绑定，任何一方改量都会影响另一方！！
  @Link isRefresh: boolean;

  build(){
    Row(){
      // Text('< 返回').fontColor('#fff').fontSize(26).onClick(() => router.back())
      Text('< 返回').fontColor('#fff').fontSize(26).onClick(() =>{
        try {
          router.back();
          console.log('OK，返回成功！');
        } catch (err) {
          console.log('OH，返回错误！', err);
        } finally {
          console.log('try catch finally');
        }
      })
      
      Image($r('app.media.random_h')).width(30).height(30).onClick(()=>{
        this.isRefresh = !this.isRefresh
        // @ts-ignore
        console.log(this.isRefresh)
      })
      // Button('刷新').onClick(()=>{
      //   this.isRefresh = !this.isRefresh
      // })
    }.justifyContent(FlexAlign.SpaceBetween).padding(10)
    .width('100%').height(50).backgroundColor('#007DFF')
  }
}