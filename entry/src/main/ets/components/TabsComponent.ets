import { ChatPage } from '../pages/ChatPage';
import { ContactsPage } from '../pages/ContactsPage';
import { DiscoverPage } from '../pages/DiscoverPage';
import { ProfilePage } from '../pages/ProfilePage';

@Component
export struct TabsComponent {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder TabBuilder(title: string, index: number, normalImg: Resource, selectedImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .width(24)
        .height(24)
      Text(title)
        .fontSize(12)
        .fontColor(this.currentIndex === index ? '#07C160' : '#7D7E80')
        .margin({ top: 4 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(index);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        ChatPage()
      }
      .tabBar(this.TabBuilder('聊天', 0, $r('app.media.chat_normal'), $r('app.media.chat_selected')))

      TabContent() {
        ContactsPage()
      }
      .tabBar(this.TabBuilder('通讯录', 1, $r('app.media.contacts_normal'), $r('app.media.contacts_selected')))

      TabContent() {
        DiscoverPage()
      }
      .tabBar(this.TabBuilder('发现', 2, $r('app.media.discover_normal'), $r('app.media.discover_selected')))

      TabContent() {
        ProfilePage()
      }
      .tabBar(this.TabBuilder('我', 3, $r('app.media.me_normal'), $r('app.media.me_selected')))
    }
    .barHeight(56)
    .width('100%')
    .height('100%')
    .backgroundColor('#ffffff')
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}