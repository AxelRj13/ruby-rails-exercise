class HomeController < ApplicationController
    # layout 'rumah' #set semua function agar menggunakan layout rumah.html.erb
    
    def index
        # instance variable, bisa langsung diakses di view
        @langs = ['ruby', 'java', 'php', 'golang', 'python']
        @title = 'Programming Language'

        @books = Book.all()
    end

    def halo
        # menangkap parameter GET dari URL
        # contoh : http://localhost:3000?title=....
        @title = params[:title]
        id = params[:id]

        book = Book.find_by(id:id)
        if book
            @title = book.title
        else
            @title = 'data tidak ditemukan'
        end

        # set halaman halo.html supaya render dari layout rumah.html.erb
        render layout: 'rumah'
    end
end