---
name: design-ui
description: Dựng hoặc cập nhật UI Flutter từ Figma cho project này. Dùng khi cần code màn hình app, thêm tính năng vào một clean architecture chung, áp dụng base theme/colors/widgets, hoặc tổ chức code theo quy ước layer của project.
---

# Design UI

## Quy Trình

1. Luôn lấy context Figma cho từng node được yêu cầu trước khi code.
2. Ưu tiên dùng các file base có sẵn:
   - Màu sắc: `lib/base/constants/app_colors.dart`
   - Theme: `lib/base/theme/app_theme.dart`
   - Widget dùng chung: `lib/base/widgets/`
   - Widget ảnh dùng chung: `lib/base/widgets/images/`
   - Cấu hình Figma: `lib/base/config/figma_config.dart`
3. Project chỉ dùng một clean architecture chung ở cấp `lib`, không tạo mỗi tính năng một bộ clean riêng.
4. Tính năng mới được chia vào trong từng layer chung theo tên nghiệp vụ:
   - `lib/features/data/datasources/<feature_name>/`
   - `lib/features/data/models`
   - `lib/features/data/repositories/<feature_name>`
   - `lib/features/domain/entities`
   - `lib/features/domain/repositories/<feature_name>`
   - `lib/features/domain/usecases/<feature_name>`
   - `lib/features/presentation/pages/<feature_name>`
   - `lib/features/presentation/widgets/<feature_name>`
5. Chỉ đặt code dùng chung toàn app trong `lib/base`.

## Quy Tắc UI

- Thiết kế mọi màn hình theo hướng multi-platform Flutter. Root page/screen luôn phải full width theo viewport; không khóa màn hình bằng `BoxConstraints(maxWidth: 414)` hoặc max-width cố định 414. Chỉ dùng constraints/tỉ lệ cho component con khi thật sự cần giữ hình dáng từ Figma.
- Tất cả màu phải lấy từ `AppColors`. Nếu Figma có màu mới, thêm vào `AppColors` trước rồi mới dùng.
- Button chính dùng `ButtonWidget`, trừ khi design cần một biến thể button dùng chung mới.
- Ô nhập liệu thật phải dùng `BaseTextField`. Không dựng ô nhập bằng `Container` + `Text` nếu đó là input trong Figma.
- Trường chọn dữ liệu như chi nhánh, dịch vụ, tỉnh/thành phải dùng `BaseDropdown` hoặc một biến thể base tương ứng, không dùng `BaseTextField` nếu Figma thể hiện đó là dropdown/select.
- Kích thước màn hình phải responsive, nhưng vẫn bám tỉ lệ Figma 414 x 896 bằng constraints, `AspectRatio`, `FractionallySizedBox`, `LayoutBuilder`, hoặc tính theo tỉ lệ khi cần đặt chính xác.
- Icon lấy từ Figma phải tải về project asset, không giữ URL network tạm thời. Lưu icon trong `assets/icons/`, đăng ký folder trong `pubspec.yaml`, gom path icon vào file constants của feature/base, và render bằng `ImageAssetWidget`.
- Ảnh lớn như background, banner, ảnh dịch vụ, ảnh marketing có thể dùng link network. Gom URL vào constants và render bằng `ImageNetworkWidget`.
- Chỉ dùng trực tiếp URL asset export từ Figma cho ảnh lớn hoặc trong lúc chờ tải icon. Không commit UI code có icon dùng URL Figma MCP tạm thời.
- Text và spacing phải bám Figma, sau đó chạy `dart format`, `flutter analyze`, và test liên quan.

## Quy Tắc Ảnh

- Dùng `ImageAssetWidget` cho asset local, đặc biệt là icon trong `assets/icons/`.
- Dùng `ImageNetworkWidget` cho ảnh remote lớn như background, banner, ảnh dịch vụ.
- Icon luôn phải có width/height rõ ràng hoặc parent constraint rõ ràng.
- Ảnh network luôn phải có fallback/error state.
- Ưu tiên `BoxFit.contain` cho icon và `BoxFit.cover` cho ảnh nền/photo.

## Nguồn Figma Hiện Tại

- Tên file: `Dong A app GĐ1`
- File key: `966yBMkqceWPplpDt90b8l`
- Config chính: `lib/base/config/figma_config.dart`
