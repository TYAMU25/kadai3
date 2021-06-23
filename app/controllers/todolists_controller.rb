class TodolistsController < ApplicationController
  def index
    @books = book.all
  end
end
