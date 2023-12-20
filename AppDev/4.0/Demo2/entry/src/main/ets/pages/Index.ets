import { TitleComponent } from './Rank/Title'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State is: boolean = true

  build() {
    Column() {
      TitleComponent({ isRefresh: $is })
      this.MyFZ()
    }
    .height('100%')
  }

  @Builder MyFZ(){
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
        }).margin(20).padding(10).width(120).fontSize(30)
      }
    }
    .padding(20)
    .width('100%')
  }
}