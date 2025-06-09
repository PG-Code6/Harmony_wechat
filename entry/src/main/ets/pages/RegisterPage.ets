import prompt from '@ohos.promptAction';

@Component
export struct RegisterPage {
  @State username: string = '';
  @State password: string = '';
  @State confirmPassword: string = '';
  
  onRegisterSuccess: () => void = () => {};
  onBack: () => void = () => {};

  build() {
    Column() {
      Row() {
        Image($r('app.media.back_icon'))
          .width(24)
          .height(24)
          .margin({ left: 16 })
          .onClick(() => {
            this.onBack();
          })
        Text('注册')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 16 })
        Blank()
      }
      .width('100%')
      .height(56)
      .backgroundColor('#F8F8F8')
      
      Column() {
        TextInput({ placeholder: '请输入用户名' })
          .width('80%')
          .height(50)
          .margin({ top: 40, bottom: 20 })
          .onChange((value: string) => {
            this.username = value;
          })
        
        TextInput({ placeholder: '请输入密码' })
          .type(InputType.Password)
          .width('80%')
          .height(50)
          .margin({ bottom: 20 })
          .onChange((value: string) => {
            this.password = value;
          })
        
        TextInput({ placeholder: '请确认密码' })
          .type(InputType.Password)
          .width('80%')
          .height(50)
          .margin({ bottom: 40 })
          .onChange((value: string) => {
            this.confirmPassword = value;
          })
        
        Button('注册')
          .width('80%')
          .height(50)
          .backgroundColor('#07C160')
          .onClick(() => {
            if (this.username.trim() === '' || this.password.trim() === '') {
              prompt.showToast({ message: '请输入用户名和密码' });
              return;
            }
            
            if (this.password !== this.confirmPassword) {
              prompt.showToast({ message: '两次输入的密码不一致' });
              return;
            }
            
            // 模拟注册成功
            prompt.showToast({ message: '注册成功' });
            this.onRegisterSuccess();
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F8F8F8')
    }
    .width('100%')
    .height('100%')
  }
} 