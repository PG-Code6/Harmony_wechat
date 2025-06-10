import prompt from '@ohos.promptAction';
import { ChatItemData, MessageData } from '../common/Types';


@Component
export struct ChatDetailPage {
  chat: ChatItemData = {} as ChatItemData;
  onBack: () => void = () => {};

  @State messageList: MessageData[] = [];
  @State inputMessage: string = '';

  // 将Scroller对象改为普通属性，不使用@State装饰
  private listScroller: Scroller = new Scroller();
  private inputController: TextInputController = new TextInputController();

  // 实现系统返回按钮回调

  @Link @Watch('backChange') is_back: boolean;//监听返回按钮传值
  backChange(): void {
    // this.onBack()
    this.onBack();
  }
  aboutToAppear():  void {
    // 模拟聊天数据


    this.messageList = [
      {
        id: 1,
        content: '你好，最近怎么样？',
        time: '10:30',
        isSelf: false,
        avatar: this.chat.avatar
      },
      {
        id: 2,
        content: '你猜',
        time: '10:31',
        isSelf: true,
        avatar: $r('app.media.my_avatar')
      },
      {
        id: 3,
        content: '猜个头头',
        time: '10:32',
        isSelf: false,
        avatar: this.chat.avatar
      }
    ];
  }


  // 滚动到底部
  scrollToBottom() {
    this.listScroller.scrollToIndex(this.messageList.length - 1);
  }

  // 发送消息
  sendMessage() {
    if (this.inputMessage.trim() !== '') {
      // 发送消息
      const newMessage: MessageData = {
        id: this.messageList.length + 1,
        content: this.inputMessage,
        time: new Date().toTimeString().substring(0, 5),
        isSelf: true,
        avatar: $r('app.media.my_avatar')
      };
      this.messageList.push(newMessage);
      this.inputMessage = ''; // 清空输入框

      // 滚动到底部
      setTimeout(() => {
        this.scrollToBottom();
      }, 100);
    } else {
      prompt.showToast({ message: '请输入消息内容' });
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      // 顶部标题栏
      Row() {
        Image($r('app.media.back_icon'))
          .width(24)
          .height(24)
          .onClick(() => {
            //返回
            this.onBack();
          })
        Text(this.chat.name)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 16 })
        Blank()
        Image($r('app.media.more_icon'))
          .width(24)
          .height(24)
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#EDEDED')
      .zIndex(99)
      .expandSafeArea([SafeAreaType.KEYBOARD]) // 配置键盘弹出安全区域

      // 聊天内容区域
      List({ space: 12, scroller: this.listScroller }) {
        ForEach(this.messageList, (message: MessageData) => {
          ListItem() {
            if (message.isSelf) {
              Row() {
                Blank()
                Column() {
                  Text(message.content)
                    .fontSize(16)
                    .backgroundColor('#95EC69')
                    .padding(10)
                    .borderRadius(8)
                    .margin({ right: 10 })
                }
                Image(message.avatar)
                  .width(40)
                  .height(40)
                  .borderRadius(4)
              }
              .width('100%')
              .padding({ left: 16, right: 16 })
            } else {
              Row() {
                Image(message.avatar)
                  .width(40)
                  .height(40)
                  .borderRadius(4)
                Column() {
                  Text(message.content)
                    .fontSize(16)
                    .backgroundColor(Color.White)
                    .padding(10)
                    .borderRadius(8)
                    .margin({ left: 10 })
                }
                Blank()
              }
              .width('100%')
              .padding({ left: 16, right: 16 })
            }
          }
        })
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#EDEDED')
      .padding({ top: 10, bottom: 10 })
      .onAppear(() => {
        // 列表加载完成后滚动到底部
        this.scrollToBottom();
      })

      // 底部输入区域
      Row() {
        Image($r('app.media.voice_icon'))
          .width(30)
          .height(30)

        TextInput({
          placeholder: '输入消息...',
          text: this.inputMessage,
          controller: this.inputController
        })
          .backgroundColor(Color.White)
          .borderRadius(4)
          .layoutWeight(1)
          .height(40)
          .margin({ left: 10, right: 10 })
          .onChange((value: string) => {
            this.inputMessage = value;
          })
          .onSubmit(() => {
            this.sendMessage();
          })
          .enterKeyType(EnterKeyType.Send)
          .maxLength(200)

        Image($r('app.media.emoji_icon'))
          .width(30)
          .height(30)
          .margin({ right: 10 })

        Image($r('app.media.more_functions_icon'))
          .width(30)
          .height(30)
          .onClick(() => {
            this.sendMessage();
          })
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#F7F7F7')
    }
    .width('100%')
    .height('100%')

  }
}