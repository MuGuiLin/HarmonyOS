import { HeaderComponent } from '../Header'
// import { ItemComponent } from './Item'

@Entry
@Component
struct RankPage {
  @State isRef:boolean = true
  @State index:number = 1

  @State data1: any[] = [
    {id: '1', name: '平果', vote: 1024},
    {id: '2', name: '梨子', vote: 800},
    {id: '3', name: '香蕉', vote: 750},
    {id: '4', name: '葡萄', vote: 660},
    {id: '5', name: '草莓', vote: 580},
    {id: '6', name: '菠萝', vote: 580},
    {id: '7', name: '西瓜', vote: 450},
    {id: '8', name: '芒果', vote: 360},

  ]
  @State data2: any[] = [
    {id: '1', name: '香蕉', vote: 2048},
    {id: '2', name: '草莓', vote: 1560},
    {id: '3', name: '平果', vote: 1280},
    {id: '4', name: '梨子', vote: 1010},
    {id: '5', name: '葡萄', vote: 880},
    {id: '6', name: '菠萝', vote: 580},
    {id: '7', name: '西瓜', vote: 450},
    {id: '8', name: '芒果', vote: 360},


  ]

  isThree(): boolean{
    return 1 === this.index || 2 === this.index || 3 === this.index
  }

  build(){
    Column(){
      // TitleComponent({isRefresh: this.is}) // 在传参时获取变量前面不能用this.
      HeaderComponent({ isRefresh: $isRef }) // 在传参时获取变量前面用$，以引用的方式来获取

      Column(){
        List(){
          ListItem(){
            Row(){
              Text('排名').width('33%').fontSize(20).textAlign(TextAlign.Center)
              Text('水果').width('33%').fontSize(20).textAlign(TextAlign.Center)
              Text(`数量`).width('33%').fontSize(20).textAlign(TextAlign.Center)
            }.width('100%').padding(20).justifyContent(FlexAlign.SpaceAround).backgroundColor(Color.Pink)
            // ItemComponent({ index: i+1, name: o.name, vote: o.vote })
          }
          ForEach(this.isRef ? this.data1 : this.data2, (o, i?: number) => {
            ListItem(){
              Row(){
                Text(`${(Number(i) + 1)}`).fontSize(20).fontColor(3 > (Number(i)) ? 'blue' : Color.Gray)
                Text(o.name).fontSize(20)
                Text(`${o.vote}`).fontSize(20)
              }.width('100%').padding(20).justifyContent(FlexAlign.SpaceAround)
              // ItemComponent({ index: i+1, name: o.name, vote: o.vote })
            }
          }, o => o.id)
        }
      }
    }

  }

}