import prompt from '@ohos.promptAction';

@Component
export struct RegisterPage {
  @State username: string = '';
  @State password: string = '';
  @State confirmPassword: string = '';
  @State usernameError: string = '';
  @State passwordError: string = '';

  onRegisterSuccess: () => void = () => {};
  onBack: () => void = () => {};

  // 验证用户名
  validateUsername(username: string): boolean {
    const usernameRegex = /^[a-zA-Z0-9_]{3,15}$/;
    if (!usernameRegex.test(username)) {
      this.usernameError = '用户名需为3-15位字母、数字或下划线的组合';
      return false;
    }
    this.usernameError = '';
    return true;
  }

  // 验证密码
  validatePassword(password: string): boolean {
    // 密码至少包含一个字母和一个数字，且长度至少为8位
    const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    if (!passwordRegex.test(password)) {
      this.passwordError = '密码需包含字母和数字且长度至少为8位';
      return false;
    }
    this.passwordError = '';
    return true;
  }

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
          .margin({ top: 40, bottom: 5 })
          .onChange((value: string) => {
            this.username = value;
            this.validateUsername(value);
          })

        if (this.usernameError !== '') {
          Text(this.usernameError)
            .fontSize(12)
            .fontColor(Color.Red)
            .width('80%')
            .margin({ bottom: 10 })
        } else {
          Text('用户名需为3-15位字母、数字或下划线的组合')
            .fontSize(12)
            .fontColor('#999999')
            .width('80%')
            .margin({ bottom: 10 })
        }

        TextInput({ placeholder: '请输入密码' })
          .type(InputType.Password)
          .width('80%')
          .height(50)
          .margin({ bottom: 5 })
          .onChange((value: string) => {
            this.password = value;
            this.validatePassword(value);
          })

        if (this.passwordError !== '') {
          Text(this.passwordError)
            .fontSize(12)
            .fontColor(Color.Red)
            .width('80%')
            .margin({ bottom: 10 })
        } else {
          Text('密码需包含字母和数字且长度至少为8位')
            .fontSize(12)
            .fontColor('#999999')
            .width('80%')
            .margin({ bottom: 10 })
        }

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

            // 验证用户名和密码
            const isUsernameValid = this.validateUsername(this.username);
            const isPasswordValid = this.validatePassword(this.password);

            if (!isUsernameValid || !isPasswordValid) {
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

        Text('已有账号？返回登录')
          .fontSize(16)
          .fontColor('#07C160')
          .margin({ top: 20 })
          .onClick(() => {
            this.onBack();
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