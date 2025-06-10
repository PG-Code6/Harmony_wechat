import { ChatDetailPage } from './ChatDetailPage';
import { ContactData, ChatItemData } from '../common/Types';

@Component
export struct ContactDetailPage {
  contact: ContactData = {} as ContactData;
  onBack: () => void = () => {};

  
  @State showChat: boolean = false;
  is_back_use:  boolean = true;
  @Link @Watch('backChange') is_back: boolean;//监听返回按钮传值
  backChange(): void {
    // this.onBack()
    if(this.is_back_use == true){
      this.onBack();
    }
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      if (this.showChat) {
        ChatDetailPage({
          is_back: this.is_back,
          chat: {
            id: this.contact.id,
            avatar: this.contact.avatar,
            name: this.contact.name,
            lastMessage: '',
            time: '',
            unreadCount: 0
          } as ChatItemData,
          onBack: () => {
            this.showChat = false;
            this.is_back_use = true;
          }
        })
      } else {
        Column() {
          // 顶部标题栏
          Row() {
            Image($r('app.media.back_icon'))
              .width(24)
              .height(24)
              .onClick(() => {
                this.onBack();
              })
            Text('详细资料')
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
          
          // 联系人基本信息
          Column() {
            Image(this.contact.avatar)
              .width(80)
              .height(80)
              .borderRadius(8)
              .margin({ top: 20, bottom: 10 })
            
            Text(this.contact.name)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })
            
            Text('微信号：wx_' + this.contact.id)
              .fontSize(14)
              .fontColor('#999999')
              .margin({ bottom: 20 })
            
            Row() {
              Column() {
                Image($r('app.media.chat_icon'))
                  .width(30)
                  .height(30)
                Text('发消息')
                  .fontSize(12)
                  .margin({ top: 5 })
              }
              .width(60)
              .onClick(() => {
                this.showChat = true;
                this.is_back_use = false;
              })
              
              Column() {
                Image($r('app.media.video_call_icon'))
                  .width(30)
                  .height(30)
                Text('视频通话')
                  .fontSize(12)
                  .margin({ top: 5 })
              }
              .width(60)
              .margin({ left: 30, right: 30 })
              
              Column() {
                Image($r('app.media.voice_call_icon'))
                  .width(30)
                  .height(30)
                Text('语音通话')
                  .fontSize(12)
                  .margin({ top: 5 })
              }
              .width(60)
            }
            .margin({ bottom: 20 })
          }
          .width('100%')
          .backgroundColor(Color.White)
          .padding({ bottom: 20 })
          
          // 朋友圈
          Column() {
            Row() {
              Text('朋友圈')
                .fontSize(16)
              Blank()
              Image($r('app.media.arrow_right'))
                .width(16)
                .height(16)
            }
            .width('100%')
            .height(50)
            .padding({ left: 16, right: 16 })
            .backgroundColor(Color.White)
            
            Divider()
              .color('#EDEDED')
              .margin({ left: 16 })
            
            Row() {
              Text('更多信息')
                .fontSize(16)
              Blank()
              Image($r('app.media.arrow_right'))
                .width(16)
                .height(16)
            }
            .width('100%')
            .height(50)
            .padding({ left: 16, right: 16 })
            .backgroundColor(Color.White)
          }
          .margin({ top: 10 })
          
          // 底部操作按钮
          Button('设置备注和标签')
            .width('90%')
            .height(45)
            .backgroundColor(Color.White)
            .fontColor('#333333')
            .margin({ top: 20 })
            .borderRadius(4)
          
          Button('把他推荐给朋友')
            .width('90%')
            .height(45)
            .backgroundColor(Color.White)
            .fontColor('#333333')
            .margin({ top: 10 })
            .borderRadius(4)
          
          Button('加入黑名单')
            .width('90%')
            .height(45)
            .backgroundColor(Color.White)
            .fontColor('#FF0000')
            .margin({ top: 10 })
            .borderRadius(4)
          
          Button('投诉')
            .width('90%')
            .height(45)
            .backgroundColor(Color.White)
            .fontColor('#333333')
            .margin({ top: 10 })
            .borderRadius(4)
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#EDEDED')
      }
    }
    .width('100%')
    .height('100%')
  }
} 