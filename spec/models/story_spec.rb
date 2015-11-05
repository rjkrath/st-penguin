describe Story do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:narrative) }
  end

  describe '.one_previous' do
    context 'when there is a story with an id less than the current' do
      let!(:story_1) { create(:story) }
      let!(:story_2) { create(:story) }
      let!(:current_story) { create(:story) }

      it 'returns the story' do
        expect(described_class.one_previous(current_story.id)).to eq(story_2)
      end
    end

    context 'when there are no stories with an id less than the current' do
      it 'returns nil' do
        expect(described_class.one_previous(1)).to eq(nil)
      end
    end
  end
end
