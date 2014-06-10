require 'spec_helper'

describe Command, :type => :model do

	context 'Command should save and be valid' do
    before { @command = FactoryGirl.build(:command) }

    it { expect(@command).to be_valid }
    specify {
      expect(@command.save).to eq(true)
      saved_command = Command.find(@command.id)
      expect(saved_command).to eq(@command)
    }
  end

  context 'Command should not be valid and not save' do
    before :each do
      @command = FactoryGirl.build(:command)
    end
    context 'when user_id is missing' do
      before { @command.user_id = ''}
      it{ expect(@command.valid?).to eq(false)}
      specify{expect(@command.save).to eq(false)}
    end

    context 'when what is missing' do
      before {@command.what = ''}
      it{ expect(@command.valid?).to eq(false)}
      specify{expect(@command.save).to eq(false)}
    end

    context 'when kind is missing' do
      before {@command.kind = ''}
      it{ expect(@command.valid?).to eq(false)}
      specify{expect(@command.save).to eq(false)}
    end

    context 'when bundleVersion is missing' do
      before {@command.bundleVersion = ''}
      it{ expect(@command.valid?).to eq(false)}
      specify{expect(@command.save).to eq(false)}
    end
    context 'when description is missing' do
      before {@command.description = ''}
      it{ expect(@command.valid?).to eq(false)}
      specify{expect(@command.save).to eq(false)}
    end
    context 'when bindingUsed is missing' do
      before {@command.bindingUsed = nil}
      it{ expect(@command.valid?).to eq(false)}
      specify{expect(@command.save).to eq(false)}
    end

    context 'when time is missing' do
      before {@command.time = nil}
      it{ expect(@command.valid?).to eq(false)}
      specify{expect(@command.save).to eq(false)}
    end

    context 'when time is not a number' do
      before {@command.time = 'abcde'}
      it{ expect(@command.valid?).to eq(false)}
      specify{expect(@command.save).to eq(false)}
    end
  end
end
