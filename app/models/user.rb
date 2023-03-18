# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are: :confirmable, and :omniauthable
  devise :database_authenticatable
  devise :registerable, :recoverable, :rememberable, :validatable, :lockable, :trackable, :timeoutable

  # Includes
  # Scopes
  # Constants
  # Callbacks
  before_create -> { email&.strip&.downcase }

  # Attr_accessors
  # Associations
  has_person_name

  # Validations
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  # Concerns
  # Delegations
  # Methods
end

# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`id`**                      | `bigint`           | `not null, primary key`
# **`current_sign_in_at`**      | `datetime`         |
# **`current_sign_in_ip`**      | `string`           |
# **`deleted_at`**              | `datetime`         |
# **`email`**                   | `string`           | `not null`
# **`encrypted_password`**      | `string`           | `default(""), not null`
# **`failed_attempts`**         | `integer`          | `default(0), not null`
# **`first_name`**              | `string`           | `not null`
# **`last_name`**               | `string`           | `not null`
# **`last_sign_in_at`**         | `datetime`         |
# **`last_sign_in_ip`**         | `string`           |
# **`locked_at`**               | `datetime`         |
# **`remember_created_at`**     | `datetime`         |
# **`reset_password_sent_at`**  | `datetime`         |
# **`reset_password_token`**    | `string`           |
# **`sign_in_count`**           | `integer`          | `default(0), not null`
# **`unlock_token`**            | `string`           |
# **`created_at`**              | `datetime`         | `not null`
# **`updated_at`**              | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_users_on_deleted_at`:
#     * **`deleted_at`**
# * `index_users_on_email` (_unique_):
#     * **`email`**
# * `index_users_on_reset_password_token` (_unique_):
#     * **`reset_password_token`**
# * `index_users_on_unlock_token` (_unique_):
#     * **`unlock_token`**
#
