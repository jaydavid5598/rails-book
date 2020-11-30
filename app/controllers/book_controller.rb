class BookController < ApplicationController
    before_action :get_user
    before_action :get_book, only: %i[ show_book edit_book update_book delete_book ]

    def show_book
    end
   
    
    def public_book
        @book = Book.where(is_private: false)
    end
    
    def new_book
        @book = @user.books.new
    end

    def create_new_book
        @book =  @user.books.new(new_book_params)

        if @book.save
           redirect_to '/'
        else
            render :new_book
        end
    end

    def edit_book
    end

    def update_book
        if @book.update(new_book_params)
            redirect_to '/'
        else
            render :edit_book
        end
    end
    
        
    def delete_book
        @book.destroy
        redirect_to '/'
    end

    private 
    
    def get_user
        @user = User.find(current_user.id)
    end

    def get_book
        @book = Book.find(params[:id])
    end

    def new_book_params
        params.require(:book).permit(:title, :description, :is_private)
    end

end