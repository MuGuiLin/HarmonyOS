@Component
export default struct Item{
  private index: number;
  private content: string;
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
      Text(`${this.index + 1}、${this.content}`)
        .fontSize(20)
        .opacity(this.isComplete ? 0.5 :  1 )
        .decoration({type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None})

    }.margin({ bottom: 20 }).padding(10).width('93.3%').borderRadius(10).backgroundColor('#eee').onClick(()=>{
      this.isComplete = !this.isComplete;
    })
  }
}