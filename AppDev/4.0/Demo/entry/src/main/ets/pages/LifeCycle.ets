import router from '@ohos.router';
import { HeaderComponent } from './Header'

@Entry // 注： @Entry 装饰器 在页面中只有出现1次
@Component
struct LifeCycle {
  @State ids:number = router.getParams()?.['id'];

  @State is:boolean = true;
  @State Obj:any = {};
  @State Arr:any[] = [];

  async  aboutToAppear() {
    console.log('1、aboutToAppear函数 在创建自定义组件实例后 build函数之前 调用，可以在这里初始化在UI中要渲染的数据！')
    // await getDataApi()
    this.Obj = { name: '沐枫', age: 18}
  }
  
  /*
	只有在使用@Entry修饰的自定义组件，下这3个命周期回调函数 onPageShow、onPageHide、onBackPress 才会生效哦！！
  */

  onPageShow(){
    console.log('2、onPageShow，进入页面显示时触发！')
  }

  onBackPress(){
    console.log('3、onPageShow，系统执行返回时触发！')
    // return true // 返回true时 让页面(开发者)自己处理返回逻辑【就是自己写返回按扭和事件】
    return false // 返回false时 让系统处理返回逻辑 默认为false【就是调用系统的返回按扭和事件】
  }

  onPageHide(){
    console.log('4、onPageHide，退出页面消失时触发！')
  }

  aboutToDisappear(){
    console.log('5、aboutToAppear函数 在自定义组件实例被销毁后调用，可以在这里释放不在使用的资源变量等，以免资源泄露溢出！如清除定时器等。')
  }

  // 在页面或组件中必须有且只有1个build()方法，用于渲染UI组件的，相当于 Vue中的<template>
  build(){
    Column(){
      HeaderComponent({ isRefresh: $is });
      Text('页面生命周期、生命钩子函数！').padding(20).fontSize(20);
      Text(`接收到上一个路由页面传来的参数：${this.ids}`).padding(20).fontSize(20);

      Button('自定义返回').onClick(() =>{
        // 在调用router.back()方法之前，可以先调用router.enableBackPageAlert()方法开启页面返回询问对话框功能。
        // router.enableBackPageAlert({
        //   message: 'Message Info'
        // });

        router.back();
      })
    }

  }
}