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
require 'rails_helper'

RSpec.describe Incident, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
