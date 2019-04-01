require 'rails_helper'

describe "user sees one article" do
    describe "they link from the articles index" do
        it "displays information from one article" do
            article_1 = Article.create!(title: "Title 1", body: "Body 1")
            comment_1 = article_1.comments.create(author_name: "Me", body: "Commenty comments")
            comment_2 = article_1.comments.create(author_name: "You", body: "So much to say")

            visit articles_path

            click_link(article_1.title)
            expect(page).to have_content(comment_1.author_name)
            expect(page).to have_content(comment_1.body)
            expect(page).to have_content(comment_2.author_name)
            expect(page).to have_content(comment_2.body)
            expect(page).to have_content(article_1.title)
            expect(page).to have_content(article_1.body)            
        end
    end

    describe 'they fill in a comment form' do
        it 'displays the comment on the article show' do
            article = Article.create!(title: "New Title", body: "New body rock my body baby")
        
            visit article_path(article)

            fill_in "comment[author_name]", with: "Me"
            fill_in "comment[body]", with: "So many good hard thoughts on this article"
            click_on "Submit"

            expect(current_path).to eq(article_path(article))
            expect(page).to have_content("Post a Comment")
            expect(page).to have_content("Me")
            expect(page).to have_content("So many good hard thoughts on this article")
        end
    end
end
