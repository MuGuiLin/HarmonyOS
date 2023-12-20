@Component
export struct ItemComponent {
// export default struct ItemComponent {
  @State isClick:boolean = false

  build(){
    Row(){
      Text(this.index).width('100').fontSize(26)
      Text(this.name).width('100').fontSize(26)
      Text(this.vote).width(100).fontSize(26)
    }.width('100%').height(50).onClick(()=>{
      this.isClick = !this.isClick
    })

  }
}