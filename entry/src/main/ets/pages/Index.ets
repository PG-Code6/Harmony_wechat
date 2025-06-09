import { TabsComponent } from '../components/TabsComponent';
import { LoginPage } from './LoginPage';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct Index {
  @State isLoggedIn: boolean = false;
  @State context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  aboutToAppear() {
    // 检查用户是否已登录，这里简化处理，实际应用中应该使用数据持久化
    // 首次启动时默认未登录
    this.isLoggedIn = false;
  }

  build() {
    Column() {
      if (this.isLoggedIn) {
        TabsComponent()
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