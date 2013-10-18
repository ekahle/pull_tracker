require 'spec_helper'

describe PullManifest do
  it 'must have a valid factory' do
    expect(FactoryGirl.build(:pull_manifest)).to be_valid
    expect(FactoryGirl.create(:pull_manifest)).to be_true
    expect(FactoryGirl.create(:pull_manifest)).to be_true
  end

  it 'must have a pull ID' do
    expect(FactoryGirl.build(:pull_manifest, pull_id: nil)).to be_invalid
    expect(FactoryGirl.build(:pull_manifest, pull_id: '')).to be_invalid
  end
end
