# frozen_string_literal: true

class ContactRequest < ApplicationRecord
  validates :name, :email, :phone, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\+?[\d\s]{10,}\z/ }
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
