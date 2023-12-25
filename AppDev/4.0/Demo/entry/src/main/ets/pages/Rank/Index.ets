import { HeaderComponent } from '../Header'
// import { ItemComponent } from './Item'

@Entry
@Component
export default struct RankPage {
  @State isRefresh: boolean = false
  @State index: number = 1

  @State data1: any[] = [
    {id: 'a1', name: '平果', vote: 1024},
    {id: 'a2', name: '梨子', vote: 800},
    {id: 'a3', name: '香蕉', vote: 750},
    {id: 'a4', name: '葡萄', vote: 660},
    {id: 'a5', name: '草莓', vote: 580},
    {id: 'a6', name: '菠萝', vote: 580},
    {id: 'a7', name: '西瓜', vote: 450},
    {id: 'a8', name: '芒果', vote: 360},

  ]
  @State data2: any[] = [
    {id: 'b1', name: '香蕉', vote: 2048},
    {id: 'b2', name: '草莓', vote: 1560},
    {id: 'b3', name: '平果', vote: 1280},
    {id: 'b4', name: '梨子', vote: 1010},
    {id: 'b5', name: '葡萄', vote: 880},
    {id: 'b6', name: '菠萝', vote: 580},
    {id: 'b7', name: '西瓜', vote: 450},
    {id: 'b8', name: '芒果', vote: 360},


  ]

  isThree(): boolean{
    return 1 === this.index || 2 === this.index || 3 === this.index
  }

  build(){
    Column(){
      // TitleComponent({isRefresh: this.is}) // 在传参时获取变量前面不能用this.
      HeaderComponent({ isRefresh: $isRefresh }) // 在传参时获取变量前面用$，以引用的方式来获取

      Column(){
        List(){
          ListItem(){
            Row(){
              Text('排名').width('33%').fontSize(20).textAlign(TextAlign.Center)
              Text('水果').width('33%').fontSize(20).textAlign(TextAlign.Center)
              Text(`数量`).width('33%').fontSize(20).textAlign(TextAlign.Center)
            }.width('100%').padding(20).justifyContent(FlexAlign.SpaceAround).backgroundColor(Color.Pink).border({width: 2, color: 'blue', style: { bottom: BorderStyle.Dotted}})
            // ItemComponent({ index: i+1, name: o.name, vote: o.vote })
          }
          ForEach(this.isRefresh ? this.data1 : this.data2, (o, i?: number) => {
            ListItem(){
              Row(){
                Text(`${(Number(i) + 1)}`).fontSize(20).fontColor(3 > (Number(i)) ? '#fff' : Color.Gray).width(25).height(25).textAlign(TextAlign.Center).backgroundColor(3 > (Number(i)) ? $r('app.color.primary') : Color.Transparent).borderRadius(13)
                Text(o.name).fontSize(20)
                Text(`${o.vote}`).fontSize(20)
              }.width('100%').padding(20).justifyContent(FlexAlign.SpaceAround)
              // ItemComponent({ index: i+1, name: o.name, vote: o.vote })
            }
          }, (o, i) => {
            // console.log(JSON.stringify(o) ,o.id, i);
            // return `${i}`  注：不要用数组的下标 i 来作为唯一标识，因为数组的下标是固定的，每次都从0开始，所以在排序时就会有问题！！
            return o.id;
          })
        }
      }
    }

  }

}