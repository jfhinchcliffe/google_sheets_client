require 'rails_helper'

describe Topic do
  let(:subject) { described_class.new(title: 'Title', description: 'Description') }

  it { expect(subject.title).to eq 'Title' }
  it { expect(subject.description).to eq 'Description' }
end