# 語言與資料庫
- Ruby Version 3.0.0
- Rails Version 6.1.4
- 資料庫：SQLite3
- 前端：Bootstrap 5

# 專案內容
## 說明
  多人部落格，每個部落格會有一個擁有者與多個管理者，每個身份對於部落格與文章有不同權限
## 功能
1. If you register as a user, you can create one or more blogs
2. Multiple articles can be posted to a blog
3. Articles can be set to public or private
4. Users can be added to a blog
  1. The admin can add the blog user as manager and manage articles.
  2. Manager only allowed to post articles on partcipatng blogs.
## 使用步驟
1. bundle install
2. rails webpacker:install
3. rails db:migrate
4. rails s
