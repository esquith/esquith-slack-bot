# frozen_string_literal: true

# == Schema Information
#
# Table name: incidents
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  severity    :string
#  creator     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Incident < ApplicationRecord
end
