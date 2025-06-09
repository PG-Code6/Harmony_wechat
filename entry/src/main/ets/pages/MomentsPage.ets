import { MomentData } from '../common/Types';

@Component
export struct MomentsPage {
  onBack: () => void = () => {};
  
  @State momentsList: MomentData[] = [
    {
      id: 1,
      avatar: $r('app.media.avatar1'),
      name: '张三',
      content: '今天天气真好，出去玩了一天，心情舒畅！',
      images: [$r('app.media.moment_image1'), $r('app.media.moment_image2')],
      time: '10分钟前',
      likes: 5,
      comments: 2
    },
    {
      id: 2,
      avatar: $r('app.media.avatar2'),
      name: '李四',
      content: '分享一首最近很喜欢的歌曲，推荐给大家~',
      time: '1小时前',
      likes: 12,
      comments: 3
    },
    {
      id: 3,
      avatar: $r('app.media.avatar3'),
      name: '王五',
      content: '刚刚看了一部很棒的电影，剧情扣人心弦，强烈推荐！',
      images: [$r('app.media.moment_image3')],
      time: '2小时前',
      likes: 8,
      comments: 5
    },
    {
      id: 4,
      avatar: $r('app.media.avatar4'),
      name: '赵六',
      content: '周末去爬山，风景如画，心旷神怡~',
      images: [$r('app.media.moment_image4'), $r('app.media.moment_image5'), $r('app.media.moment_image6')],
      time: '昨天',
      likes: 20,
      comments: 8
    }
  ];

  build() {
    Column() {
      // 顶部区域
      Stack() {
        // 背景图
        Image($r('app.media.moments_bg'))
          .width('100%')
          .height(250)
          .objectFit(ImageFit.Cover)
        
        // 返回按钮
        Image($r('app.media.back_icon'))
          .width(24)
          .height(24)
          .position({ x: 16, y: 16 })
          .onClick(() => {
            this.onBack();
          })
        
        // 相机图标
        Image($r('app.media.camera_icon'))
          .width(24)
          .height(24)
          .position({ x: '90%', y: 16 })
        
        // 用户信息
        Row() {
          Text('我的朋友圈')
            .fontSize(18)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
          Blank()
          Image($r('app.media.my_avatar'))
            .width(70)
            .height(70)
            .borderRadius(4)
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
        .position({ x: 0, y: 180 })
      }
      .width('100%')
      .height(250)
      
      // 朋友圈列表
      List() {
        ForEach(this.momentsList, (moment: MomentData) => {
          ListItem() {
            Column() {
              // 用户信息
              Row() {
                Image(moment.avatar)
                  .width(50)
                  .height(50)
                  .borderRadius(4)
                
                Column() {
                  Text(moment.name)
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold)
                    .margin({ bottom: 5 })
                  
                  Text(moment.content)
                    .fontSize(14)
                    .margin({ bottom: 10 })
                  
                  // 图片展示
                  if (moment.images && moment.images.length > 0) {
                    Grid() {
                      ForEach(moment.images, (image: Resource) => {
                        GridItem() {
                          Image(image)
                            .width('100%')
                            .height(90)
                            .borderRadius(4)
                            .objectFit(ImageFit.Cover)
                        }
                      })
                    }
                    .columnsTemplate(moment.images.length === 1 ? '1fr' : moment.images.length === 2 ? '1fr 1fr' : '1fr 1fr 1fr')
                    .columnsGap(5)
                    .rowsGap(5)
                    .width('100%')
                    .height(moment.images.length <= 3 ? 90 : 185)
                    .margin({ bottom: 10 })
                  }
                  
                  // 底部信息
                  Row() {
                    Text(moment.time)
                      .fontSize(12)
                      .fontColor('#999999')
                    Blank()
                    Row() {
                      Image($r('app.media.like_icon'))
                        .width(16)
                        .height(16)
                      Text(moment.likes.toString())
                        .fontSize(12)
                        .fontColor('#999999')
                        .margin({ left: 5, right: 10 })
                      
                      Image($r('app.media.comment_icon'))
                        .width(16)
                        .height(16)
                      Text(moment.comments.toString())
                        .fontSize(12)
                        .fontColor('#999999')
                        .margin({ left: 5 })
                    }
                  }
                  .width('100%')
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
                .margin({ left: 10 })
              }
              .width('100%')
            }
            .width('100%')
            .padding({ left: 16, right: 16, top: 16, bottom: 16 })
            .backgroundColor(Color.White)
          }
          .margin({ bottom: 10 })
        })
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#EDEDED')
      
      // 底部发布按钮
      Button() {
        Image($r('app.media.add_icon'))
          .width(24)
          .height(24)
      }
      .width(60)
      .height(60)
      .backgroundColor('#07C160')
      .borderRadius(30)
      .position({ x: '80%', y: -80 })
    }
    .width('100%')
    .height('100%')
  }
} 