import UIAbility from '@ohos.app.ability.UIAbility';

console.log('UIAbility生周期回调函数（钩子）, UIAbility主要于处理生命周期（就是APP的启动、前后台运行等！）')
/**
 * UIAbility是一种包含用户界面的应用组件，主要用于和用户进行交互。UIAbility也是系统调度的单元，为应用提供窗口在其中绘制界面。
 *
 *    一个APP应用可以有一个 或 多个 UIAbility；
 *    一个UIAbility可以对应于多个页面，建议将一个独立的功能模块放到一个UIAbility中，以多页面的形式呈现。例如新闻应用在浏览内容的时候，可以进行多页面的跳转使用。
 *    每个UIAbility实例，都对应于一个最近任务列表中的任务。
 *
 *  UIAbility的启动模式：3种，要修改UIAbility的启动模式，可以在module.json5配置文件中的"launchType"字段
 *    UIAbility当前支持：
 *        1、singleton（单实例模式【默认】）； 注：API9及以上，router.pushUrl()方法，默认的跳转页面使用的模式
 *        2、multiton（多实例模式）；
 *        3、specified（指定实例模式）；
 *
 * UIAbility的生命周期有4个状态：
 *        1、Create
 *        2、Foreground
 *        3、Background
 *        4、Destroy
 * 了解UIAbility更多 https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101667310940295021
 */


import hilog from '@ohos.hilog';
import window from '@ohos.window';


export default class EntryAbility extends UIAbility {

  onCreate(want, launchParam) {
    console.log('1、onCreate() APP初始化：在APP加载过程中，当UIAbility实例创建完成时触发调用，可以在这里定义变量、加载资源等');

    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    console.log('4、onDestroy() 当UIAbility实例销毁时触发调用，可以在这里释放系统资源、数据的保存等操作');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.log('onWindowStageCreate() 设置UI页面加载：在APP加载过程中，当UIAbility实例创建完成时触发调用，可以在这里设置WindowStage的事件订阅（获得焦点、失去焦点、可见、不可见）');

    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    console.log('onWindowStageDestroy() 当UIAbility实例销毁之前触发调用，可以在这里释放UI页面资源');

    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    console.log('2、onForeground() 当UIAbility实例切换到前台时（在UIAbility的UI界面可见之前）触发调用，可以在这里申请系统需要的资源，如：开启定位功能，或重新申请在onBackground调用释放的资源');

    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    console.log('3、onBackground() 当UIAbility实例切换到后台时（在UIAbility的UI界面完全不可见之后）触发调用，可以在这里释放UI页面不可见时无用的资源，如：停止定位功能，或 在这里执行较为耗时的操作，如：状态保存等');

    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
