@Extend(TextInput)
function inputStyle() {
  .placeholderColor($r('app.color.default'))
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.big_text_size'))
  .backgroundColor($r('app.color.background'))
  .padding({ left: 20 })
  .margin({ top: $r('app.float.input_margin_top') })
}

@Entry
@Component
struct Login {
  @State isLogin: boolean = false

  build() {
    Row() {
      Column() {

        Image($r('app.media.logo')).width(120).objectFit(ImageFit.Cover)
        Text('用户登录').margin(20).fontSize(30)

        if(this.isLogin) {
          LoadingProgress()
            .color($r('app.color.primary'))
            .width(100)
            .height(100)
        }

        Text('登录账号可以使用更多服务！').fontColor($r('app.color.default'))

        TextInput({placeholder: '手机号'})
          .type(InputType.PhoneNumber)
          .inputStyle()

        TextInput({placeholder: '密码'})
          .type(InputType.Password)
          .inputStyle()

        Row(){
          Text('短信验证').fontColor($r('app.color.primary'))
          Text('忘记密码').fontColor($r('app.color.primary'))
        }.padding(20).width('100%').justifyContent(FlexAlign.SpaceBetween)

        Button('登 录', { type: ButtonType.Capsule}).margin({top: 50, bottom:20}).width('90%').onClick(() => {
          this.isLogin = !this.isLogin;
        })

        Text('注册账号')
          .fontSize(20)
          .fontColor($r('app.color.primary'))
          .fontWeight(FontWeight.Bold)

        Text('其他登录方式').margin({top: 50, bottom: 10}).fontColor($r('app.color.default'))

        Row({space: 20}) {
          Button('方式A', { type: ButtonType.Circle}).padding(5).backgroundColor($r('app.color.default'))
          Button('方式B', { type: ButtonType.Circle}).padding(5).backgroundColor($r('app.color.default'))
          Button('方式C', { type: ButtonType.Circle}).padding(5).backgroundColor($r('app.color.default'))
        }

      }
      .width('100%')
    }
    .height('100%').backgroundColor('#eee')
  }
}