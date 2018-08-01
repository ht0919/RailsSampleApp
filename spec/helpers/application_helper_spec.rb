require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#page_title' do
    context '@title が指定されていない場合' do
      it 'デフォルトタイトルが返されること' do
        stub_const('ApplicationHelper::APP_NAME', 'Rails Sample App')
        expect(helper.page_title).to eq('Rails Sample App')
      end
    end

    context '@title が指定されている場合' do
      before do
        assign(:title, 'hoge')
      end

      it 'ページタイトルに @title が入った文字列が返されること' do
        stub_const('ApplicationHelper::APP_NAME', 'Rails Sample App')
        expect(helper.page_title).to eq('Rails Sample App | hoge')
      end
    end
  end
end
