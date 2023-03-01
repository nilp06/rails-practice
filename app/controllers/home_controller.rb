class HomeController < ApplicationController
    layout 'master'
    def index
        @name="Nil Patel"
        @college="LD Colleg of Engineering"
        @university="Gujarat Technological University"
        @branch="IT"
        @strength="Adaptability"
        @weekness="Regularity"
        @hobbie="Exploring Life"
    end
end
