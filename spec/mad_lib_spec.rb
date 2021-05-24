require 'rspec'
require 'pry'
require './lib/mad_lib'

RSpec.describe MadLib do
  describe 'Instantiation' do
    it '::new' do
      words = ['a', 'list', 'of', 'words']
      mad_lib = MadLib.new(words)

      expect(mad_lib).to be_an_instance_of(MadLib)
    end
  end

  describe 'Methods' do
    it '#get_random_word' do
      words = ['a', 'list', 'of', 'words']
      mad_lib = MadLib.new(words)

      expect(words).to include(mad_lib.get_random_word)
    end

    it '#build_phrase' do
      words = ['a', 'list', 'of', 'words']
      mad_lib = MadLib.new(words)
      allow(mad_lib).to receive(:get_random_word).and_return('zebra')

      phrase = 'And then she said _____, and all was well'
      expect(mad_lib.build_phrase(phrase)).to eq('And then she said zebra, and all was well')
    end
  end

  describe 'Scalability' do
    it 'can use a large array of words' do
      dictionary = File.read('/usr/share/dict/words') #this is a file that lives on your computer containing most english words.
      words = dictionary.split
      mad_lib = MadLib.new(words)
      allow(mad_lib).to receive(:get_random_word).and_return('aardvark')

      phrase = 'And then she said _____, and all was well'
      expect(mad_lib.build_phrase(phrase)).to eq('And then she said aardvark, and all was well')
    end
  end
end
