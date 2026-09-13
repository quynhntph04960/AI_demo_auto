# Cấu Trúc Project

Project dùng một clean architecture chung trong `lib/features`.

Không tạo dạng mỗi tính năng có một bộ clean riêng:

```text
lib/features/<feature>/data
lib/features/<feature>/domain
lib/features/<feature>/presentation
```

Hãy tạo dạng layer chung trước, tính năng nằm bên trong từng layer:

```text
lib/
├── base/
│   ├── config/
│   ├── constants/
│   ├── theme/
│   └── widgets/
└── features/
    ├── data/
    │   ├── datasources/<feature>/
    │   ├── models/<feature>/
    │   └── repositories/<feature>/
    ├── domain/
    │   ├── entities/
    │   ├── repositories/<feature>/
    │   └── usecases/<feature>/
    └── presentation/
        ├── pages/<feature>/
        └── widgets/<feature>/
```

Ví dụ với auth:

```text
lib/features/data/datasources/auth/...
lib/features/data/models/auth/...
lib/features/data/repositories/auth/...
lib/features/domain/entities/auth_contact.dart
lib/features/domain/repositories/auth/...
lib/features/domain/usecases/auth/...
lib/features/presentation/pages/auth/...
lib/features/presentation/widgets/auth/...
```

`lib/base` chỉ chứa code dùng chung toàn app như màu, theme, button, image widget,
config và các widget nền tảng.

