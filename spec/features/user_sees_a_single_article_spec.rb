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
end
