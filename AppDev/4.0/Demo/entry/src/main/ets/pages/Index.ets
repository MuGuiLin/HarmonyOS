import go from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State is: boolean = true

  build() {
    Column() {
      Text('基本语法使用')
        .fontSize(52)
        .fontWeight(FontWeight.Bold)

      if(this.is) {
        Text(this.message)
          .padding(20)
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
      } else {
        Text(this.message)
          .padding(20)
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
      }

      Row() {
        Button('取肖').onClick(() => {
          this.message = 'Hello World'
        }).padding(10).width(120).fontSize(30).borderWidth(1).borderColor('#FF007DFF').backgroundColor(Color.Gray)

        Button('确认').onClick(() => {
          this.message = 'Hello 沐枫'
        }).margin(20).padding({ top: 8, right: 20, bottom: 8, left: 20 }).width(120).fontSize(30)
      }

      this.RouterNav()
    }
    .height('100%')
  }

  @Builder RouterNav(){
    Column() {
      Text('页面路由导航 - @ohos.router').fontSize(20)

      Row() {
        Button('Tabs').onClick(() => {
          go.pushUrl({ url: 'pages/Tabs' }).then((res) => {
            console.log('页面跳转成功回调!', JSON.stringify(res));
          }).catch((err) => {
            console.info('页面跳转失败回调!', err);
          }).finally(() => {
            console.info('页面跳转成功/失败都会回调!');
          })
        }).margin(5)

        Button('LifeCycle ').onClick(() => {
          go.pushUrl({ url: 'pages/LifeCycle' }).then((res) => {
            console.log('页面跳转成功回调!', JSON.stringify(res));
          }).catch((err) => {
            console.info('页面跳转失败回调!', err);
          }).finally(() => {
            console.info('页面跳转成功/失败都会回调!');
          })
        }).margin(5)
      }
    }
    .padding(20)
    .width('100%')
  }
}