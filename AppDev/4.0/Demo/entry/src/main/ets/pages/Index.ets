import go from '@ohos.router';

@Entry
@Component
export default struct Index {
  @State message: string = 'Hello World'
  @State is: boolean = true

  build() {
    Column() {
      Text('基本语法使用')
        .padding(20)
        .fontSize(36)
        .fontWeight(FontWeight.Bold)

      Divider();

      if (this.is) {
        Text(this.message)
          .padding(20)
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
          .fontColor('#007DFF')
      } else {
        Text(this.message)
          .padding(20)
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
      }
      Text(this.message)
        .padding(20)
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.is ? '#007DFF' : Color.Pink)

      Row() {
        Button('取肖')
          .onClick(() => {
            this.is = false;
            this.message = 'Hello World'
          })
          .padding(10)
          .width(120)
          .fontSize(20)
          .borderWidth(1)
          .borderColor('#FF007DFF')
          .backgroundColor(Color.Gray)

        Button('确认')
          .onClick(() => {
            this.is = true;
            this.message = 'Hello 沐枫'
          })
          .margin(20)
          .padding({ top: 8, right: 20, bottom: 8, left: 20 })
          .width(120)
          .fontSize(20)
      }

      Divider();

      this.RouterNav()
    }
    .height('100%')
  }

  goto(url): void {
    go.pushUrl({ url, params: { id: Math.random() } }).then((res) => {
      console.log('页面跳转成功回调!', JSON.stringify(res));
    }).catch((err) => {
      console.info('页面跳转失败回调!', err);
    }).finally(() => {
      console.info('页面跳转成功/失败都会回调!');
    })
  }

  @Builder RouterNav() {
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
      }

      Row() {
        // 配置事件的3种方式
        // 1、使用lambda表达式配置组件的事件方法。
        Button('LifeCycle ').onClick(() => {
          this.goto('pages/LifeCycle');
        }).margin(5)

        // 2、使用匿名函数表达式配置组件的事件方法，要求使用bind，以确保函数体中的this指向当前组件。
        Button('LifeCycle ').onClick(function(){
          this.goto('pages/LifeCycle');
        }.bind(this)).margin(5)

        // 3、使用组件的成员函数配置组件的事件方法。
        Button('LifeCycle ').margin(5).onClick(this.goto.bind(this, 'pages/LifeCycle'))
      }
    }
    .padding(20)
    .width('100%')
  }
}