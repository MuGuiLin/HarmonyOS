@Entry // 注： @Entry 装饰器 在页面中只有出现1次
@Component
struct LifeCycle {

  @State Obj:any = {}
  @State Arr:any[] = []

  async  aboutToAppear() {
    console.log('1、aboutToAppear函数 在创建自定义组件实例后 build函数之前 调用，可以在这里初始化在UI中要渲染的数据！')
    // await getDataApi()
    this.Obj = { name: '沐枫', age: 18}
  }

  onPageShow(){
    console.log('2、onPageShow，进入页面显示时触发！')
  }

  onBackPress(){
    console.log('3、onPageShow，系统执行返回时触发！')
    return true // 返回true时 让页面(开发者)自己处理返回逻辑
    return false // 返回false时 让系统处理返回逻辑 默认为false
  }

  onPageHide(){
    console.log('4、onPageHide，退出页面消失时触发！')
  }

  aboutToDisappear(){
    console.log('5、aboutToAppear函数 在自定义组件实例被销毁后调用，可以在这里释放不在使用的资源变量等，以免资源泄露溢出！如清除定时器等。')
  }

  // 在页面或组件中必须有且只有1个build()方法，用于渲染UI组件的，相当于 Vue中的<template>
  build(){
    Text('页面生命周期、生命钩子函数！').fontSize(56)
  }
}