import Index from './Index';
import Rank from './Rank/Index';
import { ToDoList } from './ToDoList/List';

@Entry
@Component
struct TabsPage{
  @State active:number = 0
  @State pos: BarPosition = BarPosition.End

  private tabsController: TabsController = new TabsController()

  @Builder TabBuilder(name: string,tag:number, icon: Resource, icon_h:Resource){
    Column(){
      Image(tag === this.active ? icon_h : icon).margin({bottom:3}).width(25).height(25)
      Text(name).fontColor(tag === this.active ? '#3EC127' : Color.Gray)
    }.onClick(()=>{
      // @ts-ignore
      console.log(tag)
      this.pos = 2 === tag ? BarPosition.Start :  BarPosition.End;
      this.tabsController.changeIndex(tag);
    })
  }

  build(){
    Tabs({ barPosition: this.pos, controller: this.tabsController}){
      TabContent(){
        // Text('首页内容').fontSize(56);
        Index()
      }
      .tabBar('首页')

      TabContent(){
        // Text('列表内容').fontSize(56);
        Rank()
      }
      .tabBar('列表')

      TabContent(){
        // Text('发现').fontSize(56)
        ToDoList()
      }
      // .tabBar('发现')
      .tabBar(this.TabBuilder('上面', 2, $r('app.media.study'), $r('app.media.study_h')))

      TabContent(){
        Text('我的').fontSize(56)
      }
      // .tabBar('我的')
      .tabBar(this.TabBuilder('下面', 3, $r('app.media.learn'), $r('app.media.learn_h')))
    }.vertical(false)
    .barWidth('100%')
    .barHeight(56)
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      console.log(`${index}`)
      // 在滑动页签后，给对应的tabBar添加高亮效果
      this.active = index
    })
  }
}