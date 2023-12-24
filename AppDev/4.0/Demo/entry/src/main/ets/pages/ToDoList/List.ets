import Item from './Item'
@Entry
@Component
struct ToDoList{

  @State Data: Array<string> = [];

  async aboutToAppear(){
    this.Data = [ "早起晨练", "准备早餐",  "阅读名著", "学习ArkTS", "看剧放松"];
  }

  build(){
    Column(){
      Text('待办列表').margin({bottom: 20}).width('100%').height(50).fontColor('#fff').fontSize(26).textAlign(TextAlign.Center).backgroundColor('#ffe08312')
      ForEach(this.Data, (o, i) => {
        Item({index: i, content: o })
      })

    }

  }
}