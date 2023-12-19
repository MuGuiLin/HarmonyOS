import { TitleComponent } from './Title'
import { ItemComponent } from './Item'

@Entry
@Component
struct RankPage {
  @State is:Boolean = true
  @State index:Number = 1
  @State data1: any[] = [
    {id: 1, name: '平果', vote: 1024},
    {id: 2, name: '梨子', vote: 800},
    {id: 3, name: '香蕉', vote: 750},
    {id: 4, name: '葡萄', vote: 660},
    {id: 5, name: '草莓', vote: 580},
  ]
  @State data2: any[] = [
    {id: 1, name: '香蕉', vote: 2048},
    {id: 2, name: '草莓', vote: 1560},
    {id: 3, name: '平果', vote: 1280},
    {id: 4, name: '梨子', vote: 1010},
    {id: 5, name: '葡萄', vote: 880},

  ]

  isThree(): Boolean{
    return 1 === this.index || 2 === this.index || 3 === this.index
  }

  build(){
    Column(){
      // TitleComponent({isRefresh: this.is}) // 在传参时获取变量前面不能用this.
      TitleComponent({ isRefresh: $is }) // 在传参时获取变量前面用$，以引用的方式来获取

      Column(){
        List(){
          ForEach(this.is ? this.data1 : this.data2, (o, i) => {
            ListItem(){
              ItemComponent({ index: i++, name: o.name, vote: o.vote })
            }
          }, (o, i) => o.id)
        }
      }
    }

  }

}