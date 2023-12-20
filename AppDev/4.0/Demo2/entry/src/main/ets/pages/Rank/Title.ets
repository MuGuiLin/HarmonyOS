@Component
export struct TitleComponent{

  // @Link 装饰的变量，可以和父组件中 @State装饰的变量 建业双向数据绑定，任何一方改量都会影响另一方！！
  @Link isRefresh: boolean;

  build(){
    Row(){
      Column(){
        Text('< 返回').fontColor('#fff').fontSize(26)
      }.width('50%').justifyContent(FlexAlign.Start)

      Column(){
        Image($r('app.media.random_h')).width(30).height(30).onClick(()=>{
          this.isRefresh = !this.isRefresh
          // @ts-ignore
          console.log(this.isRefresh)
        })
        // Button('刷新').onClick(()=>{
        //   this.isRefresh = !this.isRefresh
        // })
      }.width('50%').justifyContent(FlexAlign.End)
    }
    .width('100%').height(50).backgroundColor(Color.Gray)

  }
}