import prompt from '@ohos.promptAction';
import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import { UserInfo } from '../common/Types';

@Component
export struct ProfilePage {
  @State userInfo: UserInfo = {
    avatar: $r('app.media.my_avatar'),
    name: '微信用户',
    wechatId: 'wxid_123456'
  };
  @Link is_scrollable: boolean;
  @State context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  build() {
    Column() {
      // 顶部标题栏
      Row() {
        Text('我')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Blank()
        Image($r('app.media.scan_icon'))
          .width(24)
          .height(24)
          .margin({ right: 16 })
        Image($r('app.media.settings_icon'))
          .width(24)
          .height(24)
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#EDEDED')
      
      // 用户信息
      Row() {
        Image(this.userInfo.avatar)
          .width(70)
          .height(70)
          .borderRadius(4)
        
        Column() {
          Text(this.userInfo.name)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 5 })
          
          Row() {
            Text('微信号：' + this.userInfo.wechatId)
              .fontSize(14)
              .fontColor('#999999')
            Image($r('app.media.qrcode_icon'))
              .width(16)
              .height(16)
              .margin({ left: 10 })
          }
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 16 })
        .layoutWeight(1)
        
        Image($r('app.media.arrow_right'))
          .width(16)
          .height(16)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
      .backgroundColor(Color.White)
      .margin({ bottom: 10 })
      
      // 服务功能区
      Column() {
        // 支付
        Row() {
          Image($r('app.media.wallet_icon'))
            .width(24)
            .height(24)
            .margin({ right: 16 })
          Text('支付')
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
      .margin({ bottom: 10 })
      
      // 收藏与卡包
      Column() {
        // 收藏
        Row() {
          Image($r('app.media.favorite_icon'))
            .width(24)
            .height(24)
            .margin({ right: 16 })
          Text('收藏')
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
        
        Divider()
          .color('#EDEDED')
          .margin({ left: 56 })
        
        // 相册
        Row() {
          Image($r('app.media.photos_icon'))
            .width(24)
            .height(24)
            .margin({ right: 16 })
          Text('相册')
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
        
        Divider()
          .color('#EDEDED')
          .margin({ left: 56 })
        
        // 卡包
        Row() {
          Image($r('app.media.cards_icon'))
            .width(24)
            .height(24)
            .margin({ right: 16 })
          Text('卡包')
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
        
        Divider()
          .color('#EDEDED')
          .margin({ left: 56 })
        
        // 表情
        Row() {
          Image($r('app.media.emoji_icon'))
            .width(24)
            .height(24)
            .margin({ right: 16 })
          Text('表情')
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
      .margin({ bottom: 10 })
      
      // 设置
      Row() {
        Image($r('app.media.settings_icon'))
          .width(24)
          .height(24)
          .margin({ right: 16 })
        Text('设置')
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
      .margin({ bottom: 10 })
      .onClick(() => {
        // 退出登录
        prompt.showDialog({
          title: '退出登录',
          message: '确定要退出登录吗？',
          buttons: [
            {
              text: '取消',
              color: '#000000'
            },
            {
              text: '确定',
              color: '#FF0000'
            }
          ]
        }).then(result => {
          if (result.index === 1) {
            // 重启应用
            this.context.terminateSelf();
          }
        });
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EDEDED')
  }
} 