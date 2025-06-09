import { MomentsPage } from './MomentsPage';
import { ShortVideoPage } from './ShortVideoPage';

@Component
export struct DiscoverPage {
  @State showMoments: boolean = false;
  @State showShortVideo: boolean = false;

  build() {
    Stack({ alignContent: Alignment.Center }) {
      if (this.showMoments) {
        MomentsPage({
          onBack: () => {
            this.showMoments = false;
          }
        })
      } else if (this.showShortVideo) {
        ShortVideoPage({
          onBack: () => {
            this.showShortVideo = false;
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