@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
          .textAlign(TextAlign.End)
      }
      .width('100%')
    }
    .height('100%')
  }
}