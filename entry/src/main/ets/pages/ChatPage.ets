import { ChatItem } from '../components/ChatItem';
import { ChatDetailPage } from './ChatDetailPage';
import { ChatItemData } from '../common/Types';

@Component
export struct ChatPage {
  @State chatList: ChatItemData[] = [
    {
      id: 1,
      avatar: $r('app.media.avatar1'),
      name: '张三',
      lastMessage: '你好，最近怎么样？',
      time: '10:30',
      unreadCount: 2
    },
    {
      id: 2,
      avatar: $r('app.media.avatar2'),
      name: '李四',
      lastMessage: '周末有空一起吃饭吗？',
      time: '昨天',
      unreadCount: 0
    },
    {
      id: 3,
      avatar: $r('app.media.avatar3'),
      name: '微信团队',
      lastMessage: '微信版本更新通知',
      time: '星期一',
      unreadCount: 1
    },
    {
      id: 4,
      avatar: $r('app.media.avatar4'),
      name: '王五',
      lastMessage: '[图片]',
      time: '星期日',
      unreadCount: 0
    },
    {
      id: 5,
      avatar: $r('app.media.avatar5'),
      name: '朋友圈',
      lastMessage: '[有人点赞了你的朋友圈]',
      time: '12-01',
      unreadCount: 5
    }
  ];

  @State showChatDetail: boolean = false;
  @State currentChat: ChatItemData = {} as ChatItemData;

  // 添加底部栏控制回调函数
  hideTabBar?: () => void;
  showTabBar?: () => void;
  @Link is_scrollable: boolean
  build() {
    Stack({ alignContent: Alignment.Center }) {
      if (this.showChatDetail) {
        ChatDetailPage({
          chat: this.currentChat,
          onBack: () => {
            this.showChatDetail = false;
            // 返回时显示底部栏
            if (this.showTabBar) {
              this.showTabBar();
            }
            this.is_scrollable = true;
          }
        })
      } else {
        Column() {
          // 顶部标题栏
          Row() {
            Text('微信')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
            Blank()
            Image($r('app.media.search_icon'))
              .width(24)
              .height(24)
              .margin({ right: 16 })
            Image($r('app.media.add_icon'))
              .width(24)
              .height(24)
          }
          .width('100%')
          .height(56)
          .padding({ left: 16, right: 16 })
          .backgroundColor('#EDEDED')

          // 聊天列表
          List() {
            ForEach(this.chatList, (chat: ChatItemData) => {
              ListItem() {
                ChatItem({
                  chat: chat,
                  onItemClick: () => {
                    this.currentChat = chat;
                    this.showChatDetail = true;
                    this.is_scrollable = false;
                    // 进入聊天详情页面时隐藏底部栏
                    if (this.hideTabBar) {
                      this.hideTabBar();
                    }
                  }
                })
              }
            })
          }
          .width('100%')
          .layoutWeight(1)
          .divider({ strokeWidth: 1, color: '#EDEDED' })
        }
        .width('100%')
        .height('100%')
      }
    }
    .width('100%')
    .height('100%')
  }
}