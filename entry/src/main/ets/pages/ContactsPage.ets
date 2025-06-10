import { ContactDetailPage } from './ContactDetailPage';
import { ContactData, ContactGroupData } from '../common/Types';

@Component
export struct ContactsPage {
  @State contactGroups: ContactGroupData[] = [];
  @Link is_scrollable: boolean;
  @Link is_back: boolean;

  @State indexList: string[] = [];
  @State showContactDetail: boolean = false;
  @State currentContact: ContactData = {} as ContactData;
  @State selectedIndex: number = 0;

  // 列表控制器
  private listScroller: Scroller = new Scroller();
  // 每个分组的起始位置
  private groupPositions: number[] = [];
  // 特殊联系人区域的高度（用于计算偏移量）
  private specialContactsHeight: number = 500; // 顶部标题栏+特殊联系人区域的估计高度

  // 添加底部栏控制回调函数
  hideTabBar?: () => void;
  showTabBar?: () => void;

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

    // 计算每个分组的起始位置
    this.calculateGroupPositions();
  }

  // 计算每个分组的起始位置
  calculateGroupPositions() {
    this.groupPositions = [];
    let position = 0;
    this.contactGroups.forEach(group => {
      this.groupPositions.push(position);
      // 每个组标题加上组内联系人数量
      position += 1 + group.contacts.length;
    });
  }

  // 滚动到指定索引的分组
  scrollToIndex(index: number) {
    if (index >= 0 && index < this.groupPositions.length) {
      // 滚动到对应位置，并设置选中索引
      this.listScroller.scrollToIndex(this.groupPositions[index]);
      this.selectedIndex = index;
    }
  }

  // 根据当前可见的第一项来更新选中的索引
  updateSelectedIndex(firstVisibleIndex: number) {
    for (let i = this.groupPositions.length - 1; i >= 0; i--) {
      if (firstVisibleIndex >= this.groupPositions[i]) {
        this.selectedIndex = i;
        break;
      }
    }
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      if (this.showContactDetail) {
        ContactDetailPage({
          contact: this.currentContact,
          is_back: this.is_back,
          onBack: () => {
            this.showContactDetail = false;
            this.is_scrollable = true;
            // 返回时显示底部栏
            if (this.showTabBar) {
              this.showTabBar();
            }
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
          .id('specialContacts')
          .onAreaChange((oldArea: Area, newArea: Area) => {
            // 获取特殊联系人区域的高度，用于计算偏移量
            this.specialContactsHeight = newArea.height as number + 56; // 加上标题栏高度
          })

          // 联系人列表
          List({ space: 0, initialIndex: 0, scroller: this.listScroller }) {
            ForEach(this.contactGroups, (group: ContactGroupData, groupIndex: number) => {
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
                      // 进入联系人详情页面时隐藏底部栏
                      if (this.hideTabBar) {
                        this.hideTabBar();
                      }
                    })
                  }
                })
              }
            })
          }
          .sticky(StickyStyle.Header)
          .width('100%')
          .layoutWeight(1)
          .backgroundColor('#EDEDED')
          .onScrollIndex((firstIndex: number) => {
            this.updateSelectedIndex(firstIndex);
          })

          // 右侧索引栏
          AlphabetIndexer({
            arrayValue: this.indexList,
            selected: this.selectedIndex
          })
            .itemSize(16)
            .font({ size: 12 })
            .selectedFont({ size: 14, weight: FontWeight.Bold })
            .popupFont({ size: 30, weight: FontWeight.Bold })
            .usingPopup(true)
            .selectedColor('#07C160')
            .popupColor('#07C160')
            .alignStyle(IndexerAlign.Right)
            .position({ x: '90%', y: '30%' })
            .onSelect((index: number) => {
              this.scrollToIndex(index);
            })
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
      .id(`header-${title}`)
  }
}