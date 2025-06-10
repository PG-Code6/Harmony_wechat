import prompt from '@ohos.promptAction';
import { RegisterPage } from './RegisterPage';

@Component
export struct LoginPage {
  @State username: string = '';
  @State password: string = '';
  @State showRegister: boolean = false;
  
  onLoginSuccess: () => void = () => {};

  build() {
    Stack({ alignContent: Alignment.Center }) {
      if (this.showRegister) {
        RegisterPage({
          onRegisterSuccess: () => {
            this.showRegister = false;
          },
          onBack: () => {
            this.showRegister = false;
          }
        })
      } else {
        Column() {
          Image($r('app.media.wechat_logo'))
            .width(120)
            .height(120)
            .margin({ top: 80, bottom: 40 })
          
          TextInput({ placeholder: '请输入用户名' })
            .width('80%')
            .height(50)
            .margin({ bottom: 20 })
            .onChange((value: string) => {
              this.username = value;
            })
          
          TextInput({ placeholder: '请输入密码' })
            .type(InputType.Password)
            .width('80%')
            .height(50)
            .margin({ bottom: 40 })
            .onChange((value: string) => {
              this.password = value;
            })
          
          Button('登录')
            .width('80%')
            .height(50)
            .backgroundColor('#07C160')
            .onClick(() => {
              if (this.username.trim() === '' || this.password.trim() === '') {
                prompt.showToast({ message: '请输入用户名和密码' });
                return;
              }
              // 模拟登录
              if(this.username.trim()==="zhangsan" && this.password.trim()==="12345678a"){
                prompt.showToast({ message: '登录成功' });
                this.onLoginSuccess();
              }else {
                prompt.showToast({ message: '账号/密码错误' });
              }
            })
          
          Text('注册新账号')
            .fontSize(16)
            .fontColor('#07C160')
            .margin({ top: 20 })
            .onClick(() => {
              this.showRegister = true;
            })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#F8F8F8')
      }
    }
    .width('100%')
    .height('100%')
  }
} 