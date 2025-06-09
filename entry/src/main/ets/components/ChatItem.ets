import { ChatItemData } from '../common/Types';

@Component
export struct ChatItem {
  chat: ChatItemData = {} as ChatItemData;
  onItemClick?: () => void;

  build() {
    Row() {
      // 头像
      Stack() {
        Image(this.chat.avatar)
          .width(50)
          .height(50)
          .borderRadius(4)

        if (this.chat.unreadCount > 0) {
          Text(this.chat.unreadCount.toString())
            .fontSize(12)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .borderRadius(10)
            .width(this.chat.unreadCount > 9 ? 20 : 16)
            .height(16)
            .textAlign(TextAlign.Center)
            .position({ x: 35, y: -5 })
        }
      }
      .width(50)
      .height(50)

      // 聊天信息
      Column() {
        Row() {
          Text(this.chat.name)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Blank()
          Text(this.chat.time)
            .fontSize(12)
            .fontColor('#999999')
        }
        .width('100%')

        Text(this.chat.lastMessage)
          .fontSize(14)
          .fontColor('#999999')
          .margin({ top: 4 })
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .layoutWeight(1)
      .margin({ left: 10 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height(70)
    .padding({ left: 16, right: 16 })
    .backgroundColor(Color.White)
    .onClick(() => {
      if (this.onItemClick) {
        this.onItemClick();
      }
    })
  }
} 