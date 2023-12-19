@Entry
@Component
struct Index {
  @State message: string = 'Hello 沐枫'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(56)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
          .textAlign(TextAlign.End)
      }
      .width('100%')
    }
    .height('100%')
  }
}