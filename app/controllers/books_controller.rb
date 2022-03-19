class BooksController < ApplicationController
    #index - menampilkan semua data buku - GET
    def index
        @books = Book.all.order(:id)
    end

    #show - menampilkan 1 data buku (detail) - GET
    def show
        @book = Book.find(params[:id])
    end

    #new - menampilkan halaman form create - GET
    def new
        @title = 'Books Title'
        @book = Book.new
    end

    #create - menangkap data untuk create - POST
    def create
        # render plain: params.inspect
        @title = 'Books Title'
        @book = Book.new(resource_params)
        if @book.save
            redirect_to '/books'
            flash[:notice] = "Thanks for submitting these questions"
        else
            render 'new', status: :unprocessable_entity
        end
    end

    #edit - menampilkan halaman form edit - GET
    def edit
        @title = 'EDIT DATA BOOK'
        @book = Book.find(params[:id])
    end

    #update - menangkap data untuk update - PATH / PUT
    def update
        @book = Book.find(params[:id])
        @book.update(resource_params)

        redirect_to '/books'
    end

    #destroy - menghapus data buku - DELETE
    def destroy
        book = Book.find(params[:id])
        book.destroy

        redirect_to '/books'
    end

    def active
        @books = Book.where(status: 1).order(:id)
        render 'index'
    end

    def toggle
        @book = Book.find(params[:id])
        @book.status = 0
        @book.save

        redirect_to '/books'
    end

    #function untuk memperbolehkan mass assignment ke dalam instance Book dari parameter request form
    private
    def resource_params
        params.require(:book).permit(:title, :page, :description)
    end

end