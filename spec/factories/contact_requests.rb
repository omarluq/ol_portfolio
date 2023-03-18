# frozen_string_literal: true

FactoryBot.define do
  factory :contact_request do
    name { 'MyString' }
    email { 'MyString' }
    phone { 'MyString' }
    message { 'MyText' }
  end
end

# ## Schema Information
#
# Table name: `contact_requests`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `bigint`           | `not null, primary key`
# **`email`**       | `string`           |
# **`message`**     | `text`             |
# **`name`**        | `string`           |
# **`phone`**       | `string`           |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
