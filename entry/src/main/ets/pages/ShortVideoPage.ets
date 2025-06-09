import { VideoData } from '../common/Types';

@Component
export struct ShortVideoPage {
  onBack: () => void = () => {};
  
  @State videoList: VideoData[] = [
    {
      id: 1,
      cover: $r('app.media.video_cover1'),
      avatar: $r('app.media.avatar1'),
      name: '张三',
      title: '今天去了动物园，看到了很多可爱的动物',
      likes: 1256,
      comments: 89
    },
    {
      id: 2,
      cover: $r('app.media.video_cover2'),
      avatar: $r('app.media.avatar2'),
      name: '李四',
      title: '分享一段舞蹈视频，希望大家喜欢',
      likes: 3452,
      comments: 120
    },
    {
      id: 3,
      cover: $r('app.media.video_cover3'),
      avatar: $r('app.media.avatar3'),
      name: '王五',
      title: '美食制作教程：红烧肉的做法',
      likes: 2890,
      comments: 245
    }
  ];
  
  @State currentIndex: number = 0;

  build() {
    Column() {
      // 顶部标题栏
      Row() {
        Image($r('app.media.back_icon'))
          .width(24)
          .height(24)
          .onClick(() => {
            this.onBack();
          })
        Text('视频号')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 16 })
        Blank()
        Image($r('app.media.search_icon'))
          .width(24)
          .height(24)
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#000000')
      
      // 视频内容
      Swiper() {
        ForEach(this.videoList, (video: VideoData) => {
          Stack() {
            // 视频封面
            Image(video.cover)
              .width('100%')
              .height('100%')
              .objectFit(ImageFit.Cover)
            
            // 视频控制层
            Column() {
              Blank()
              
              // 底部信息
              Row() {
                // 左侧视频信息
                Column() {
                  Row() {
                    Image(video.avatar)
                      .width(40)
                      .height(40)
                      .borderRadius(20)
                    Text(video.name)
                      .fontSize(16)
                      .fontColor(Color.White)
                      .fontWeight(FontWeight.Bold)
                      .margin({ left: 10 })
                    Button('关注')
                      .width(60)
                      .height(30)
                      .fontSize(14)
                      .fontColor('#07C160')
                      .backgroundColor('rgba(0, 0, 0, 0.5)')
                      .borderRadius(15)
                      .margin({ left: 10 })
                  }
                  .margin({ bottom: 10 })
                  
                  Text(video.title)
                    .fontSize(14)
                    .fontColor(Color.White)
                    .maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
                
                // 右侧操作按钮
                Column({ space: 20 }) {
                  Column() {
                    Image($r('app.media.like_icon'))
                      .width(30)
                      .height(30)
                      .fillColor(Color.White)
                    Text(this.formatNumber(video.likes))
                      .fontSize(12)
                      .fontColor(Color.White)
                  }
                  
                  Column() {
                    Image($r('app.media.comment_icon'))
                      .width(30)
                      .height(30)
                      .fillColor(Color.White)
                    Text(this.formatNumber(video.comments))
                      .fontSize(12)
                      .fontColor(Color.White)
                  }
                  
                  Column() {
                    Image($r('app.media.share_icon'))
                      .width(30)
                      .height(30)
                      .fillColor(Color.White)
                    Text('分享')
                      .fontSize(12)
                      .fontColor(Color.White)
                  }
                  
                  Column() {
                    Image($r('app.media.more_icon'))
                      .width(30)
                      .height(30)
                      .fillColor(Color.White)
                    Text('更多')
                      .fontSize(12)
                      .fontColor(Color.White)
                  }
                }
                .alignItems(HorizontalAlign.Center)
                .margin({ left: 20 })
              }
              .width('100%')
              .padding({ left: 16, right: 16, bottom: 20 })
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.End)
            
            // 播放按钮
            Image($r('app.media.play_icon'))
              .width(60)
              .height(60)
              .fillColor('rgba(255, 255, 255, 0.6)')
          }
          .width('100%')
          .height('100%')
        })
      }
      .width('100%')
      .layoutWeight(1)
      .index(this.currentIndex)
      .indicator(false)
      .loop(true)
      .vertical(true)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000000')
  }
  
  formatNumber(num: number): string {
    if (num >= 10000) {
      return (num / 10000).toFixed(1) + 'w';
    } else if (num >= 1000) {
      return (num / 1000).toFixed(1) + 'k';
    }
    return num.toString();
  }
} 