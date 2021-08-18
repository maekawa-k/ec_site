module BooksHelper
    def current_favorite?(book, favorite)
        favorite.check_items.map{|i| i.book_id}.include?(book.id)
    end
    
end
