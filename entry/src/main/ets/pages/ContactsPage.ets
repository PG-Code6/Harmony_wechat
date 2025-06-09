import { ContactDetailPage } from './ContactDetailPage';
import { ContactData, ContactGroupData } from '../common/Types';

@Component
export struct ContactsPage {
  @State contactGroups: ContactGroupData[] = [];
  @Link is_scrollable:  boolean;

  @State indexList: string[] = [];
  @State showContactDetail: boolean = false;
  @State currentContact: ContactData = {} as ContactData;


  aboutToAppear() {
    // 模拟通讯录数据
    const contacts: ContactData[] = [
      { id: 1, avatar: $r('app.media.avatar1'), name: '阿里巴巴', index: 'A' },
      { id: 2, avatar: $r('app.media.avatar2'), name: '百度', index: 'B' },
      { id: 3, avatar: $r('app.media.avatar3'), name: '陈小明', index: 'C' },
      { id: 4, avatar: $r('app.media.avatar4'), name: '丁一', index: 'D' },
      { id: 5, avatar: $r('app.media.avatar5'), name: '方二', index: 'F' },
      { id: 6, avatar: $r('app.media.avatar1'), name: '高三', index: 'G' },
      { id: 7, avatar: $r('app.media.avatar2'), name: '黄四', index: 'H' },
      { id: 8, avatar: $r('app.media.avatar3'), name: '李五', index: 'L' },
      { id: 9, avatar: $r('app.media.avatar3'), name: '刘六', index: 'L' },
      { id: 10, avatar: $r('app.media.avatar4'), name: '孙七', index: 'S' },
      { id: 11, avatar: $r('app.media.avatar5'), name: '王八', index: 'W' },
      { id: 12, avatar: $r('app.media.avatar4'), name: '徐九', index: 'X' },
      { id: 13, avatar: $r('app.media.avatar5'), name: '杨十', index: 'Y' },
      { id: 14, avatar: $r('app.media.avatar3'), name: '张十一', index: 'Z' }
    ];

    // 按首字母分组
    const groups: Record<string, ContactData[]> = {};
    contacts.forEach(contact => {
      if (!groups[contact.index]) {
        groups[contact.index] = [];
      }
      groups[contact.index].push(contact);
    });

    // 转换为数组并排序
    this.contactGroups = Object.keys(groups).sort().map(key => {
      return {
        title: key,
        contacts: groups[key]
      } as ContactGroupData;
    });

    // 生成索引列表
    this.indexList = this.contactGroups.map(group => group.title);
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      if (this.showContactDetail) {
        ContactDetailPage({
          contact: this.currentContact,
          onBack: () => {
            this.showContactDetail = false;
            this.is_scrollable = true;
          }
        })
      } else {
        Column() {
          // 顶部标题栏
          Row() {
            Text('通讯录')
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

          // 特殊联系人
          Column() {
            Row() {
              Image($r('app.media.new_friends_icon'))
                .width(40)
                .height(40)
                .borderRadius(4)
              Text('新的朋友')
                .fontSize(16)
                .margin({ left: 12 })
              Blank()
              Image($r('app.media.arrow_right'))
                .width(16)
                .height(16)
            }
            .width('100%')
            .height(60)
            .padding({ left: 16, right: 16 })
            .backgroundColor(Color.White)

            Row() {
              Image($r('app.media.group_chats_icon'))
                .width(40)
                .height(40)
                .borderRadius(4)
              Text('群聊')
                .fontSize(16)
                .margin({ left: 12 })
              Blank()
              Image($r('app.media.arrow_right'))
                .width(16)
                .height(16)
            }
            .width('100%')
            .height(60)
            .padding({ left: 16, right: 16 })
            .backgroundColor(Color.White)

            Row() {
              Image($r('app.media.tags_icon'))
                .width(40)
                .height(40)
                .borderRadius(4)
              Text('标签')
                .fontSize(16)
                .margin({ left: 12 })
              Blank()
              Image($r('app.media.arrow_right'))
                .width(16)
                .height(16)
            }
            .width('100%')
            .height(60)
            .padding({ left: 16, right: 16 })
            .backgroundColor(Color.White)

            Row() {
              Image($r('app.media.official_accounts_icon'))
                .width(40)
                .height(40)
                .borderRadius(4)
              Text('公众号')
                .fontSize(16)
                .margin({ left: 12 })
              Blank()
              Image($r('app.media.arrow_right'))
                .width(16)
                .height(16)
            }
            .width('100%')
            .height(60)
            .padding({ left: 16, right: 16 })
            .backgroundColor(Color.White)
          }
          .width('100%')
          .margin({ bottom: 10 })

          // 联系人列表
          List() {
            ForEach(this.contactGroups, (group: ContactGroupData) => {
              ListItemGroup({ header: this.GroupHeader(group.title) }) {
                ForEach(group.contacts, (contact: ContactData) => {
                  ListItem() {
                    Row() {
                      Image(contact.avatar)
                        .width(40)
                        .height(40)
                        .borderRadius(4)
                      Text(contact.name)
                        .fontSize(16)
                        .margin({ left: 12 })
                      Blank()
                    }
                    .width('100%')
                    .height(60)
                    .padding({ left: 16, right: 16 })
                    .backgroundColor(Color.White)
                    .onClick(() => {
                      this.currentContact = contact;
                      this.showContactDetail = true;
                      //禁用滑动
                      this.is_scrollable = false;
                    })
                  }
                })
              }
            })
          }
          .width('100%')
          .layoutWeight(1)
          .backgroundColor('#EDEDED')

          // 右侧索引栏
          AlphabetIndexer({ arrayValue: this.indexList, selected: 0 })
            .itemSize(16)
            .font({ size: 12 })
            .selectedFont({ size: 14, weight: FontWeight.Bold })
            .popupFont({ size: 30, weight: FontWeight.Bold })
            .usingPopup(true)
            .selectedColor('#07C160')
            .popupColor('#07C160')
            .alignStyle(IndexerAlign.Right)
            .position({ x: '90%', y: '30%' })
        }
        .width('100%')
        .height('100%')
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder GroupHeader(title: string) {
    Text(title)
      .fontSize(14)
      .fontColor('#999999')
      .backgroundColor('#EDEDED')
      .width('100%')
      .height(30)
      .padding({ left: 16 })
  }
}