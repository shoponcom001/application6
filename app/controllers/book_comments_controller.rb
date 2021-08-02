class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comments = Book.find(params[:book_id]).book_comments
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
  end

  def destroy
    @book_comments = Book.find(params[:book_id]).book_comments
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
