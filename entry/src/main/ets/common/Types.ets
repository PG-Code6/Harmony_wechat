// 聊天项类型
export interface ChatItemData {
  id: number;
  avatar: Resource;
  name: string;
  lastMessage: string;
  time: string;
  unreadCount: number;
}

// 消息类型
export interface MessageData {
  id: number;
  content: string;
  time: string;
  isSelf: boolean;
  avatar: Resource;
}

// 联系人类型
export interface ContactData {
  id: number;
  avatar: Resource;
  name: string;
  index: string;
}

// 联系人分组类型
export interface ContactGroupData {
  title: string;
  contacts: ContactData[];
}

// 朋友圈动态类型
export interface MomentData {
  id: number;
  avatar: Resource;
  name: string;
  content: string;
  images?: Resource[];
  time: string;
  likes: number;
  comments: number;
}

// 视频类型
export interface VideoData {
  id: number;
  cover: Resource;
  avatar: Resource;
  name: string;
  title: string;
  likes: number;
  comments: number;
  videoSrc: Resource;
}

// 用户信息类型
export interface UserInfo {
  avatar: Resource;
  name: string;
  wechatId: string;
} 