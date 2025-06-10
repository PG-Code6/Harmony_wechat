import { MomentsPage } from './MomentsPage';
import { ShortVideoPage } from './ShortVideoPage';

@Component
export struct DiscoverPage {
  @State showMoments: boolean = false;
  @State showShortVideo: boolean = false;
  @Link is_scrollable: boolean;
  @Link is_back: boolean;

  // 添加底部栏控制回调函数
  hideTabBar?: () => void;
  showTabBar?: () => void;

  build() {
    Stack({ alignContent: Alignment.Center }) {
      if (this.showMoments) {
        MomentsPage({
          is_back: this.is_back,
          onBack: () => {
            this.showMoments = false;
            this.is_scrollable = true;
            // 返回时显示底部栏
            if (this.showTabBar) {
              this.showTabBar();
            }
          }
        })
      } else if (this.showShortVideo) {
        ShortVideoPage({
          is_back: this.is_back,
          onBack: () => {
            this.showShortVideo = false;
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
            Text('发现')
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

          // 功能列表
          List() {
            ListItem() {
              Row() {
                Image($r('app.media.moments_icon'))
                  .width(24)
                  .height(24)
                  .margin({ right: 16 })
                Text('朋友圈')
                  .fontSize(16)
                Blank()
                Image($r('app.media.arrow_right'))
                  .width(16)
                  .height(16)
              }
              .width('100%')
              .height(56)
              .padding({ left: 16, right: 16 })
              .backgroundColor(Color.White)
              .onClick(() => {
                this.showMoments = true;
                this.is_scrollable = false;
                // 进入朋友圈页面时隐藏底部栏
                if (this.hideTabBar) {
                  this.hideTabBar();
                }
              })
            }

            ListItem() {
              Row() {
                Image($r('app.media.short_video_icon'))
                  .width(24)
                  .height(24)
                  .margin({ right: 16 })
                Text('视频号')
                  .fontSize(16)
                Blank()
                Image($r('app.media.arrow_right'))
                  .width(16)
                  .height(16)
              }
              .width('100%')
              .height(56)
              .padding({ left: 16, right: 16 })
              .backgroundColor(Color.White)
              .onClick(() => {
                this.showShortVideo = true;
                //  关闭滑动
                this.is_scrollable = false;
                // 进入短视频页面时隐藏底部栏
                if (this.hideTabBar) {
                  this.hideTabBar();
                }
              })
            }
            .margin({ top: 10 })

            ListItem() {
              Row() {
                Image($r('app.media.scan_icon'))
                  .width(24)
                  .height(24)
                  .margin({ right: 16 })
                Text('扫一扫')
                  .fontSize(16)
                Blank()
                Image($r('app.media.arrow_right'))
                  .width(16)
                  .height(16)
              }
              .width('100%')
              .height(56)
              .padding({ left: 16, right: 16 })
              .backgroundColor(Color.White)
            }
            .margin({ top: 10 })

            ListItem() {
              Row() {
                Image($r('app.media.shake_icon'))
                  .width(24)
                  .height(24)
                  .margin({ right: 16 })
                Text('摇一摇')
                  .fontSize(16)
                Blank()
                Image($r('app.media.arrow_right'))
                  .width(16)
                  .height(16)
              }
              .width('100%')
              .height(56)
              .padding({ left: 16, right: 16 })
              .backgroundColor(Color.White)
            }

            ListItem() {
              Row() {
                Image($r('app.media.search_icon'))
                  .width(24)
                  .height(24)
                  .margin({ right: 16 })
                Text('搜一搜')
                  .fontSize(16)
                Blank()
                Image($r('app.media.arrow_right'))
                  .width(16)
                  .height(16)
              }
              .width('100%')
              .height(56)
              .padding({ left: 16, right: 16 })
              .backgroundColor(Color.White)
            }
            .margin({ top: 10 })

            ListItem() {
              Row() {
                Image($r('app.media.nearby_icon'))
                  .width(24)
                  .height(24)
                  .margin({ right: 16 })
                Text('附近')
                  .fontSize(16)
                Blank()
                Image($r('app.media.arrow_right'))
                  .width(16)
                  .height(16)
              }
              .width('100%')
              .height(56)
              .padding({ left: 16, right: 16 })
              .backgroundColor(Color.White)
            }

            ListItem() {
              Row() {
                Image($r('app.media.mini_programs_icon'))
                  .width(24)
                  .height(24)
                  .margin({ right: 16 })
                Text('小程序')
                  .fontSize(16)
                Blank()
                Image($r('app.media.arrow_right'))
                  .width(16)
                  .height(16)
              }
              .width('100%')
              .height(56)
              .padding({ left: 16, right: 16 })
              .backgroundColor(Color.White)
            }
            .margin({ top: 10 })
          }
          .width('100%')
          .layoutWeight(1)
          .backgroundColor('#EDEDED')
        }
        .width('100%')
        .height('100%')
      }
    }
    .width('100%')
    .height('100%')
  }
}