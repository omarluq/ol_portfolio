# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
