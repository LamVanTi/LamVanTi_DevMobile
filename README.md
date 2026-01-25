#TÌM TRỌ


# 🏠 [Tìm Trọ]

<img width="363" height="765" alt="image" src="https://github.com/user-attachments/assets/46c8e541-f36f-46ac-955b-94e369e6bc11" />

## 🚀 Giới Thiệu

[Tìm Trọ] là ứng dụng di động giúp **tìm và quản lý phòng trọ hiệu quả**, tích hợp các tính năng hỗ trợ:

- Tìm kiếm phòng trọ theo vị trí, giá, tiện ích
- Lưu trọ yêu thích
- Đăng tin cho thuê
- Chat / liên hệ với chủ nhà  


Ứng dụng hướng tới trải nghiệm người dùng trực quan, nhanh chóng và thân thiện.

## 📌 Các Tính Năng Chính

✨ **Tìm kiếm phòng trọ**  
🔍 Tìm theo khu vực, mức giá, loại phòng, tiện ích

🏷️ **Lọc & sắp xếp nâng cao**  
📅 **Lưu & quản lý hồ sơ phòng trọ yêu thích**

💬 **Liên hệ trực tiếp với chủ nhà**


## 🛠️ Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend:** Firebase / Flutter (Dart)
- **Database:** Firestore / Real-time DB
- **Authentication:** Email / Google Sign-In

## 🗂️ Cấu Trúc Dự Án

lib/
├── main.dart    

├── firebase_options.dart  

│

├── data/    

│   ├── models/ 

│   │   ├── conversation_model.dart

│   │   ├── location_model.dart

│   │   ├── message_model.dart

│   │   ├── room_model.dart

│   │   └── user_model.dart

│   │
│   └── services/                     # Service làm việc với Firebase / API
│       ├── auth_service.dart
│       ├── chat_service.dart
│       ├── favorite_service.dart
│       ├── image_service.dart
│       ├── location_service.dart
│       ├── room_service.dart
│       ├── storage_service.dart
│       └── user_service.dart
│
├── features/                         # Feature-based UI
│   ├── onboarding/                   # Màn hình giới thiệu
│   │   ├── loading_screen.dart
│   │   ├── onboarding_1.dart
│   │   └── onboarding_2.dart
│   │
│   ├── auth/                         # Xác thực người dùng
│   │   ├── login/
│   │   │   └── login_screen.dart
│   │   ├── register/
│   │   │   └── register_screen.dart
│   │   └── role_select/
│   │       └── role_select_screen.dart
│   │
│   ├── shared/                       # Chức năng dùng chung
│   │   └── chat/
│   │       ├── chat_screen.dart
│   │       └── conversation_list_screen.dart
│   │
│   ├── landlord/                     # Chức năng cho chủ trọ
│   │   ├── dashboard/
│   │   │   └── landlord_main_screen.dart
│   │   ├── home/
│   │   │   └── landlord_home_screen.dart
│   │   ├── add_room/
│   │   │   └── add_room_screen.dart
│   │   ├── manage_room/
│   │   │   ├── my_rooms_screen.dart
│   │   │   └── edit_room_screen.dart
│   │   ├── notification/
│   │   │   └── notification_screen.dart
│   │   └── profile/
│   │       └── profile_screen.dart
│   │
│   └── tenant/                       # Chức năng cho người thuê trọ
│       ├── tenant_main.dart
│       ├── home/
│       │   ├── home_screen.dart
│       │   └── widgets/
│       │       ├── banner_slider.dart
│       │       ├── filter_bar.dart
│       │       └── room_card.dart
│       │
│       ├── search/
│       │   └── search_screen.dart
│       │
│       ├── room_detail/
│       │   ├── room_detail_screen.dart
│       │   └── widgets/
│       │       ├── image_slider.dart
│       │       ├── landlord_info_card.dart
│       │       └── room_info_section.dart
│       │
│       ├── favorite/
│       │   ├── favorite_screen.dart
│       │   └── widgets/
│       │       └── favorite_room_card.dart
│       │
│       ├── notification/
│       │   └── notification_screen.dart
│       │
│       └── profile/
│           └── profile_screen.dart




## 📦 Hướng Dẫn Cài Đặt & Chạy Ứng Dụng

### 1️⃣ Chuẩn Bị

- Flutter SDK
- Android Studio / VSCode
- Tài khoản Firebase

### 2️⃣ Clone Repository

Cài Dependencies
flutter pub get
Chạy ứng dụng
flutter run

🧠 Hướng Dẫn Sử Dụng

Mở app → Đăng nhập

Tìm phòng theo khu vực

Lưu / phòng trọ

Chat với chủ nhà


