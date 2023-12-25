@Component
export default struct Item{

  // 用private接收父组件传来的常规形参
  private item: string;
  private index: number;

  // 用@Prop接收父组件传来的单向同步状态
  @Prop attrs: Array<string>;

  @State isComplete: boolean = false;

  @Builder Icon(img){
    Image(img).margin({left: 5, right: 10}).width(30)
  }

  build(){
    Row(){
      if(this.isComplete) {
        this.Icon($r('app.media.checked'))
      } else {
        this.Icon($r('app.media.checkbox'))
      }
      Text(`${this.index + 1}、${this.item}`)
        .fontSize(20)
        .opacity(this.isComplete ? 0.5 :  1 )
        .decoration({type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None})

    }.margin({ bottom: 20 }).padding(10).width('93.3%').borderRadius(10).backgroundColor('#eee').onClick(()=>{
      this.isComplete = !this.isComplete;
      // console.log(this.attrs);
    })
  }
}