require 'rails_helper'

RSpec.describe 'user edits an article' do
    describe 'they link from a show page' do
        it 'edits the article' do
            article_1 = Article.create!(title: "Title 1", body: "Body 1")
            visit article_path(article_1)
            click_link("Edit")

            fill_in "article[title]", with: "New Title!"
            fill_in "article[body]", with: "New body!"
            click_on "Update Article"
            expect(current_path).to eq(article_path(article_1))
            expect(page).to have_content("New Title!")
            expect(page).to have_content("New body!")
        end
    end
end