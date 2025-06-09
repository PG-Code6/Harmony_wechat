import { VideoData } from '../common/Types';
import prompt from '@ohos.promptAction';

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
      comments: 89,
      videoSrc: $rawfile("video1.mp4")
    },
    {
      id: 2,
      cover: $r('app.media.video_cover2'),
      avatar: $r('app.media.avatar2'),
      name: '李四',
      title: '分享一段舞蹈视频，希望大家喜欢',
      likes: 3452,
      comments: 120,
      videoSrc: $rawfile("video1.mp4")
    },
    {
      id: 3,
      cover: $r('app.media.video_cover3'),
      avatar: $r('app.media.avatar3'),
      name: '王五',
      title: '美食制作教程：红烧肉的做法',
      likes: 2890,
      comments: 245,
      videoSrc: $rawfile("video1.mp4")
    }
  ];

  @State currentIndex: number = 0;
  @State isPlaying: boolean[] = [false, false, false];
  @State isLoading: boolean[] = [false, false, false];
  @State isLiked: boolean[] = [false, false, false];
  @State isFavorite: boolean[] = [false, false, false];
  private videoControllers: VideoController[] = [
    new VideoController(),
    new VideoController(),
    new VideoController()
  ];

  aboutToAppear() {
    // 页面加载后自动播放当前视频
    this.startPlayingCurrentVideo();
  }

  // 开始播放当前视频
  startPlayingCurrentVideo() {
    setTimeout(() => {
      this.playVideo(this.currentIndex);
    }, 300);
  }

  // 播放视频
  playVideo(index: number) {
    if (this.isLoading[index]) {
      return; // 如果视频正在加载中，不响应点击
    }

    if (!this.isPlaying[index]) {
      // 如果视频未播放，开始播放
      this.isLoading[index] = true; // 标记为加载中
      this.isPlaying[index] = true;

      try {
        this.videoControllers[index].start();
      } catch (err) {
        console.error(`视频播放错误: ${JSON.stringify(err)}`);
        this.isPlaying[index] = false;
        this.isLoading[index] = false;
        prompt.showToast({ message: '视频播放失败，请重试' });
      }
    } else {
      // 如果视频正在播放，暂停
      try {
        this.videoControllers[index].pause();
        this.isPlaying[index] = false;
      } catch (err) {
        console.error(`视频暂停错误: ${JSON.stringify(err)}`);
      }
    }
  }

  // 点赞操作
  toggleLike(index: number) {
    this.isLiked[index] = !this.isLiked[index];
    if (this.isLiked[index]) {
      this.videoList[index].likes += 1;
    } else {
      this.videoList[index].likes -= 1;
    }
  }

  // 收藏操作
  toggleFavorite(index: number) {
    this.isFavorite[index] = !this.isFavorite[index];
    prompt.showToast({
      message: this.isFavorite[index] ? '已收藏' : '已取消收藏',
      duration: 2000
    });
  }

  // 分享操作
  shareVideo(index: number) {
    prompt.showToast({
      message: '分享功能开发中',
      duration: 2000
    });
  }

  build() {
    Column() {
      // 顶部标题栏
      Row() {
        Image($r('app.media.back_icon'))
          .width(24)
          .height(24)
          .fillColor(Color.White)
          .onClick(() => {
            this.onBack();
          })
        Blank()
        Image($r('app.media.search_icon'))
          .width(24)
          .height(24)
          .fillColor(Color.White)
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor('rgba(0, 0, 0, 0.2)')
      .position({ x: 0, y: 0 })
      .zIndex(2)

      // 视频内容
      Swiper() {
        ForEach(this.videoList, (video: VideoData, index: number) => {
          Stack() {
            // 视频播放器或封面
            if (this.isPlaying[index]) {
              Video({
                src: video.videoSrc,
                controller: this.videoControllers[index]
              })
                .width('100%')
                .height('100%')
                .objectFit(ImageFit.Cover)
                .autoPlay(false)
                .controls(false)
                .loop(true)
                .onPrepared(() => {
                  console.info(`视频${index}准备完成`);
                  this.isLoading[index] = false;
                  if (this.isPlaying[index]) {
                    this.videoControllers[index].start();
                  }
                })
                .onStart(() => {
                  console.info(`视频${index}开始播放`);
                  this.isPlaying[index] = true;
                  this.isLoading[index] = false;
                })
                .onPause(() => {
                  console.info(`视频${index}暂停`);
                  this.isPlaying[index] = false;
                })
                .onFinish(() => {
                  console.info(`视频${index}播放完成`);
                })
                .onError(() => {
                  console.error(`视频${index}播放错误`);
                  this.isPlaying[index] = false;
                  this.isLoading[index] = false;
                  prompt.showToast({ message: '视频加载失败，请重试' });
                })
            } else {
              Image(video.cover)
                .width('100%')
                .height('100%')
                .objectFit(ImageFit.Cover)
            }

            // 右侧操作按钮区域
            Column({ space: 20 }) {
              // 点赞
              Column() {
                Image(this.isLiked[index] ? $r('app.media.like_filled_icon') : $r('app.media.like_icon'))
                  .width(36)
                  .height(36)
                  .fillColor(this.isLiked[index] ? '#FF4D4F' : Color.White)
                  .onClick(() => {
                    this.toggleLike(index);
                  })
                Text(this.formatNumber(video.likes))
                  .fontSize(14)
                  .fontColor(Color.White)
              }
              .alignItems(HorizontalAlign.Center)

              // 评论
              Column() {
                Image($r('app.media.comment_icon'))
                  .width(36)
                  .height(36)
                  .fillColor(Color.White)
                Text(this.formatNumber(video.comments))
                  .fontSize(14)
                  .fontColor(Color.White)
              }
              .alignItems(HorizontalAlign.Center)

              // 收藏
              Column() {
                Image(this.isFavorite[index] ? $r('app.media.star_filled_icon') : $r('app.media.star_icon'))
                  .width(36)
                  .height(36)
                  .fillColor(this.isFavorite[index] ? '#FFCC00' : Color.White)
                  .onClick(() => {
                    this.toggleFavorite(index);
                  })
                Text('收藏')
                  .fontSize(14)
                  .fontColor(Color.White)
              }
              .alignItems(HorizontalAlign.Center)

              // 分享
              Column() {
                Image($r('app.media.share_icon'))
                  .width(36)
                  .height(36)
                  .fillColor(Color.White)
                  .onClick(() => {
                    this.shareVideo(index);
                  })
                Text('分享')
                  .fontSize(14)
                  .fontColor(Color.White)
              }
              .alignItems(HorizontalAlign.Center)
            }
            .position({ x: '92%', y: '40%' })
            .zIndex(1)
            .translate({ x: '-50%', y: 0 })

            // 底部个人信息区域
            Row() {
              // 用户头像和信息
              Row() {
                Image(video.avatar)
                  .width(44)
                  .height(44)
                  .borderRadius(22)
                  .border({ width: 1, color: Color.White })

                Column() {
                  Text(video.name)
                    .fontSize(16)
                    .fontColor(Color.White)
                    .fontWeight(FontWeight.Bold)
                    .margin({ bottom: 4 })

                  Text(video.title)
                    .fontSize(14)
                    .fontColor(Color.White)
                    .opacity(0.9)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)
                .margin({ left: 12 })
              }
              .layoutWeight(1)

              // 关注按钮
              Button() {
                Text('关注')
                  .fontSize(14)
                  .fontColor(Color.White)
              }
              .width(70)
              .height(32)
              .backgroundColor('#07C160')
              .borderRadius(16)
            }
            .width('100%')
            .padding({ left: 16, right: 16, top: 12, bottom: 12 })
            .backgroundColor('#000000')
            .position({ x: 0, y: '100%' })
            .translate({ y: '-100%' })
            .zIndex(1)

            // 播放按钮覆盖层 - 仅在未播放且加载中时显示
            if (!this.isPlaying[index] && this.isLoading[index]) {
              Column() {
                LoadingProgress()
                  .width(60)
                  .height(60)
                  .color(Color.White)
              }
              .width('100%')
              .height('100%')
              .justifyContent(FlexAlign.Center)
              .backgroundColor('rgba(0, 0, 0, 0.2)')
            }

            // 整体点击层
            Column()
              .width('100%')
              .height('100%')
              .onClick(() => {
                this.playVideo(index);
              })
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
        // 切换视频时，暂停当前视频
        if (this.isPlaying[this.currentIndex]) {
          try {
            this.videoControllers[this.currentIndex].pause();
          } catch (err) {
            console.error(`暂停视频失败: ${JSON.stringify(err)}`);
          }
          this.isPlaying[this.currentIndex] = false;
          this.isLoading[this.currentIndex] = false;
        }

        // 更新当前索引并自动播放新视频
        this.currentIndex = index;
        this.startPlayingCurrentVideo();
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