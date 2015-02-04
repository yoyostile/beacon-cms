require 'rails_helper'

describe Entry do

  describe 'validations' do
    specify { is_expected.to validate_presence_of :image }
    specify { is_expected.to validate_presence_of :headline }
    specify { is_expected.to validate_presence_of :description }
    specify { is_expected.to validate_presence_of :uuid }
    specify { is_expected.to validate_presence_of :major }
    specify { is_expected.to validate_presence_of :minor }
    specify { is_expected.to validate_uniqueness_of(:uuid).scoped_to(:major, :minor)}
  end

end
