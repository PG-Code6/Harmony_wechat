import { TabsComponent } from '../components/TabsComponent';
import { LoginPage } from './LoginPage';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct Index {
  @State isLoggedIn: boolean = false;
  @State context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  @State is_bank: boolean =  false;
  aboutToAppear() {
    // 首次启动时默认未登录
    this.isLoggedIn = false;
  }
  override onBackPress(){
    // 示例：弹出确认对话框
    console.log('拦截返回键操作');
    this.is_bank = !this.is_bank;
    // 返回 ABILITY_BACK_CONSUME 表示消费事件，阻止默认返回行为
    return true;
  }

  build() {
    Column() {
      if (this.isLoggedIn) {
        TabsComponent({
          is_back: this.is_bank,
          onLogout: () => {
            this.isLoggedIn = false;
          }
        })
      } else {
        LoginPage({

          onLoginSuccess: () => {
            this.isLoggedIn = true;
          }
        })
      }
    }
    .width('100%')
    .height('100%')
  }
} 